# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --no-cache add py-pip &&\
  pip install grip &&\
  mkdir /.grip && mkdir /data

USER 1000
WORKDIR /data
ENTRYPOINT ["grip"]
CMD ["--help"]
