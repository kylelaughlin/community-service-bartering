// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  $("#search_form input").keyup(function() {
    $.get($("#search_form").attr("action"), $("#search_form").serialize(), null, "script");
    return false;
  });
});

//index.js.erb (same folder as index.html.erb)
var request_summary = "request_summary"
$("#bands").html("<%= escape_javascript(render(request_summary)) %>");
