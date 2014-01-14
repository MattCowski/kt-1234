'use strict';

// Module dependencies.
var express = require('express'),  
    path = require('path'),
    cloudinary = require('cloudinary'),
    fs = require('fs');

var app = express();

// Connect to database
var db = require('./lib/db/mongo');

// Bootstrap models
var modelsPath = path.join(__dirname, 'lib/models');
fs.readdirSync(modelsPath).forEach(function (file) {
  require(modelsPath + '/' + file);
});

// Populate empty DB with dummy data
require('./lib/db/dummydata');


// Express Configuration
require('./lib/config/express')(app);

// Controllers
var api = require('./lib/controllers/api'),
    index = require('./lib/controllers');

// Server Routes
app.get('/api/awesomeThings', api.awesomeThings);
app.get('/api/uploads', api.uploads);

// Angular Routes
app.get('/partials/*', index.partials);
app.get('/*', index.index);

app.configure('development', function(){
  app.use(express.errorHandler());
  cloudinary.config({ cloud_name: 'kristile-com', api_key: '467799287163396', api_secret: 'tbsfsRQMO8q3pTGySx7-x_OFz_o' });
});

app.locals.api_key = cloudinary.config().api_key;
app.locals.cloud_name = cloudinary.config().cloud_name;



// Start server
var port = process.env.PORT || 3000;
app.listen(port, function () {
  console.log('Express server listening on port %d in %s mode', port, app.get('env'));
});

// Expose app
exports = module.exports = app;