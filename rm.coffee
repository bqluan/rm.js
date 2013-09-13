Fs   = require 'fs'
Path = require 'path'

rm = (path, callback) ->
  Fs.lstat path, (err, stats) ->
    if err? then callback err else rm_ path, stats, callback

rm_ = (path, stats, callback) ->
  if stats.isFile() then Fs.unlink path, callback
  else if stats.isDirectory() then rm_dir path, callback

rm_dir = (path, callback) ->
  Fs.readdir path, (err, files) ->
    if err? then callback err else rm_dir_ files, path, callback

rm_dir_ = (files, path, callback) ->
  rm_each (Path.join path, file for file in files), (err) ->
    if err? then callback err else Fs.rmdir path, callback

rm_each = (files, callback) ->
  if files.length is 0 then callback() else rm files[0], callback

rm_f = (path, callback) ->
  Fs.exists path, (exists) ->
    if exists then rm path, callback else callback()

module.exports = rm_f
