should = require 'should'
{create, mkdir, file, folder, rm}  = require './spec_helper'

describe 'rm(path, callback)', () ->

  it 'does nothing when path does not exist', (done) ->
    rm 'no_such_path', (err) ->
      should.not.exist err
      done()

  it 'should remove 1 file', (done) ->
    create 'file.txt'
    rm 'file.txt', (err) ->
      should.not.exist err
      should.not.exist file('file.txt')
      done()

  it 'should remove 1 folder', (done) ->
    mkdir 'newfolder'
    rm 'newfolder', (err) ->
      should.not.exist err
      should.not.exist folder('newfolder')
      done()
