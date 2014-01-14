'use strict'

describe 'Directive: imgCropped', () ->

  # load the directive's module
  beforeEach module 'krisTileApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<img-cropped></img-cropped>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the imgCropped directive'
