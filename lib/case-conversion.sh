#! /bin/bash

function KEBAB_TO_CAMEL_CASE() {
  TEXT=$1
  echo $(node -p "'$TEXT'.replace(/-(.)/g, function(a, b){ return b.toUpperCase();})")
}

function SPLIT_WORDS_IN_KEBAB_CASE() {
  TEXT=$1
  echo $(node -p "'$TEXT'.replace(/-/g, " ")")
}

