//= require jquery
import jquery from "jquery"
window.$ = jquery

$(function () {
  $(".toggleButton").on("click", function () {
    $(this).parents(".under").find(".toggle-comment").toggle(300);
  })
})
