$(document).ready(function () {
  $('.up-vote-count').on('click', toQuestion);
  $("a[href='/sessions/new']").click(login)

});

var login = function(event){
  event.preventDefault();

}