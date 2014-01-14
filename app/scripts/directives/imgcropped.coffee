'use strict'

angular.module('krisTileApp')
  .directive('imgCropped', () ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the imgCropped directive'
  )
