  function initMap(lat, lng) {
    var userLat = tran.latitude
    var userLng = tran.longitude
    var uluru = {lat: userLat, lng: userLng};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: uluru,
      zoomControl: true,
      scaleControl: false,
      scrollwheel: false,
      disableDoubleClickZoom: true
    });

    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
