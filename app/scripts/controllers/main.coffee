'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http, cloudinary) ->
    $scope.selected = (cords) ->
      console.log cords
      $scope.cropped = true
      rx = 150 / cords.w
      ry = 150 / cords.h

    $scope.cloudinaryPublicId = "syatfczuyibwr0kjmurm"
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings
    cloudinary.getUploadAttrs tags, (data) ->
      data.uploadDone = (e, cloudinaryResponse) ->
        console.log cloudinaryResponse
      # custom processing to save the new cloudinary ID goes here...
      $scope.cloudinaryData = data


angular.module('krisTileApp')
  .factory "cloudinary", ($http) ->
    getUploadAttrs: (tags, cb) ->
      $http.get("/api/cloudinary/params/get",
        params:
          tstamp: new Date().getTime()
          tags: tags
      ).success((data) ->
        cb data  if data.code is 200
      ).error (data, status, headers, config) ->
        alert status + " | bad"
