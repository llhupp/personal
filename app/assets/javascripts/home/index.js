function initPage(photos){
  // TODO: stuff
}

var accessTokenParam = '';

window.runPageJs = function(fbAppId, fbToken) {
  Materialize.showStaggeredList('.staggered_list');
  window.initFbApi(fbAppId, fbToken).then(initPage);
}