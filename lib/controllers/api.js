'use strict';

var mongoose = require('mongoose'),
    Thing = mongoose.model('Thing'),
    cloudinary = require('cloudinary'),
    fs = require('fs'),
    async = require('async');

exports.awesomeThings = function(req, res) {
  return Thing.find(function (err, things) {
    if (!err) {
      return res.json(things);
    } else {
      return res.send(err);
    }
  });
};

exports.uploads = function(req, res) {
  cloudinary.api.resources(function(items){
      return res.json(items);
  });
};