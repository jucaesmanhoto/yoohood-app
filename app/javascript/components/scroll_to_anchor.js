function goToByScroll(id){
      // Reove "link" from the ID
    id = id.replace("link", "");
      // Scroll
    $('html,body').animate({
        scrollTop: $("#"+id).offset().top},
        'slow');
}

const initScroll = () => {
  $("#scrollAnchor").click(function(e) {
        // Prevent a page reload when a link is pressed
      e.preventDefault();
        // Call the scroll function
      goToByScroll($(this).attr("id"));
  });
}

export { initScroll };
