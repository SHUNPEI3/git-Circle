const swiper = new Swiper(".swiper", {
  slidesPerView: 1,
    breakpoints: {
    576: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 3,
    },
    992: {
      slidesPerView: 4,
    },
  },

   spaceBetween: 20,     // スライド間の間隔を１０pxに設定

  pagination: {
    el: ".swiper-pagination",
    type: 'bullets', // ●○◯◯形式
    clickable: true, // type: 'bullets'の時のみ有効 ◯クリックで直接そのスライドへ移動
  },

  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev"
  }
});