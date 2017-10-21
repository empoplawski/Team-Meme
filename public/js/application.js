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


});
