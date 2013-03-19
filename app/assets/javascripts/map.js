function display_map(lat, lng, zoom)
{
  console.log('Map created');
  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_marker(lat, lng, title)
{
  var latlng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({position: latlng, map: map, title: title});
}

function clear_markers()
{
  _.each(markers, function(m){m.setMap(null);});
  markers = [];
}

