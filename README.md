# Usage

Provides a setup script on a new machine that:
- Installs required tools
- Creates symlinks for config files

```sh
git clone git@github.com:zachlambert/dev-tools.git
cd dev-tools
./install.sh
```

Additionally, if developing within a container, provides a dockerfile/compose that:
- Installs dev tools on top of an existing development container
- Mounts directories for config files

Note, the above assumes that the dev container is setup for your user, such that config files are installed under your user.

The container is used with:
```sh
docker compose build my-dev-container
docker compose up my-dev-container
```

Where `my-dev-container` is a service created within `compose.yaml`. An example is given, but should be edited to match the name of your particular dev container. Multiple services can be added if you have multiple dev containers.
