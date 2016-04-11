FROM oarfish/alpine-fsharp:latest

RUN apk add --update bash
RUN apk add make
RUN apk add curl
RUN mkdir -p /app
WORKDIR /app

COPY makefile /app
RUN make bootstrap
COPY paket.dependencies /app
RUN make install
COPY . /app
RUN make build
