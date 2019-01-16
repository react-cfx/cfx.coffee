# import dd from 'ddeyes'
import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (
  codeOrAst
  opts = {}
) =>
  needRuntime = true
  astOpts = opts
  {
    needRuntime
    astOpts...
  } = opts if opts.needRuntime?

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
        if needRuntime? and (
          needRuntime is true
        )
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
