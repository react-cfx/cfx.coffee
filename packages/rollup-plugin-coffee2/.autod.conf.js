module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    '@babel/generator',
    '@babel/traverse',
    '@babel/types',
    'babylon',
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
    '@babel/core',
    '@babel/preset-es2015',
    '@babel/preset-stage-3',
    'autod',
    'ddeyes',
    'shelljs'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
