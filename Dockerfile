FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk --no-cache add py-pip &&\
  pip install grip &&\
  mkdir /.grip && mkdir /data

USER 1000
WORKDIR /data
ENTRYPOINT ["grip"]
CMD ["--help"]
