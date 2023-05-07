#! /bin/bash

function source_file() {
  NAME_IN_PASCAL_CASE=$(KEBAB_TO_CAMEL_CASE $1)

  echo "
  const $NAME_IN_PASCAL_CASE = function() {
  return 1;

  exports.$NAME_IN_PASCAL_CASE = $NAME_IN_PASCAL_CASE
}
"
}

function test_file() {
  NAME_IN_PASCAL_CASE=$(KEBAB_TO_CAMEL_CASE $1)
  TEST_NAME=$(SPLIT_WORDS_IN_KEBAB_CASE $1)

  echo "
  const {describe, it} = require('node:test');
  const {strictEqual} = require('assert');
  const {$NAME_IN_PASCAL_CASE} = require('../src/$PROJECT_NAME.js');

  describe('$TEST_NAME', function() {
  it('should pass', function() {
  strictEqual(1, 1);
});

it('should fail', function() {
strictEqual(1, 0);
});
});
"
}

function gitignore() {
  echo "
  *.sw.*
  DS.*
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
  source_file $PROJECT_NAME > src/$PROJECT_NAME.js

  # set up test file
  test_file $PROJECT_NAME > test/$PROJECT_NAME-test.js

  # setting up .gitignore file to ignore .swp files
  gitignore > .gitignore

  # git init
  git init
  git add .
  git status

  # run a test
  node test/*
}

create_Repo $1
