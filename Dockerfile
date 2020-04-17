FROM localhost/spin-archetype-base

RUN mkdir -p /spin && mkdir -p /input && mkdir -p /target
COPY compile.sh /spin

WORKDIR /spin

ENTRYPOINT /spin/compile.sh


