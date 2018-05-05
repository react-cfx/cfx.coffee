_require = require 'cfx.require'
{ gdf } = _require

register = gdf require './register'
module.exports = register gdf _require
