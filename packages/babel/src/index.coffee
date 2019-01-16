# import dd from 'ddeyes'
import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (
  codeOrAst
  needRuntime = true
  astOpts = {}
) =>

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
        if needRuntime? is true
        then [ '@babel/plugin-transform-runtime' ]
        else []
      )...
    ]

  { code } = transform codeOrAst
  , {
    options...
    astOpts...
  }

  code
