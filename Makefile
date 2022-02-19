POLLEN_TAG := pollen:latest
POLLEN := podman run --rm \
	--volume "$$(pwd):/work" \
	-p 8080:8080 \
	${POLLEN_TAG}

.PHONY: watch
watch: src
	${POLLEN} start src

.PHONY: publish
publish: reset render
	${POLLEN} publish src site

.PHONY: render
render: src
	${POLLEN} render src

.PHONY: pollen-reset
reset:
	${POLLEN} reset

.PHONY: image
image:
	buildah build --tag ${POLLEN_TAG} .
