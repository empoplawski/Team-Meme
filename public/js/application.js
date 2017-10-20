$(document).ready(function() {
  $(".signup").click(function(e) {
    e.preventDefault();
    var $this = $(this);

    var promise = $.ajax ({
      url: $this.attr("href")
    })

    promise.done(function(response) {
      console.log(response);
      $("nav").append(response);
    })

  })



});
