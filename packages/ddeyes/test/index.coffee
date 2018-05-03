#!/usr/bin/env coffee
require 'shelljs/make'
dd = require '../src'

echo = console.log

target.all = ->
  a =
    b: "Hello World!!!"
    c: [
      "Hello"
      "World"
    ]
  dd a
