import dd from 'ddeyes'
import 'shelljs/make'

import CoffeeScript from 'coffeescript'

import fs from 'fs'
import path from 'path'

import {
  coffee2ToEs6
  es6ToEs5
} from '../src/compiler'

import getRequire, { gdf } from 'cfx.require'

# import coffee from '../dist/main'
import coffee from '../src'
import _coffee from './coffee'

target.all = ->
  dd 'Hello Wolrd!!!'

target.ext = ->
  dd CoffeeScript.FILE_EXTENSIONS

target.compile = ->

  code = fs.readFileSync (
    # path.join __dirname, '../src/compiler.coffee'
    path.join __dirname, './coffee/index.coffee'
  )
  , 'utf-8'

  es6 = coffee2ToEs6 code
  console.log es6

  es5 = es6ToEs5 es6
  console.log es5

target.require = ->

  # console.log coffee().compiler "import dd from 'ddeyes'"
  # console.log coffee().compiler """
  #   hello = ->
  #     await world()
  # """

  CS = getRequire [
    coffee()
  ]

  do gdf await CS.require './coffee/inside'
  do gdf await CS.require path.join __dirname, './coffee/inside'
  # do gdf await CS.require './coffee'

target.coffee = ->

  # CS = getRequire [
  #   coffee()
  # ]

  # do CS.gdf _coffee
  _coffee()
