target:=$(realpath ./target)

clean:
	rm -r ./target
	mkdir target
build:
	podman build -t spin-archetype-blog:latest .
run:
ifndef SPIN_ROOT
	  $(error Need to set SPIN_ROOT to root folder)
endif
	podman run --rm -v ${SPIN_ROOT}/source:/source:Z -v ${SPIN_ROOT}/target:/target:Z spin-archetype-blog:latest
.ONE_SHELL:
test-run: build clean
ifndef SOURCE
	`error Need to set SOURCE to folder to test on.`
endif
	podman run --rm -e RELATIVE_PATH=. -v ${SOURCE}:/source:Z -v ${target}:/target:Z spin-archetype-blog:latest
