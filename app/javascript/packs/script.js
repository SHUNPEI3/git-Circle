$('.see-more').click(function(){
  $(this).closest(".content-body").find(".truncated").hide();
  $(this).closest(".content-body").find(".untruncated").show();
})


const mySwiper = new Swiper(".swiper-container", {

  slidesPerView: 1,
  spaceBetween: 50,

  breakpoints: {
    767: {
      spaceBetween: 10,
      width: 250,
      slidesPerView: 1
    }
  },

  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev"
  },

  pagination: {
    el: '.swiper-pagination',
  },
});