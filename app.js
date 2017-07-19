var express = require("express");
var mysql = require("mysql");
var bodyParser = require("body-parser");

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bdcs'
});

var app = express();

app.use(bodyParser.json()); // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // to support URL-encoded bodies

var GCM = require('./gcm.js');
var gcm = new GCM('AIzaSyCQYD3Npron6xO4PiaseIjKcGo1Mje9IXw');
global.gcm = gcm;

