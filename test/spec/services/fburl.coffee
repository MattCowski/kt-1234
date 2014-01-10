'use strict'

describe 'Service: fbURL', () ->

  # load the service's module
  beforeEach module 'krisTileApp'

  # instantiate service
  fbURL = {}
  beforeEach inject (_fbURL_) ->
    fbURL = _fbURL_

  it 'should do something', () ->
    expect(!!fbURL).toBe true
