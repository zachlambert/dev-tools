local wezterm = require('wezterm')

local docker = {}

function docker.get_containers()
  local docker_list = {}
  local success, stdout, stderr = wezterm.run_child_process {
    'docker',
    'container',
    'ls',
    '--format',
    '{{.ID}}:{{.Names}}',
  }
  for _, line in ipairs(wezterm.split_by_newlines(stdout)) do
    local id, name = line:match '(.-):(.+)'
    if id and name then
      docker_list[id] = name
    end
  end
  return docker_list
end

function docker.get_containers_list()
    local list = docker_list()
    local str = ''
    for id, name in pairs(list) do
        str = str..name..'\n'
    end
    return str
end

function make_docker_label_func(id)
  return function(name)
    local success, stdout, stderr = wezterm.run_child_process {
      'docker',
      'inspect',
      '--format',
      '{{.State.Running}}',
      id,
    }
    local running = stdout == 'true\n'
    local color = running and 'Green' or 'Red'
    return wezterm.format {
      { Foreground = { AnsiColor = color } },
      { Text = 'docker container named ' .. name },
    }
  end
end

function make_docker_fixup_func(id)
  return function(cmd)
    cmd.args = cmd.args or { '/bin/bash' }
    local wrapped = {
      'docker',
      'exec',
      '-it',
      id,
    }
    for _, arg in ipairs(cmd.args) do
      table.insert(wrapped, arg)
    end

    cmd.args = wrapped
    return cmd
  end
end

function compute_exec_domains()
  local exec_domains = {}
  for id, name in pairs(docker.get_list()) do
    table.insert(
      exec_domains,
      wezterm.exec_domain(
        'docker:' .. name,
        make_docker_fixup_func(id),
        make_docker_label_func(id)
      )
    )
  end
  return exec_domains
end

return docker
