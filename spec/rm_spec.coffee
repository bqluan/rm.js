should = require 'should'
{create, mkdir, file, folder, rm}  = require './spec_helper'

describe 'rm(path, callback)', () ->

  it 'does nothing when path does not exist', (done) ->
    rm 'no_such_path', (err) ->
      should.not.exist err
      done()

  it 'should remove 1 file', (done) ->
    create 'a_file.txt'
    rm 'a_file.txt', (err) ->
      should.not.exist err
      should.not.exist file('a_file.txt')
      done()

  it 'should remove 1 empth folder', (done) ->
    mkdir 'an_empty_folder'
    rm 'an_empty_folder', (err) ->
      should.not.exist err
      should.not.exist folder('an_empty_folder')
      done()

  it 'should remove 1 folder with 1 file in it', (done) ->
    mkdir 'a_folder'
    create 'a_folder/a_file.txt'
    rm 'a_folder', (err) ->
      should.not.exist err
      should.not.exist folder('a_folder')
      done()

  it 'should remove 1 folder with 2 files in it', (done) ->
    mkdir 'a_folder'
    create 'a_folder/a_file.txt'
    create 'a_folder/another_file.txt'
    rm 'a_folder', (err) ->
      should.not.exist err
      should.not.exist folder('a_folder')
      done()

  it 'should remove 1 folder with 1 folder in it', (done) ->
    mkdir 'a_folder'
    mkdir 'a_folder/a_subfolder'
    rm 'a_folder', (err) ->
      should.not.exist err
      should.not.exist folder('a_folder')
      done()

  it 'should remove 1 folder with 2 folders in it', (done) ->
    mkdir 'a_folder'
    mkdir 'a_folder/a_subfolder'
    mkdir 'a_folder/another_subfolder'
    rm 'a_folder', (err) ->
      should.not.exist err
      should.not.exist folder('a_folder')
      done()

  it 'should remove 1 folder with 1 folder with 1 file', (done) ->
    mkdir 'a_folder'
    mkdir 'a_folder/a_subfolder'
    create 'a_folder/a_subfolder/a_file.txt'
    rm 'a_folder', (err) ->
      should.not.exist err
      should.not.exist folder('a_folder')
      done()
    
