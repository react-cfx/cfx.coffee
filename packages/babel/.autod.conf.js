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
    '@babel/plugin-transform-runtime',
    '@babel/preset-es2015',
    '@babel/preset-stage-3',
    '@babel/runtime'
  ],
  devdep: [
    'autod',
    'babylon',
    'coffeescript',
    'ddeyes',
    'shelljs'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
