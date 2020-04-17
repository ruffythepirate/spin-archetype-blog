FROM localhost/spin-archetype-base

RUN mkdir -p /spin && mkdir -p /source && mkdir -p /target
COPY compile.sh /spin
COPY templates /spin/templates
COPY css /spin/css

WORKDIR /spin

ENTRYPOINT /spin/compile.sh


