'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http) ->
    $scope.selected = (cords) ->
      console.log cords
      $scope.cropped = true
      rx = 150 / cords.w
      ry = 150 / cords.h
      # # FIXME should be working like http://plnkr.co/edit/Iizykd7UORy3po1h5mfm?p=preview
      # $("#preview").css
      #   width: Math.round(rx * boundx) + "px"
      #   height: Math.round(ry * boundy) + "px"
      #   marginLeft: "-" + Math.round(rx * cords.x) + "px"
      #   marginTop: "-" + Math.round(ry * cords.y) + "px"
    $scope.cloudinaryPublicId = "syatfczuyibwr0kjmurm"
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings


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

    cloudinary.getUploadAttrs tags, (data) ->
      data.uploadDone = (e, cloudinaryResponse) ->

      
      # custom processing to save the new cloudinary ID goes here...
      $scope.cloudinaryData = data


