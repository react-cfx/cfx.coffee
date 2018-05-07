# import dd from 'ddeyes'
import path from 'path'
import {
  createFilter
} from 'rollup-pluginutils'
import {
  getAST
  ricffAST
  ASTToCode
} from './util'

export default (opts = {}) =>

  filter = createFilter(
    opts.include
    opts.exclude
  )

  name: 'babel'
  transform: (code, id) =>

    return {
      code
    } unless filter id 

    return {
      code
    } unless (path.extname id) is '.js'

    _code = ASTToCode(
      getAST code
      false
    )

    _code
