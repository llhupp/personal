function initPage(photos){
  // TODO: stuff
}

window.runPageJs = function(fbAppId, fbToken, fbPageId) {
  Materialize.showStaggeredList('.staggered_list');
  window.initFbApi(fbAppId, fbToken, fbPageId).then(initPage);
}