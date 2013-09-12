Fs   = require 'fs'
Path = require 'path'
rm_  = require '../rm'

realname = (filename) ->
  Path.join __dirname, filename

create = (filename) ->
  Fs.writeFileSync realname(filename), ''

file = (filename) ->
  if Fs.existsSync realname(filename)
  then realname(filename)
  else null

rm = (filename, callback) ->
  rm_ realname(filename), callback

module.exports = {
  create
  file
  rm
}
