Fs   = require 'fs'
Path = require 'path'
rm_  = require '../rm'

realname = (path) ->
  Path.join __dirname, path

create = (path) ->
  Fs.writeFileSync realname(path), ''

mkdir = (path) ->
  Fs.mkdirSync realname(path)

file = (filename) ->
  if Fs.existsSync realname(filename)
  then realname(filename)
  else null

folder = (path) ->
  if Fs.existsSync realname(path)
  then realname(path)
  else null

rm = (path, callback) ->
  rm_ realname(path), callback

module.exports = {
  create
  mkdir
  file
  folder
  rm
}
