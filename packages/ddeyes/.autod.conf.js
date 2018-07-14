module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    'eyes',
    '@babel/runtime'
  ],
  devdep: [
    '@babel/cli',
    '@babel/core',
    '@babel/preset-env',
    '@babel/preset-stage-3',
    '@babel/plugin-transform-runtime',
    'autod',
    'coffeescript',
    'shelljs'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
