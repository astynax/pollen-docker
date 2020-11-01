POLLEN_TAG := pollen:latest
POLLEN := docker run --rm \
	-u $$(id -u):$$(id -g) \
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
	docker build --tag ${POLLEN_TAG} .
