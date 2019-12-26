# devcrate 
Containerized Development Enviroment

## Intro
An attempt to move all tools, configuration into Docker containers:
- containers are portable, so I can develop anywhere
- containers only bundle what is required, making them small.
- containers are composable, so I make variants for different languages and situations.

## Architecture
devcrate is composed of docker images of increasing amounts of dev tooling:
- base image with just the basics
    - `devcrate` - Ubuntu based basic development image:
        - `neovim` - main editor
        - `tmux` - terminal multiplexer
        - `zsh` - shell
        - `docker` - docker in docker
        - `entr` - file watch for rebuild on file load
        - `git` - version control
        - `ssh` - ssh tunneling
        - `htop` - process monitoring
- extended with additinal dev tooling/language support
    - `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli`
    - `devcrate-python` - python support: `pip,python,virtualenv`
    - `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
    - `devcrate-java` - java support: `java, jdk`
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
- `devcrate-python` - python support: `pip,python,virtualenv`
- `devcrate-ml` - python machine learning stack: `scikit-learn, tensorflow, jupyter-lab, pandas, seaborn,...`

### Version 0.2.0
- `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
- `devcrate-nodejs` - nodejs support: `node`
- `devcrate-golang` - golang support
