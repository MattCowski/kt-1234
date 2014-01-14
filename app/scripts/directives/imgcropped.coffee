'use strict'

angular.module('krisTileApp')
  .directive "imgCropped", ->
    restrict: "E"
    replace: true
    scope:
      src: "@"
      selected: "&"

    link: (scope, element, attr) ->
      myImg = undefined
      clear = ->
        if myImg
          myImg.next().remove()
          myImg.remove()
          myImg = `undefined`

      scope.$watch "src", (nv) ->
        clear()
        if nv
          element.after "<img />"
          myImg = element.next()
          myImg.attr "src", nv
          $(myImg).Jcrop
            trackDocument: true
            onSelect: (x) ->
              scope.$apply ->
                scope.selected cords: x

          , ->
            
            # Use the API to get the real image size  
            bounds = @getBounds()
            boundx = bounds[0]
            boundy = bounds[1]


      scope.$on "$destroy", clear