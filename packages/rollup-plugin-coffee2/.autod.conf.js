module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    '@babel/core',
    '@babel/generator',
    '@babel/traverse',
    '@babel/types',
    '@babel/runtime',
    '@babel/preset-es2015',
    '@babel/preset-stage-3',
    '@babel/plugin-transform-runtime',
    'cfx.babel',
    'cfx.require-plugin-coffee',
    'coffeescript',
    'del',
    'gulp',
    'gulp-better-rollup',
    'gulp-rename',
    'gulp-sequence',
    'rollup',
    'rollup-plugin-cleanup',
    'rollup-pluginutils',
  ],
  devdep: [
    'autod',
    'ddeyes',
    'shelljs'
  ],
  semver: [
    'babylon@next'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
