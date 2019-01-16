# import dd from 'ddeyes'
import path from 'path'
import fs from 'fs'

import * as babylon from 'babylon'
import traverse from '@babel/traverse'
import generator from '@babel/generator'
import * as t from '@babel/types'
import transform from 'cfx.babel'

# real coffee file Path
rCFPath = (filePath) =>

  getFileObj = (file) => {
    exists: fs.existsSync file
    (path.parse file)...
  }

  fileObj = getFileObj filePath

  unless fileObj.exists # file isnt exists

    fileObj = 

      coffee: do =>

        _path = path.format
          root: path.join fileObj.root, fileObj.dir + '/'
          name: fileObj.base
          ext: '.coffee'

        path: _path
        obj: getFileObj _path

      js: do =>

        _path = path.format
          root: path.join fileObj.root, fileObj.dir + '/'
          name: fileObj.base
          ext: '.js'

        path: _path
        obj: getFileObj _path

    if fileObj.coffee.obj.exists
      return rCFPath fileObj.coffee.path
    if fileObj.js.obj.exists
      return rCFPath fileObj.js.path
    return null

  else # file exists

    unless fileObj.ext is '' # isnt dir
    then return filePath
    else return rCFPath path.join filePath, 'index.coffee'

# replace import coffee file from AST
ricffAST = (ast, dirname = __dirname) =>

  traverse ast
  ,
    ImportDeclaration: (_ast) =>

      currentNode = _ast.node

      fileParseObj = path.parse currentNode.source.value

      return if (
        fileParseObj.root is '' and
        fileParseObj.dir is ''
      )

      filePath = rCFPath path.join dirname
      , currentNode.source.value

      _ast.node.source = t.StringLiteral filePath if filePath?

      return

  ast

getAST = (source) =>

  babylon.parse source
  ,
    sourceType: 'module'
    plugins: [
      'objectRestSpread'
      'asyncGenerators'
    ]

ASTToCode = (ast, es = true, opts) =>
  if es is false
  then transform ast, opts
  else ( generator ast ).code

export {
  rCFPath
  ricffAST
  getAST
  ASTToCode
}
