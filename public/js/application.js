$(document).ready(function() {
  $(".signup").click(function(e) {
    e.preventDefault();
    var $link = $(this);

    var promise = $.ajax ({
      url: $link.attr("href")
    });

    promise.done(function(response) {

      $("nav").append(response);
    });

  });

  $("nav").on("submit", "#registration", function(e) {
    e.preventDefault();
    var $form = $(this);

    var promise = $.ajax ({
      url: $form.attr("action"),
      method: $form.attr("method"),
      data: $form.serialize()
    });

    promise.done(function(response) {
      // $(".signup").remove();
      // $(".login").remove();
      $form.remove();
      $('nav').append(response)
    });

    promise.fail(function(response) {
      var errors = JSON.parse(response.responseText);

      errors.forEach(function(error) {
        $(".errors").children(".messages").append(`<li>${error}</li>`)
      })

    })


  })



});
