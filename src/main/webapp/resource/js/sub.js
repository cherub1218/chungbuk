$(function(){
	$('ul.tab li').click(function () {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('on');
		$('.tabcontent').removeClass('current');
		$(this).addClass('on');
		$('#' + activeTab).addClass('current');
	});
	$('ul.tab li').click(function () {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('on');
		$('.tabcontent').removeClass('current');
		$(this).addClass('on');
		$('#' + activeTab).addClass('current');
	});

	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}

		$(this).siblings('.upload-name').val(filename);
	});

	locationNav();
});

function locationNav(){
  $('.depth').setMenu();
}

$.fn.setMenu = function () {
  var depth1LI = $('> a', this);
  var depth2UL = $('> ul', this);
  
  //泥� 硫붾돱 �좏깮
  var menu = $('.depth:first-child', this);
  menu.addClass('active');
  
  if ($('>ul', menu).length > 0) {
    $('>ul', menu).slideDown("fast");
    menu = $('>ul>li:first', li);
    menu.addClass('active');
    if ($('>ul', menu).length > 0) {
      $('>ul', menu).slideDown("fast");
      menu = $('>ul>li:first', li);
      menu.addClass('active');
    } else {
    }
  } else {
  }
  //泥� 硫붾돱 �좏깮
  $('a', this).click(function () {
    var depth = $(this).parent();
    var sibling = depth.siblings();
  
    sibling.removeClass('active');
    //$('li', sibling).removeClass('active');
    $('ul', sibling).slideUp("fast");
    depth.toggleClass('active');
  
    var ul = $('>ul', depth);
    if (ul.length > 0) {
      ul.slideToggle("fast", function () {
        //$('body').setLayout();
      });
      return false;
    } else if ($(this).attr('target') != '_blank') {
      //$('#loFrmContent').attr('src', $(this).attr('href') + '?timestamp=' + new Date().getTime());
      //return false;
    }
  });
}