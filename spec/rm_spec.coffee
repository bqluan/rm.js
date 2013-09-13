should = require 'should'
{create, mkdir, file, folder, rm}  = require './spec_helper'

describe 'rm(path, callback)', () ->

  it 'does nothing when path does not exist', (done) ->
    rm 'no_such_path', (err) ->
      should.not.exist err
      done()

  it 'should remove 1 file', (done) ->
    create 'afile.txt'
    rm 'afile.txt', (err) ->
      should.not.exist err
      should.not.exist file('afile.txt')
      done()

  it 'should remove 1 empth folder', (done) ->
    mkdir 'afolder'
    rm 'afolder', (err) ->
      should.not.exist err
      should.not.exist folder('afolder')
      done()

  it 'should remove 1 folder with 1 file in it', (done) ->
    mkdir 'afolder'
    create 'afolder/afile.txt'
    rm 'afolder', (err) ->
      should.not.exist err
      should.not.exist folder('afolder')
      done()
