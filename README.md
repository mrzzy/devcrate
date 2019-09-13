# devcrate 
Containerized Development Enviroment

## Intro
An attempt to move all tools, configuration into Docker containers:
- containers are portable, so I can develop anywhere
- containers only bundle what is required, making them small.
- containers are composable, so I make variants for different languages and situations.

## Architecture
devcrate is composed of docker images of increasing amounts of dev tooling:
- base image with just the basics (editor, git, tmux, zsh, fzf, make, docker in docker...)
    - `devcrate-mini` - Alphine based basic development image optimized for size
    - `devcrate-base` - Ubuntu based basic development image
- extended with additinal dev tooling/language support
    - `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli`
    - `devcrate-python` - python support: `pip,python,virtualenv`
    - `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
    - `devcrate-java` - java support: `java, jdk`
    - `devcrate-golang` - golang support
    - `devcrate-nodejs` - nodejs support: `node`
    - `devcrate-c` - c/c++ support: `gcc, clang, cmake`
- full blown development envrionment:
    - `devcrate-py-ml` - python machine learning stack: `scikit-learn, tensorflow, jupyter-lab, pandas, seaborn,...`

## Roadmap
### Version 0.2a
- clean up and split up configuration files
- `devcrate-base` - Ubuntu based basic development image
- `devcrate-mini` - Alphine based basic development image optimized for size

### Version 0.4a
- `devcrate-cloud` - cloud computing support: `kubectl, gcloud, awscli`
- `devcrate-python` - python support: `pip,python,virtualenv`

### Version 0.5b
- `devcrate-py-ml` - python machine learning stack: `scikit-learn, tensorflow, jupyter-lab, pandas, seaborn,...`
- `devcrate-scala` - scala support: `java, scala, sbt, metals.vim`
