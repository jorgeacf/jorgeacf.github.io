#!/bin/bash


export JEKYLL_VERSION=4.0

docker run --rm \
  -v="$PWD:/srv/jekyll" \
  -p 80:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --draft --incremental