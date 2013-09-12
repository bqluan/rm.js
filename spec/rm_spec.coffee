should              = require 'should'
{create, file, rm}  = require './spec_helper'

describe 'rm', () ->

  it 'does nothing when file does not exist', (done) ->
    rm 'no_such_file.txt', (err) ->
      should.not.exist err
      done()

  it 'should remove 1 file', (done) ->
    create 'file.txt'
    rm 'file.txt', (err) ->
      should.not.exist err
      should.not.exist file('file.txt')
      done()
