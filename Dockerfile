# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

# cache buster
ARG GRIP_VERSION

RUN apk --no-cache add py-pip &&\
  pip install grip &&\
  mkdir /.grip && mkdir /data

USER 1000
WORKDIR /data
ENTRYPOINT ["grip"]
CMD ["--help"]
