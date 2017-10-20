# f5-bigip-agc-config-guides

[![Build Status](https://travis-ci.org/f5devcentral/f5-bigip-agc-config-guides.svg?branch=master)](https://travis-ci.org/f5devcentral/f5-bigip-agc-config-guides)

This repository contains Access Guided Config (AGC) files and templates. Configuration Guides for following AGC Usecase/Templates are automatically generated from JSON  using the templates in the project directories.

1. **SAML Identity Provider for SaaS Application** : SaaS Application Template
2. **SAML Service Provider** : IdP Connector Template

Further, Configuration Guides for each are created under respective Usecase Pack Version branch.

## Documentation

This project uses CI/CD to build, test, and deploy documentation.

**Tools:**
- `sphinx`: builds HTML, checks syntax, and tests links.
- [f5-sphinx-theme](https://github.com/f5devcentral/f5-sphinx-theme): F5 theme for sphinx projects.
- `write-good`: tests grammar.
- Travis-CI: builds, tests, and deploys documentation.
- AWS S3: static website hosting.

**Scripts:**
- *deploy-docs*: Runs a Docker container with the credentials required to publish to clouddocs.f5.com.
- *docker-docs*: Runs a Docker container mounted to the current working directory.
- *merge-docs*: Combines docs from various locations to the /source directory.
- *test-docs*: runs the HTML build, grammar check, and linkcheck.

### Building and Testing
You can use the commands below to build and test your work.
Commands beginning with `docker` run in a Docker container using the same image used in Travis-CI ([f5devcentral/containthedocs](https://hub.docker.com/r/f5devcentral/containthedocs/)).


| Command                | Description                                            |  
|------------------------|--------------------------------------------------------|
| `make docs`            | basic HTML build                                       |
| `make livedocs`        | builds docs as you write; view changes live in browser |
| `make testdocs`        | run the docs tests                                     |  
| `make docker-docs`     | basic HTML build in a Docker container                 |
| `make docker-livedocs` | builds docs in a Docker container as you write         |
| `make docker-testdocs` | runs docs tests in a Docker container                  |

Note: If you don't use the Docker container, you need to install the project dependencies locally.

```
virtualenv <my-venv>
pip install -r requirements.txt
```

You can find instructions for installing/using virtualenv and pip [here](https://packaging.python.org/guides/installing-using-pip-and-virtualenv/).
