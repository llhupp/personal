// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require moment
//= require materialize-sprockets

$('.button-collapse').sideNav();

function fbBinder(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}

function fbInit(fbAppId){
  FB.init({
    appId      : fbAppId,
    xfbml      : true,
    version    : 'v2.5'
  });
  return Promise.resolve();
}

window.accessTokenParam = '';

window.initFbApi = function(fbAppId, fbToken){
  window.accessTokenParam = 'access_token=' + fbToken;

  return new Promise(function(resolve, reject) {
    window.fbAsyncInit = resolve.bind(this, fbAppId);
    fbBinder(document, 'script', 'facebook-jssdk')
  }).then(fbInit);
}
