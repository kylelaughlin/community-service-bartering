// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//index.js.erb (same folder as index.html.erb)
var request_summary = "request_summary"
$("#request-list").html("<%= escape_javascript(render(request_summary)) %>");
