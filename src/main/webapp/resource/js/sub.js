$(function(){

	uploadFile()

	$('.gnb .dep2 > a').mouseover(function(){
		$('.gnb .dep2 > ul').stop().slideUp('fast');
		$(this).next('ul').stop().slideDown('fast');
	});
	$('.gnb .dep2 > ul').mouseleave(function(){
		$(this).stop().slideUp('fast');
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

});

function uploadFile(){ //upload file
    var fileTarget = $('.form.file.upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        }
        else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };
        $(this).siblings('.upload-name').val(filename);
    });
}

$.fn.setMenu = function () { //lnb menu dropdown
  var depth1LI = $('>ul>li', this);
	var depth2UL = $('>ul', depth1LI);
 
	var li = $('>ul>li:first', this);
	li.addClass('active');
 
	if ($('>ul', li).length > 0) {
		$('>ul', li).slideDown("fast");
		li = $('>ul>li:first', li);
		li.addClass('active');
		if ($('>ul', li).length > 0) {
			$('>ul', li).slideDown("fast");
			li = $('>ul>li:first', li);
			li.addClass('active');
		} else {
		}
	} else {
	}
 
	$('a', this).click(function () {
		var li = $(this).parent();
		var sibling = li.siblings();
 
		sibling.removeClass('active');
		//$('li', sibling).removeClass('active');
		$('ul', sibling).slideUp("fast");
		li.addClass('active');
 
		var ul = $('>ul', li);
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

$.fn.pageInit = function () {
	$('.lnb').setMenu();
};

$(function () {
	$('html').pageInit();
});
