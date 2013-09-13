Fs = require 'fs'

rm = (path, callback) ->
  Fs.lstat path, (err, stats) ->
    if err? then callback err else rm_ path, stats, callback

rm_ = (path, stats, callback) ->
  if stats.isFile() then Fs.unlink path, callback
  else if stats.isDirectory() then Fs.rmdir path, callback

rm_f = (path, callback) ->
  Fs.exists path, (exists) ->
    if exists then rm path, callback else callback()

module.exports = rm_f
