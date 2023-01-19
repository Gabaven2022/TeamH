//= require jquery
//= require rails-ujs
var sethover = [];

$(function () {
  $(".toggleButton").on("click", function () {
    var $target = $(this).parents(".under").find(".toggle-comment");
    if ($target.is(':hidden')) {
      $target.slideToggle(300);
      $(this).parents('.under').find(".comment-input").focus();
    } else {
      $target.slideToggle(300);
    }
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
