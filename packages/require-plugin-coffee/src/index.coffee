import dd from 'ddeyes'
import CoffeeScript from 'coffeescript'
import {
  coffee2ToEs6
  es6ToEs5
} from './compiler'

export default (ops) =>

  name: 'coffeescript'
  exts: CoffeeScript.FILE_EXTENSIONS

  compiler: (code, id) =>
    # dd id
    es6ToEs5 coffee2ToEs6 code
