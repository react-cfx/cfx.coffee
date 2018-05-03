import { inspector } from 'eyes'

ddbs = (args...) =>
  console.log.apply null
  , args

defaultConf = 
  pretty: true
  hideFunctions: true
  stream: process.stdout
  maxLength: 204800

getDD = (opts) =>
  inspector {
    defaultConf...
    opts...
  }

export {
  ddbs
  getDD
}

export default inspector defaultConf
