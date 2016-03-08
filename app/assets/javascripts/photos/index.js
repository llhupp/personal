function getFbAlbum(params){
  return new Promise(function(resolve) {
    FB.api([
      "/719049914797706/photos?",
      window.accessTokenParam,
      "&fields=images"
    ].join(''), resolve);
  });
}

function fbAlbumResponseHandler(response){
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

function largestImageSource(photo){
  var currentSize;
  var largestSource;
  var largestSize = 0;

  photo.images.forEach(function(image){
    currentSize = image.height * image.width;
    if(currentSize > largestSize){
      largestSize = currentSize;
      largestSource = image.source;
    }
  });

  return largestSource;
}

function listPhotoItem(photo){
  var li = document.createElement('li');
  li.className = 'col s6 m4 card hoverable';
  var img = document.createElement('img');
  img.src = largestImageSource(photo);
  img.className = 'materialboxed responsive-img';
  li.appendChild(img);

  return li;
}

function handleStaggeredListFinish(){
  var list = $('.staggered_list li');
  list.each(function(){
    $(this).css('transform', '')
  })
  $('.materialboxed').materialbox();
}

function initPage(photos){
  var photoList = $('#photo-list');

  photos.forEach(function(p){
    photoList.append(listPhotoItem(p));
  });

  Materialize.showStaggeredList('.staggered_list');
  var interval = setInterval(function(){
    var isAnimating = _.any($('.staggered_list li'), function(el){
      return el.className.match(/velocity-animating/);
    });

    if(isAnimating){ return null; }
    clearInterval(interval);
    handleStaggeredListFinish();
  }, 300)
  var list = $('.staggered_list li');
}

window.runPageJs = function(fbAppId, fbToken) {
  window.initFbApi(fbAppId, fbToken).then(getFbAlbum).then(fbAlbumResponseHandler).then(initPage);
}