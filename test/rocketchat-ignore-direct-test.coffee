assert = require 'power-assert'
sinon = require 'sinon'

describe 'rocketchat-ignore-direct', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/rocketchat-ignore-direct')(@robot)

  it 'registers a respond listener', ->
    assert.ok(@robot.respond.calledWith(/hello/))

  it 'registers a hear listener', ->
    assert.ok(@robot.hear.calledWith(/orly/))
