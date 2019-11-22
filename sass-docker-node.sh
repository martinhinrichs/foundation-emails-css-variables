#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$(docker images -q node-sass 2> /dev/null)" == "" ]]; then
  docker build -t node-sass $DIR/docker-node-sass;
fi

docker run --rm -v"$DIR/scss":/scss node-sass node-sass /scss/foundation-emails.scss > $DIR/dist/foundation-emails.css

echo "saved dist/foundation-emails.css";