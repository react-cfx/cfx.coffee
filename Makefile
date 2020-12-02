pjName := cfx.coffee

docker:
	podman run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

in:
	podman exec \
		-ti \
		${pjName} \
		/bin/bash
