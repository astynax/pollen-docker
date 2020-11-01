# Pollen Docker

A Docker image for the [Pollen](https://docs.racket-lang.org/pollen/index.html) system.

## Usage

- `make image` builds the image itself,
- `make watch` mounts `./` as a volume and runs a pollen's dev-server (in the container),
- `make reset` cleans all the generated files,
- `make render` builds a site from the sources,
- `make publish` builds a site from scratch (`reset` + `render`) and puts it into the `./site` directory.
