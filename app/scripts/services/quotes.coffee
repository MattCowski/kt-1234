'use strict'

angular.module('krisTileApp')
  .factory 'Quotes', ($firebase, fbURL) ->
    return $firebase(new Firebase(fbURL))
