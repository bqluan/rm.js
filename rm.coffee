Fs = require 'fs'

rm = (path, callback) ->
  Fs.unlink path, callback

rm_f = (path, callback) ->
  Fs.exists path, (exists) ->
    if exists then rm path, callback else callback()

module.exports = rm_f
