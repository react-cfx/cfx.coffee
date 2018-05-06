import cleanup from 'rollup-plugin-cleanup'
# import nodeResolve from 'rollup-plugin-node-resolve'
# import commonjs from 'rollup-plugin-commonjs';

import coffee2 from './src'
# import coffee2 from './dist/main.js'
# from 'cfx.rollup-plugin-coffee2'

conf = (output) => {
  input: './src/index.coffee'
  output
  plugins: [
    coffee2
      bare: true
      sourceMap: true
    cleanup()
  ]
}

export default [
  conf
    file: './dist/main.js'
    format: 'cjs'
  conf
    file: './dist/main.es.js'
    format: 'es'
]
