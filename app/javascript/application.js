//= require jquery
//= require rails-ujs
var sethover = [];

$(function () {
  $(".toggleButton").on("click", function () {
    var $target = $(this).parents(".under").find(".toggle-comment");
    if ($target.is(':hidden')) {
      $target.toggle(300);
      $(this).parents('.under').find(".comment-input").focus();
    } else {
      $target.toggle(300);
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

  $.error = function (str) {
    $("div").text(str);
  };
  $("button").click(function () {
    $.parseJSON("JSONではありません");
  });
  $(".notification-wrapper").animate({ opacity: 1, height: 50 }, 1000);
  setTimeout(function () {
    $(".notification-wrapper").fadeOut(500);
  }, 3000)
});
