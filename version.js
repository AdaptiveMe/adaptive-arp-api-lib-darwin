var exec = require('child_process').exec;

var child = exec("pod ipc spec AdaptiveArpApi.podspec", function (error, stdout, stderr) {
  console.log(JSON.parse(stdout).version);
});
