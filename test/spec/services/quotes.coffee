'use strict'

describe 'Service: Quotes', () ->

  # load the service's module
  beforeEach module 'krisTileApp'

  # instantiate service
  Quotes = {}
  beforeEach inject (_Quotes_) ->
    Quotes = _Quotes_

  it 'should do something', () ->
    expect(!!Quotes).toBe true
