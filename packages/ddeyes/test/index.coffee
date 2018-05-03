#!/usr/bin/env coffee
require 'shelljs/make'
dd = (
  require '../dist'
).default

echo = console.log
echo typeof dd
echo Object.keys dd

target.all = ->
  a =
    b: "Hello World!!!"
    c: [
      "Hello"
      "World"
    ]
    e: =>
  echo a
  dd a
