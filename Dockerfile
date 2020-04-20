FROM localhost/spin-archetype-base

RUN mkdir -p /spin && mkdir -p /source && mkdir -p /target
COPY templates /spin/templates
COPY css /spin/css

COPY *.sh /spin
WORKDIR /spin
ENTRYPOINT /spin/compileIndex.sh


