/* global $*/
$('.see-more').click(function() {
  $(this).closest(".content-body").find(".truncated").hide();
  $(this).closest(".content-body").find(".untruncated").show();
});

$('.see-more').click(function() {
  $(this).closest(".topic-body").find(".truncated").hide();
  $(this).closest(".topic-body").find(".untruncated").show();
});


$(function() {
  $('#back a').on('click', function(event) {
    $('body, html').animate({
      scrollTop:0
    }, 1000);
    event.preventDefault();
  });
});


$(function() {
  $('#input-file').on('change', function(e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  }); 
});

$(function() {
  $('#input-file_1').on('change', function(e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview_1").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  }); 
});

$(function() {
  $('#input-file_2').on('change', function(e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview_2").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  }); 
});

$(function() {
  $('#input-file_3').on('change', function(e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview_3").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  }); 
});


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