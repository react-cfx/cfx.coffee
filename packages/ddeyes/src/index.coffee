import { inspector } from 'eyes'

ddbs = (args...) =>
  console.log.apply null
  , args

defaultConf = 
  pretty: true
  hideFunctions: true
  stream: process.stdout
  maxLength: 204800

export {
  ddbs
}

export default (data, opts) =>
  inspect = inspector {
    defaultConf...
    opts...
  }
  inspect data
