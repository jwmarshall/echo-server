const os = require('os');
const express = require('express');
const bodyParser = require('body-parser');

var pkg = require('./package.json')

const app = express();
app.use(bodyParser.json());

app.get('/', function (req, res) {
  res.send({ "hostname": os.hostname()
             ,"version": pkg.version });
});

app.post('/echo', function (req, res) {
  res.json(req.body);
});

app.listen(3000, function() {
  console.log('Starting echo-server...');
});

