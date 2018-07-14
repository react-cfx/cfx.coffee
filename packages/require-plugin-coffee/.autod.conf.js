module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    '@babel/cli',
    '@babel/core',
    '@babel/preset-env',
    '@babel/preset-stage-3',
    '@babel/plugin-transform-runtime',
    '@babel/runtime',
    'cfx.babel',
    'cfx.require',
    'coffeescript',
    'shelljs'
  ],
  devdep: [
    'autod',
    'ddeyes',
    'shelljs'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
