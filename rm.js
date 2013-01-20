var fs = require('fs');

var rmdir = function(path, callback) {
  fs.readdir(path, function(err, files) {
    err ? callback(err) : rmdir_(files, path, callback);
  });
};

var rmdir_ = function(files, path, callback) {
  console.log(files);
  var count = files.length;
  files.forEach(function(file) {
    rm_r(file, function(err) {
      count--;
      if (count == 0) fs.rmdir(path, callback);
    });
  });
};

var rm_r_ = function(stats, path, callback) {
  stats.isFile() || stats.isSymbolicLink() ?
    fs.unlink(path, callback) :
    stats.isDirectory() ?
      rmdir(path, callback) :
      callback();
};

var rm_r = function(path, callback) {
  fs.lstat(path, function(err, stats) {
    err ? callback(err) : rm_r_(stats, path, callback);
  });
};

var rm_rf = function(path, callback) {
  fs.exists(path, function(exists) {
    exists ? rm_r(path, callback) : callback();
  });
};

module.exports = rm_rf;
