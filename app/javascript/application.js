//= require jquery
//= require rails-ujs
var sethover = [];

$(function () {
  $(".toggleButton").on("click", function () {
    $(this).parents(".under").find(".toggle-comment").toggle(300);
    $(this).parents('.under').find(".comment-input").focus();
  });
  $('.comment-list').hover(function () {
    sethover = setTimeout(function () {
      $('.comment-list').addClass('on-scroll');
    }, 500);
  }, function () {
    $('.comment-list').removeClass('on-scroll');
    clearTimeout(sethover);
  });
  if ($('.toukou').innerHeight() < 500 || $('.text-list').innerHeight() < 500) {
    $('.tweet').css('position', 'fixed');
  } else {
    $('.tweet').css('position', 'sticky');
  };
});
