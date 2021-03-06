// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready;

ready = function(){

    $("#star-1").hover(
      function(){
        $(this).addClass("star-hover");
      }, function(){
        $(this).removeClass("star-hover");
      }
    );

    $("#star-2").hover(
      function(){
        $("#star-1, #star-2").addClass("star-hover");
      }, function(){
        $("#star-1, #star-2").removeClass("star-hover");
      }
    );

    $("#star-3").hover(
      function(){
        $("#star-1, #star-2, #star-3").addClass("star-hover");
      }, function(){
        $("#star-1, #star-2, #star-3").removeClass("star-hover");
      }
    );

    $("#star-4").hover(
      function(){
        $("#star-1, #star-2, #star-3, #star-4").addClass("star-hover");
      }, function(){
        $("#star-1, #star-2, #star-3, #star-4").removeClass("star-hover");
      }
    );

    $("#star-5").hover(
      function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").addClass("star-hover");
      }, function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").removeClass("star-hover");
      }
    );


    $("#star-1").on({ 'click touchstart' : function(){
      $("#star-1, #star-2, #star-3, #star-4, #star-5").removeClass("star-selected");
      $(this).addClass("star-selected");
      $("#rating_rating").val(1);
    } });

    $("#star-2").on({ 'click touchstart' : function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").removeClass("star-selected");
        $("#star-1, #star-2").addClass("star-selected");
        $("#rating_rating").val(2);
    } });

    $("#star-3").on({ 'click touchstart' : function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").removeClass("star-selected");
        $("#star-1, #star-2, #star-3").addClass("star-selected");
        $("#rating_rating").val(3);
    } });

    $("#star-4").on({ 'click touchstart' : function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").removeClass("star-selected");
        $("#star-1, #star-2, #star-3, #star-4").addClass("star-selected");
        $("#rating_rating").val(4);
    } });

    $("#star-5").on({ 'click touchstart' : function(){
        $("#star-1, #star-2, #star-3, #star-4, #star-5").addClass("star-selected");
        $("#rating_rating").val(5);
    } });

};

$(document).ready(ready);
$(document).on('page:load', ready);
