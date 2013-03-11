 $(function(){
  $('#show_bio').click(show_bio);
  $('hide_bio').click(hide_bio);
  $('#musicloop').on('click', '.upvote', up_vote);
 });


 function up_vote() {
  var id= $(this).parent().parent().next().text();
  console.log('up vote');

}

