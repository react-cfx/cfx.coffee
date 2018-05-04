# import dd from 'ddeyes'
import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (codeOrAst) ->

  transform =
    if typeof codeOrAst is 'string'
    then transformSync
    else (ast, options) ->
      transformFromAst ast, ''
      , options

  prefixEsNumber = (_Number) ->
    if typeof _Number is 'number'
    then "es#{_Number}"
    else _Number
    # targets:
    #   node: true

  options = {
    (
      if ops?.presets?
      then (
        if Array.isArray ops.presets
        then (
          presets:
            ops.presets.reduce (r, c) ->
              [
                r...
                [
                  "@babel/preset-#{prefixEsNumber c}"
                ]
              ]
            , []
        )
        else (
          presets: (Object.keys ops.presets).reduce (r, k) ->
            [
              r...
              [
                "@babel/preset-#{prefixEsNumber k}"
                (
                  if typeof ops.presets["#{k}"] is 'object'
                  then [ ops.presets["#{k}"] ]
                  else []
                )...
              ]
            ]
          , []
        )
      )
      else {}
    )...
    ( do ->
      conf = plugins: []
      flag = false

      # runtime
      if ops?.runtime?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-runtime'
          moduleName: '@babel/runtime'
        ]

      # regenerator
      if ops?.regenerator?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-regenerator'
        ]

      # spread
      if ops?.spread?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-spread'
        ]

      # commonjs
      if ops?.commonjs?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-modules-commonjs'
          (
            if typeof ops.commonjs is 'object'
            then [ ops.commonjs ]
            else []
          )...
        ]

      if flag is false
        return {}
      else
        return conf
    )...
  }

  es5 = transform codeOrAst
  , options

  es5.code
