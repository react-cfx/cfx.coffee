import { inspector } from 'eyes'

ddbs = (args...) =>
  console.log.apply null
  , args

export {
  ddbs
}

export default inspector
  pretty: true
  hideFunctions: true
  stream: process.stdout
  maxLength: 204800
