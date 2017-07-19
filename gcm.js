var request = require('request');
var GCM = function(api_key) {
  this._api_key = api_key;
}
GCM.prototype.send = function(msg, callback) {
  request.post({
    uri: 'https://fcm.googleapis.com/fcm/send',
    json: msg,
    headers: {
      Authorization: 'key=' + this._api_key
    }
  }, function(err, response, body) {
    callback(err, body);
  })
}

module.exports = GCM;
