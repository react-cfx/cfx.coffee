module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    'eyes',
    'replace',
    '@babel/runtime'
  ],
  devdep: [
    '@babel/cli',
    '@babel/core',
    '@babel/preset-env',
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
