// Empty constructor
function ToastyPlugin() {}

// The function that passes work along to native shells
// Message is a string, duration may be 'long' or 'short'
ToastyPlugin.prototype.show = function(serverName, sessionID, userName, successCallback, errorCallback) {
  var options = {};
  options.serverName = serverName;
  options.sessionID = sessionID;
  options.userName = userName;

  cordova.exec(successCallback, errorCallback, 'ToastyPlugin', 'show', [options]);
}

// Installation constructor that binds ToastyPlugin to window
ToastyPlugin.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.toastyPlugin = new ToastyPlugin();
  return window.plugins.toastyPlugin;
};
cordova.addConstructor(ToastyPlugin.install);
