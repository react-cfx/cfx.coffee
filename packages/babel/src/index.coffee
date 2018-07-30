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
      "@babel/preset-env"
    ]
    plugins: [
      '@babel/plugin-transform-runtime'
    ]

  { code } = transform codeOrAst
  , {
    options...
    opts...
  }

  code
