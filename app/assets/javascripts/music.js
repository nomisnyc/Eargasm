 $(function(){
  // $('#show_bio').click(_bio);
  // $('hide_bio').click(hide_bio);
  $('h2.subheader').click(demo);

  $('#musicloop').on('click', '.upvote', up_vote);
  $('#artist_bio').click(toggle_bio);
  $('#artist_location').click(toggle_location);
  $('#artist_event').click(toggle_event);
  $('#homepage').click(toggle_home);
  $('.homepage').children().children().css('font-size','50px');
 $(".fancyYoutube").click(function() {
    $.fancybox({
'transitionIn' : 'fade',
'padding' : 20,
'autoScale' : false,
'href' : this.href.replace(new RegExp("watch\\?v=", "i"), "v/"),
'transitionOut' : 'fade',
'width' : 680,
'height' : 495,
'type' : 'swf'
});

    return false;
  }); //close videoclick function
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
