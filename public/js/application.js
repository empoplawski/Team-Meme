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
      });

    });
  });

  $("#container").on("submit", ".vote-form-upvote-meme", function(event) {
    event.preventDefault();
    var form = $(this)
    var url = form.attr("action");
    var method = form.attr("method");

    var request = $.ajax({
      method: method,
      url: url
    });

    request.done(function(vote){
      var meme_total_votes = form.siblings(".vote_count")
      meme_total_votes.text(vote["vote_count"])
    });
  });

  $("#container").on("submit", ".vote-form-downvote-meme", function(event) {
    event.preventDefault();
    var form = $(this)
    var url = form.attr("action");
    var method = form.attr("method");

    var request = $.ajax({
      method: method,
      url: url
    });

    request.done(function(vote){
      var meme_total_votes = form.siblings(".vote_count")
      meme_total_votes.text(vote["vote_count"])
    });
  });

  $(".caption-ul-list").on("submit", ".vote-form-upvote-caption", function(event) {
    event.preventDefault();
    var form = $(this)
    var url = form.attr("action");
    var method = form.attr("method");

    var request = $.ajax({
      method: method,
      url: url
    });

    request.done(function(vote){
      var caption_total_votes = form.siblings(".vote_count")
      caption_total_votes.text(vote["vote_count"])
    });
  });

   $(".caption-ul-list").on("submit", ".vote-form-downvote-caption", function(event) {
    event.preventDefault();
    var form = $(this)
    var url = form.attr("action");
    var method = form.attr("method");

    var request = $.ajax({
      method: method,
      url: url
    });

    request.done(function(vote){
      var caption_total_votes = form.siblings(".vote_count")
      caption_total_votes.text(vote["vote_count"])
    });
  });


  $("nav").on("click", ".login", function(e) {
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

  $(".favorites").on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);

    var promise = $.ajax ({
      method: $form.attr("method"),
      url: $form.attr("action")
    })

    promise.done(function(response) {
      $form.children().first().replaceWith(response);
    })

  });

});


