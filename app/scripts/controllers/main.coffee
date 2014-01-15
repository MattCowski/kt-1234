'use strict'

angular.module('krisTileApp')
  .controller 'MainCtrl', ($scope, $http, cloudinary) ->
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
    cloudinary.getUploadAttrs tags, (data) ->
      data.uploadDone = (e, cloudinaryResponse) ->
        console.log cloudinaryResponse
      # custom processing to save the new cloudinary ID goes here...
      $scope.cloudinaryData = data


angular.module('krisTileApp')
  .factory "cloudinary", ($http) ->
    getUploadAttrs: (tags, cb) ->
      $http.get("/api/cloudinary/params/get", https://api.cloudinary.com/v1_1/demo/image/upload
        params:
          tstamp: new Date().getTime()
          tags: tags
      ).success((data) ->
        cb data  if data.code is 200
      ).error (data, status, headers, config) ->
        alert status + " | bad"



  # cloudinaryData = {
  #   url: 'https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/auto/upload',
  #   formData : {
  #      timestamp : 1375363550;
  #      tags : sampleTag,
  #      api_key : YOUR_API_KEY,
  #      callback : URL TO cloudinary_cors.html,
  #      signature : '53ebfe998d4018c3329aba08237d23f7458851a5'
  #   }
  #   start : function() { ... },
  #   progress : function() { ... },
  #   done : function() { ... }
  # }
  #    *  The start, progress, and done functions are optional callbacks. Other jquery.fileupload callbacks
  #        *  should be supported, but are untested.
  #        *
  #        *  Functions are automatically wrapped in scope.$apply() so it is safe to change variable values
  #        *  in your callbacks.