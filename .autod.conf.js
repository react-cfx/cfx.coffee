module.exports = {
  write: true,
  registry: 'https://registry.npm.taobao.org',
  prefix: '~',
  devprefix: '^',
  plugin: '',
  test: [],
  dep: [],
  devdep: [
    'autod',
    'lerna'
  ],
  exclude: [
    './packages',
    './node_modules',
    './.autod.conf.js'
  ]
};
