build:
	podman build -t spin-archetype-blog:latest .
run:
ifndef SPIN_ROOT
	  $(error Need to set SPIN_ROOT to root folder)
endif
	podman run --rm -v ${SPIN_ROOT}/source:/source:Z -v ${SPIN_ROOT}/target:/target:Z spin-archetype-blog
echo:
	echo ${SPIN_ROOT}
	echo ${spin_root}
