# import dd from 'ddeyes'
import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (codeOrAst, opts) =>

  {
    runtime
    ast
    othopts...
  } = opts

  ast = {
    ast...
    othopts...
  }

  transform =
    if typeof codeOrAst is 'string'
    then transformSync
    else (ast, options) =>
      transformFromAst ast, ''
      , options

  options =
    presets: [
      "@babel/preset-env"
    ]
    plugins: [
      (
        if runtime? is true
        then [ '@babel/plugin-transform-runtime' ]
        else []
      )...
    ]

  { code } = transform codeOrAst
  , {
    options...
    (
      if ast?
      then opts.ast
      else {}
    )...
  }

  code
