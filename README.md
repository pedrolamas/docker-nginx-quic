# docker-nginx-quic

[![Project Maintenance](https://img.shields.io/maintenance/yes/2022.svg)](https://github.com/pedrolamas/docker-nginx-quic 'GitHub Repository')
[![License](https://img.shields.io/github/license/pedrolamas/docker-nginx-quic.svg)](https://github.com/pedrolamas/docker-nginx-quic/blob/master/LICENSE 'License')

[![Release](https://github.com/pedrolamas/docker-nginx-quic/workflows/Release/badge.svg)](https://github.com/pedrolamas/docker-nginx-quic/actions 'Build Status')

[![Twitter Follow](https://img.shields.io/twitter/follow/pedrolamas?style=social)](https://twitter.com/pedrolamas '@pedrolamas')

Simple Docker image running [nginx-quic](https://hg.nginx.org/nginx-quic).

This repo will run a GitHub action every hour to check for a new nginx release, and creates a new Docker image if it finds one.

## Usage

Just follow the instructions from the [official nginx docker image](https://hub.docker.com/_/nginx/), replacing the image name "nginx" with "ghcr.io/pedrolamas/nginx-quic"

## License

MIT
