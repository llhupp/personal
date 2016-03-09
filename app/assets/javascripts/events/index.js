function getFbEvents(params){
  return new Promise(function(resolve) {
    FB.api([
      "/719049914797706/events?",
      window.accessTokenParam,
      "&fields=images"
    ].join(''), resolve);
  });
}

function fbEventResponseHandler(response){
  return new Promise(function(resolve, reject) {
    if (response && !response.error) {
      photos = response.data || []
      resolve(photos);
    } else {
      console.log('Error fetching Facebook photos')
      resolve([]);
    }
  });
}

function listEventItem(photo){
  var li = document.createElement('li');
  li.className = 'col s12 card hoverable';
  var img = document.createElement('img');
  img.src = sourceUrl;
  img.className = 'materialboxed responsive-img';
  li.appendChild(img);

  return li;
}

function initPage(photos){
  var photoList = $('#photo-list');

  photos.forEach(function(p){
    photoList.append(listPhotoItem(p));
  });

  Materialize.showStaggeredList('.staggered_list');
}

window.runPageJs = function(fbAppId, fbToken) {
  window.initFbApi(fbAppId, fbToken).then(getFbEvents).then(fbEventResponseHandler).then(initPage);
}