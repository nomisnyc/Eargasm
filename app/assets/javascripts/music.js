 $(function(){
  $('#artist_bio').click(toggle_bio);
  $('#artist_location').click(toggle_location);
  $('artist_event').click(toggle_event);
 });

function toggle_bio()
{
  $('.artistbio').toggle();
}

function toggle_location()
{
  $('.artist_location').toggle();
}

function toggle_event()
{
  $('.artist_event').toggle();
}