#! /bin/zsh

function MAIN() {
  TEXT="
  const {} = require('src/rename-it-later.js');

  const main = function() {\n}

  main();
  "

  echo $TEXT
}

function TEST_FILE() {
  TEXT="
  const {describe, it} = require('node:test');
  const {deepStrictEqual} = require('assert');

  describe('', function() {\nit('should', function() {
  \ndeepStrictEqual();\n});\n});
  "

  echo $TEXT
}

function TODO() {
  TEXT="
  Checklist\n
  ✔ Think through every layer of project\n
  ✔ Search Theasaurus synonyms (should be domain specific)\n
  ✔ git commit\n
  ✔ git push
  ----------------\n
  ✔ What is ...?
  ----------------\n
  ✔ What can we perform on ...?
  ----------------\n
  ✔ What should we like to do with ...?
  ----------------\n
  ✔ Write test for auxiliary functions
  ----------------\n
  ✔ Write test for main functions
  ----------------\n
  "
  echo $TEXT
}

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
