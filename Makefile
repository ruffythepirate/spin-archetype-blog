build:
	podman build -t spin-archetype-blog:latest .
run:
ifndef SPIN_ROOT
	  $(error Need to set SPIN_ROOT to root folder)
endif
	podman run --rm -v ${SPIN_ROOT}/source:/source:Z -v ${SPIN_ROOT}/target:/target:Z spin-archetype-blog:latest
test-run: build
ifndef SOURCE
	`error Need to set SOURCE to folder to test on.`
endif
	podman run --rm -v ${SOURCE}:/source:Z -v ./target:/target:Z spin-archetype-blog:latest
