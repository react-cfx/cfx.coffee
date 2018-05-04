# import dd from 'ddeyes'
import fs from 'fs'
import path from 'path'

###
  isExist?
    false
      hasExt?
        false
          add ext loop
        true
          change ext
          isExist?
            true
              return change ext filePath
            false
              return ''
    true
      isDirectory?
        true
          add index.ext
        false
          if file ext isnt conf ext
            if file ext is '.js'
            then filePath
            else return ''
          else
            return filePath
###
getFileObj = (filePath, fileExt) =>

  unless fs.existsSync filePath

    fileObj = path.parse filePath

    if fileObj.ext is ''
      return getFileObj "#{filePath}#{fileExt}", fileExt
    else
      newFilePath = path.format {
        fileObj...
        base: ''
        ext: fileExt
      }
      if fs.existsSync
        return newFilePath
      else
        return null

  else
    if (fs.statSync filePath).isDirectory()
      # dd "#{filePath}/index#{fileExt}"
      return getFileObj "#{filePath}/index#{fileExt}", fileExt
    else
      return filePath
      # fileObj = path.parse filePath
      # if fileObj.ext isnt fileExt
      #   return filePath

getFilePath = (filePath, fileExts) =>

  fileExts.reduce (r, fileExt) =>

    return r unless r is ''

    _filePath = getFileObj filePath, fileExt

    unless _filePath is ''
      _filePath
    else null

  , ''

getFileCode = (filePath) =>

  if filePath?
  then fs.readFileSync filePath, 'utf-8'
  else ''

export {
  getFilePath
  getFileCode
}
