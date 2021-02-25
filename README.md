# devcrate
Dotfiles &amp; containers

## Intro
The two aims in this project:
- dotfiles - version controlling and automating installing my configuration files
- devcrate - packaging my development tools into a docker containers for portablity

### Devcrate
Package move dev tools, config into Docker container to make them more portable:
- base image:
    - `devcrate` `neovim` `tmux` `zsh` `docker` `entr` `git` `ssh` `htop` `jq`
- extended with additinal with additional tools for cloud computing:
    - `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli, helm, terraform, iputils dnsutils`

## Setup
### Dotfiles
Prerequisites: `make`
1. Clone this repository
2. Install the command line dotfiles to your home directory:
```sh
make -C dotfiles/base
```

### devcrate Containers
Prerequisites: `docker` &amp; macos/Linux
1. Running devcrate containers:
```sh
docker run -it \
    -u $UID:$GID \
    --network=host \
    -v /thing/to/work/on:/home/work \
    -v /var/run/docker.sock:/var/run/docker.sock \
    mrzzy/devcrate
```
