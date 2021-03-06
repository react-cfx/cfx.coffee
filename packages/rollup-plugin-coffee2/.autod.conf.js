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
    '@babel/preset-env',
    '@babel/plugin-transform-runtime',
    'babylon',
    'cfx.babel',
    'cfx.require-plugin-coffee',
    'coffeescript',

    'del',
    'gulp',
    'gulp-better-rollup',
    'gulp-rename',

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
