FROM alpine:latest as builder

RUN apk add --no-cache git
RUN mkdir /opentelemetrycustom
RUN git clone https://github.com/chagraoui/kong-plugins-opentelemetry /opentelemetrycustom

FROM nexus.iobeya.fr/kong/kong:93a4bbfc6b21c62478be4ce2f3dab764c465e1d6
USER root

ENV KONG_PLUGINS="bundled,opentelemetrycustom"

RUN mkdir /usr/local/share/lua/5.1/kong/plugins/opentelemetrycustom
COPY --from=builder  /opentelemetrycustom/src/. /usr/local/share/lua/5.1/kong/plugins/opentelemetrycustom
USER kong
