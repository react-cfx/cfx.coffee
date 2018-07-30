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
    '@babel/plugin-transform-runtime',
    '@babel/runtime',
    'require-from-string'
  ],
  devdep: [
    'autod',
    'ddeyes'
  ],
  exclude: [
    './node_modules/*',
    './.autod.conf.js'
  ]
};
