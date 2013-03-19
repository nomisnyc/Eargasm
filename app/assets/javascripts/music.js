$(function(){
// $('#show_bio').click(_bio);
// $('hide_bio').click(hide_bio);
$('h2.subheader').click(demo);

$('#musicloop').on('click', '.upvote', up_vote);
$('#artist_bio').click(hide_event);
$('#artist_location').click(toggle_location);
$('#artist_event').click(show_event);
$('#homepage').click(toggle_home);
$('.homepage').children().children().css('font-size','50px');
  $(".various").fancybox({
    maxWidth  : 800,
    maxHeight : 600,
    fitToView : false,
    width   : '70%',
    height    : '70%',
    autoSize  : false,
    closeClick  : false,
    openEffect  : 'none',
    closeEffect : 'none'
  });
 });


 function demo()
 {
  $.ajax({
    dataType: 'json',
    url: '/users',
    method: 'get'
  }).done(function(returneddata){
    console.log(returneddata);
  });
 }

 function up_vote() {
  var id= $(this).parent().parent().next().text();
  console.log('up vote');
 }

function toggle_bio()
{
  $('.artistbio').toggle();
  $('#artistevent').hide();
}

function toggle_location()
{
  $('.artist_location').toggle();
}

function toggle_event()
{

  if( $('#artistevent').is(":hidden") ){
    show_event();
  }else {
    hide_event();
  }

}

function show_event(){
$('#artistevent').show();
  $('.artistbio').hide();
  $('#map_canvas').show();
  $('#distance').show();



      var map_center_lat = $('#map_center_lat').val();
        var map_center_lng = $('#map_center_lng').val();
        var music_venue_lat = $('#music_venue_lat').val();
        var music_venue_lng = $('#music_venue_lng').val();
        var music_venue_name = $('#music_venue_name').val();
        var music_location = $('#music_location').val();
        var music_distance = $('#music_distance').val();


   display_map(map_center_lat,  map_center_lng , 11 );
   add_marker(music_venue_lat, music_venue_lng, music_venue_name);


}

function hide_event(){
$('#artistevent').hide();
  $('.artistbio').show();
  $('#map_canvas').hide();
  $('#distance').hide();

}

function toggle_home()
{
  $('.homepage').toggle();
}