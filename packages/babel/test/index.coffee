import dd from 'ddeyes'
import 'shelljs/make'
import fs from 'fs'
import path from 'path'

import CoffeeScript from 'coffeescript'
import * as babylon from 'babylon'

import es6ToEs5 from '../dist/index'

target.all = ->
  dd 'Hello Wolrd!!!'

target.compile = ->

  file = path.join __dirname, '../src/index.coffee'
  coffee = fs.readFileSync file
  , 'utf-8'

  es6 = CoffeeScript.compile coffee
  es5 = es6ToEs5 es6

  console.log es5

es6 = """
  import hello from 'hello';

  var c = ['a', 'b', 'c'];
  var d = [...a, 'foo'];

  function* a() {
    yield hello(1);
  }

  hello = name => `Hello ${name}!!`

  export default async function b() {
    await request('url');
  };
"""

target.async = ->
  
  es5 = es6ToEs5 es6
  # ,
    # presets: 2015
    # runtime: true
    # regenerator: true
    # spread: true

  console.log es5

target.ast = ->

  ast = babylon.parse es6
  ,
    sourceType: 'module'

  console.log es6ToEs5 ast
  # ,
    # presets: true
    # regenerator: true
    # spread: true

target.default = ->
  code = """
  import num from 'num';
  export default 42;
  """

  es5 = es6ToEs5 code
  # ,
  #   presets: [
  #     2015
  #     2016
  #     2017
  #   ]
  #   runtime: true
  #   commonjs: 
  #     noInterop: true

  console.log es5
