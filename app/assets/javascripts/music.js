 $(function(){
  // $('#show_bio').click(_bio);
  // $('hide_bio').click(hide_bio);
  $('#musicloop').on('click', '.upvote', up_vote);
  $('#artist_bio').click(toggle_bio);
  $('#artist_location').click(toggle_location);
  $('#artist_event').click(toggle_event);
  $('#homepage').click(toggle_home);
  $('.homepage').children().children().css('font-size','50px');
 });




 function up_vote() {
  var id= $(this).parent().parent().next().text();
  console.log('up vote');
 }

function toggle_bio()
{
  $('.artistbio').toggle();
  $('.artistevent').hide();
}

function toggle_location()
{
  $('.artist_location').toggle();
}

function toggle_event()
{
  $('.artistevent').toggle();
  $('.artistbio').hide();
  $('#map_canvas').toggle();
  $('#distance').toggle();
}

function toggle_home()
{
  $('.homepage').toggle();
}
