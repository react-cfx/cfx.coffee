#!/usr/bin/env coffee

# require 'coffee-require/register'

# _require = require 'cfx.require'
# coffee = require '../index'
# { register } = _require [
#   coffee()
# ]
# register()

_require = require 'cfx.require'
{ gdf } = _require

register = gdf require '../dist/main/register'
register gdf _require

require './Makefile'
