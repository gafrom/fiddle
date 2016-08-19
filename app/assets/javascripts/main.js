$(function(){
	"use strict";
	$(".header__hamburger").on("click", function(){
		if(!$(this).hasClass("activated")){
			$(this).addClass("activated");
			$(".header__menu").addClass('header__menu_mobile-visible');
		} else {
			$(this).removeClass("activated");
			$(".header__menu").removeClass('header__menu_mobile-visible');
		}


	});

	$(window).scroll(function(){
		if($(this).scrollTop() > 100) {
			$(".header").addClass("header_compact");
		} else {
			$(".header").removeClass("header_compact");
		}
	});

	$(window).resize(function(){
		if($(this).width() >= 1024){
			$(".header__menu").removeClass('header__menu_mobile-visible');
			$(".header__hamburger").removeClass('activated')
		}
	});

	$('.questionnaire__form select').heapbox({
		'effect': {
			'type': 'standard'
		}
	});

	$('#heapbox_questionnaire-birthyear').addClass('heapBox_short');
	$('#heapbox_questionnaire-lang-skills').addClass('heapBox_short');
	$('#heapbox_questionnaire-wanted-schedule').addClass('heapBox_normal');
	$('#heapbox_questionnaire-wanted-office').addClass('heapBox_normal');
	$('#heapbox_questionnaire-php-level').addClass('heapBox_wide');
	$('#heapbox_questionnaire-js-level').addClass('heapBox_wide');
	$('#heapbox_questionnaire-html-level').addClass('heapBox_wide');
	$('#heapbox_questionnaire-db-design-level').addClass('heapBox_wide');
	$('#heapbox_questionnaire-patterns-level').addClass('heapBox_wide');
	$('#heapbox_questionnaire-oop-level').addClass('heapBox_wide');

	$('.q-button_skills').on('click', function(e){
		e.preventDefault();
		if(!$(this).hasClass('q-button_skills_active')){
			$(this).addClass('q-button_skills_active');
		} else {
			$(this).removeClass('q-button_skills_active');
		}

		$(this).text(function(i, text){
			return text === "Добавить комментарий" ? "Удалить комментарий" : "Добавить комментарий";
		});
		$(this).parents('.form-row').find('.level-comment').slideToggle(150);
	});

	$('.form-row__main-resume input[type="file"]').change(function(){
		console.log($('.form-row__main-resume input[type="file"]')[0].files[0].name)
	});

	var parsleyConfig = {
		errorsContainer: function(pEle) {
				var $err = pEle.$element.siblings('.error-block');
				return $err;
		},
		errorClass: 'input-error'
	}

	$('form.questionnaire__form').parsley(parsleyConfig);
});
