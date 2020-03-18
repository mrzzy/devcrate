# devcrate 
Dotfiles &amp; containers

## Intro
The two aims in this project:
- dotfiles - version controling and automate installing dotfiles
- devcrate - packaging my development tools into a docker containers for portablity

## Setup
### Dotfiles
Prequisites: `make`
1. Clone this repository
2. Install the command line dotfiles to your home directory:
```sh
make -C dotfiles/base
```

### devcrate Containers
Prequisites: `docker` &amp; macos/Linux
1. Pull and run docker images:
```sh
docker run -it \
    -u $UID:$GID \
    --network=host \
    -v /thing/to/work/on:/home/work \
    # optional: for docker in docker
    -v /var/run/docker.sock:/var/run/docker.sock \
    mrzzy/devcrate:latest # or mrzzy/devcrate-<variant>
```

## Design

### devcrate
An attempt package move dev tools, config into Docker container to make them more portable:
- base image:
    - `devcrate` `neovim` `tmux` `zsh` `docker` `entr` `git` `ssh` `htop` `jq`
- extended with additinal dev tooling/language support
    - `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli, helm, terraform, iputils, dnsutils`
    - `devcrate-python` - python support: `pip,python,virtualenv`
    - `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
    - `devcrate-java` - java support: `java, openjdk`
    - `devcrate-golang` - golang support
    - `devcrate-nodejs` - nodejs support: `node`
    - `devcrate-c` - c/c++ support: `gcc, clang, cmake, ccls`
- full blown development envrionment:
    - `devcrate-ml` - python machine learning stack: `scikit-learn, tensorflow, jupyter-lab, pandas, seaborn,...`
- full blown desktop envrionment
    - `devcrate-i3` - i3/gui support: `i3,polybar,nitrogen,firefox`

## Roadmap
### Version 0.2.0
- clean up and split up configuration files
- `devcrate` - Ubuntu based basic development image
- `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli`

### Version 0.3.0
- `devcrate-golang` - golang support
- `devcrate-python` - python support: `pip,python,virtualenv`
- `devcrate-nodejs` - nodejs support: `node`

### Version 0.4.0
- `devcrate-java` - java support `openjdk, java, mvn, gradle`
- `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
- `devcrate-ml` - python machine learning stack: `scikit-learn, tensorflow, jupyter-lab, pandas, seaborn,...`
