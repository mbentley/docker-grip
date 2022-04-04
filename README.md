# mbentley/grip

docker image for grip
based off of mbentley/alpine:latest

To pull this image:
`docker pull mbentley/grip`

Example usage:

```
docker run -it --rm -p 8080:8080 \
  -v ${PWD}:/data \
  -v ~/.grip:/.grip \
  mbentley/grip \
  --context=username/repo README.md 0.0.0.0:8080
```
