import dd from 'ddeyes'
import transform from 'cfx.babel'
import * as babylon from 'babylon'

import {
  getAST
  ricffAST
  ASTToCode
} from '../src/util'

# jsCode = 'import calc from "../src";'

# jsCode = 'import calc from "hello/world";'

jsCode = """
  async function a() {
    await request('url');
  };
"""

# ast = babylon.parse jsCode
# ,
#   sourceType: 'module'

# console.log transform ast

originalAst = ricffAST getAST jsCode

# dd originalAst

console.log ASTToCode originalAst
