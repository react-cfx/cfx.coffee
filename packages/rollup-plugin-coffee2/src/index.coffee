# import dd from 'ddeyes'
import formatError from './format-error'
import coffee from 'coffeescript'
import path from 'path'
import {
  createFilter
  addExtension
} from 'rollup-pluginutils'
import {
  getAST
  ricffAST
  ASTToCode
} from './util'

sourceMap = (out) =>

  if out.v3SourceMap
  then JSON.parse out.v3SourceMap
  else null

export default (opts = {}) =>

  opts.bare       ?= true
  opts.sourceMap  ?= true

  filter = createFilter(
    opts.include
    opts.exclude
  )

  name: 'coffee2'
  transform: (code, id) =>

    return {
      code
    } unless filter id 

    return {
      code
    } unless (path.extname id) is '.coffee'

    try
      out = coffee.compile code
      ,
        filename:  id
        bare:      opts.bare
        sourceMap: opts.sourceMap
      
    catch err

      if err.location?
        err.formattedMessage = formatError(
          code, id, err
        )

      throw err

    _code = ASTToCode ricffAST(
      getAST out.js
      path.dirname id
    )

    code: _code
    map: sourceMap out
