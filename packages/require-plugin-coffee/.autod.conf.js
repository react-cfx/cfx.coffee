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
    '@babel/preset-es2015',
    '@babel/preset-stage-3',
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
