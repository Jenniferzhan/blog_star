# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->  

  $("tr.select").click ->  
    $("tr.select").css("backgroundColor","white");  
    this.style.backgroundColor = "#357ebd"
    $("#user_id").val($(this).data("picture_id"));
