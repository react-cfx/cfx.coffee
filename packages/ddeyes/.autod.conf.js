module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [
    'eyes'
  ],
  devdep: [
    '@babel/cli',
    '@babel/core',
    '@babel/preset-es2015',
    '@babel/preset-stage-3',
    'autod',
    'coffeescript',
    'shelljs'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
