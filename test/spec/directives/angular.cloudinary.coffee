'use strict'

describe 'Directive: angular.cloudinary', () ->

  # load the directive's module
  beforeEach module 'krisTileApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<angular.cloudinary></angular.cloudinary>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the angular.cloudinary directive'
