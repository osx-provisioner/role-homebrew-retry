#!/bin/bash

set -o pipefail

main() {

  pip install poetry
  poetry install

}

main "$@"
