$(function() {
  $(document).foundationNavigation();
  $.waypoints.settings.scrollThrottle = 30;

  $('section').waypoint(function(event, direction) {
   console.log($(this).attr("id"));

   $("#main_nav li").removeClass();
   $("#main_nav li#section_" + $(this).attr("id")).addClass("active");
  });

  $("#main_nav li a").click(function(e) {
    $("#main_nav li").removeClass();
    $(this).parent().addClass("active");
    $($(this).attr("href").split("/")[1]).scrollTo();
    e.preventDefault();
  });

});