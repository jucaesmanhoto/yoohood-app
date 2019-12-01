// $(document).ready(function(){
//   $(".category-choice").click(function(){
//     $(this).toggleClass("active");
//   });
// });
var categories = document.querySelectorAll('.category-choice');
categories.forEach(cat => {
  cat.addEventListener('click', (event) => {
    cat.classList.toggle('active');
  });
});
