#FROM alpine:latest as builder

#RUN apk add --no-cache git
#RUN mkdir /opentelemetrycustom
##RUN git clone https://github.com/chagraoui/kong-plugins-opentelemetry /opentelemetrycustom

FROM nexus.iobeya.fr/kong/kong:5c5eda5c4439bf97e2d6c37e45b90775f9ea85da
USER root

ENV KONG_PLUGINS="bundled,opentelemetrycustom"

RUN mkdir /usr/local/share/lua/5.1/kong/plugins/opentelemetrycustom
COPY . /usr/local/share/lua/5.1/kong/plugins/opentelemetrycustom
USER kong
