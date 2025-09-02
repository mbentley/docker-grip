# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

# install python3
RUN apk --no-cache add python3

# cache buster
ARG GRIP_VERSION

# use uv in temporary mount & install grip
RUN --mount=from=ghcr.io/astral-sh/uv,source=/uv,target=/bin/uv \
  uv venv /opt/venv &&\
  uv pip install --python /opt/venv --no-cache grip &&\
  mkdir /.grip &&\
  mkdir /data &&\
  chown 1000:1000 /.grip

# add venv to PATH and suppress syntax warnings
ENV PATH="/opt/venv/bin:${PATH}" \
  PYTHONWARNINGS="ignore::SyntaxWarning"

USER 1000
WORKDIR /data
ENTRYPOINT ["grip"]
CMD ["--help"]
