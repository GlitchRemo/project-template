#! /bin/bash

function MAIN() {
  TEXT="
  const {} = require("src/rename-it-later.js");

  const main = function() {\n}

  main();
  "

  echo $TEXT
}

# function TEST_FILE() {
# }

# function TODO() {
# }

function INITIALIZE() {

  mkdir src test

  touch src/rename-it-later.js

  MAIN > main.js

  TEST_FILE > test/rename-it-later-test.js

  TODO > TODO

  git init
  git add -A
  git commit -m "Initial commit"

  vim TODO

}

INITIALIZE
