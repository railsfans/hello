// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require highchart/highcharts.js
//= require highchart/exporting.js
//= require_tree . 
$(function(){

  $("#ajax th a, .pagination a").live("click", function(){
   /*
   $.getScript(this.href);
   */
   $.get(this.href, null, null, "script")
    return false;
}); 
  /* 
  $("#ajax_search ").submit(
 function(){
 $.get(this.action, $(this).serialize(),  null, "script");
 return false;
});
  */
  
  $("#ajax_search input").keyup(
 function(){
 $.get($("ajax_search").attr("action"), $("ajax_search").serialize(),  null, "script");
 return false;
});
   
})
 
 

