$(document).ready(function() {

  $(".signup").click(function(e) {
    e.preventDefault();
    var $link = $(this);

    var promise = $.ajax ({
      url: $link.attr("href")
    });

    promise.done(function(response) {
      $("nav").append(response);
      $link.hide();
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
      $(".signup").remove();
      $(".login").replaceWith(response);
      $form.remove();
    });

    promise.fail(function(response) {
      var errors = JSON.parse(response.responseText);

      errors.forEach(function(error) {
        $(".errors").children(".messages").append(`<li>${error}</li>`)
      })

    })

  })

  $(".login").click(function(e) {
    e.preventDefault();
    var $loginLink = $(this);

    var promise = $.ajax({
      url: $loginLink.attr("href")
    })

    promise.done(function(response) {
      $("nav").append(response);
      $loginLink.hide();
    })

  });

  $("nav").on("submit", "#login-form", function(e) {
    e.preventDefault();
    var $form = $(this);

    var promise = $.ajax ({
      method: $form.attr("method"),
      url:    $form.attr("action"),
      data:   $form.serialize()
    })

    promise.done(function(response) {
      $(".signup").remove();
      $(".login").replaceWith(response);
      $form.remove();
    });
  })

  $("nav").on("submit", ".logout-form", function(e) {
    e.preventDefault();
    var $form = $(this);

    var promise = $.ajax ({
      method: $(".logout-form input:first-child").attr("value"),
      url: $form.attr("action")
    })

    promise.done(function(response) {
      $form.replaceWith(response);
      $(".current_user").remove();
    })

  });

});










