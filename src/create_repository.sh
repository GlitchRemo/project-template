#! /bin/bash

function source_file() {
  echo "
  const $NAME_IN_KEBAB_CASE = function() {
  return 1;

  exports.$NAME_IN_KEBAB_CASE = $NAME_IN_KEBAB_CASE
}
"
}

function test_file() {
  echo "
  const {describe, it} = require('node:test');
  const {strictEqual, deepStrictEqual} = require('assert');
  const {$NAME_IN_KEBAB_CASE} = require('../src/$PROJECT_NAME.js');

  describe('', function() {
  it('', function() {
  strictEqual(1, 1);
});
});
"
}

function create_Repo() {
  PROJECT_NAME=$1

  # setting up repository
  mkdir -p $PROJECT_NAME/src $PROJECT_NAME/test
  cd $PROJECT_NAME

  # snake case to kebab case
  NAME_IN_KEBAB_CASE=$(node -p "'$PROJECT_NAME'.replace(/-/g, '_')")

  # set up source file
  source_file > src/$PROJECT_NAME.js

  # set up test file
  test_file > test/$PROJECT_NAME-test.js

  # setting up .gitignore file to ignore .swp files
  echo "
  *.swp
  DS.*
  " > .gitignore

  # git init
  git init
  git add .
  git status

  # run a test
  node test/*
}

create_Repo $1
