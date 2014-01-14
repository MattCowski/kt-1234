'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $scope.cloudinaryPublicId = "syatfczuyibwr0kjmurm"
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings


angular.module("krisTileApp").factory "cloudinary", ($http) ->
  getUploadAttrs: (tags, cb) ->
    $http.get("/api/cloudinary/params/get",
      params:
        tstamp: new Date().getTime()
        tags: tags
    ).success((data) ->
      cb data  if data.code is 200
    ).error (data, status, headers, config) ->
      alert status + " | bad"

  cloudinary.getUploadAttrs tags, (data) ->
    data.uploadDone = (e, cloudinaryResponse) ->

    
    # custom processing to save the new cloudinary ID goes here...
    $scope.cloudinaryData = data
