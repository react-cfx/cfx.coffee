# import dd from 'ddeyes'
import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (codeOrAst, opts) =>

  transform =
    if typeof codeOrAst is 'string'
    then transformSync
    else (ast, options) =>
      transformFromAst ast, ''
      , options

  options =
    presets: [
      "@babel/preset-es2015"
      "@babel/preset-stage-3"
    ]

  { code } = transform codeOrAst
  , {
    options...
    opts...
  }

  code
