$(function() {

	$(".textbox").focus(function() {
			if (this.value == "Username" || this.value == "Password") {
				this.value = '';
				$(this).css("color","#222222");
			}
	});

	$(".textbox").blur(function() {
		if ($(this).attr("name") == "txtUsername") {
			if (this.value == '') {
				this.value = "Username";
				$(this).css("color","gray");
			}
		} else {
			if (this.value == '') {
				this.value = "Password";
				$(this).css("color","gray");
			}
		}
	});
	
	/*****PARALLAX EFFECT*****/
	
	$(window).bind('scroll',function(e){
	    parallaxScroll();
	});
	 
	function parallaxScroll(){
	    var scrolled = $(window).scrollTop();
	    $('#header').css('background-position','center'+' '+(-350+(scrolled*.5))+'px');
	}
	
	/*****LOGO EFFECT*****/
	
	function logoEffect(){
		var scrolled = $(window).scrollTop();
		
		if (scrolled > 50) {
			$("#logo").css("position","fixed");
			$("#logo").css("padding","0px");
			$("#desc").css("padding-top","250px");
			
			$("#logo img").css("width",(150-((scrolled-50)*.25))+'px');
			
			if ($("#logo img").width() <= 50) {
				$("#logo img").css("width","50px");
				$("#logo").css("background-color","#111111");
			} else {
				$("#logo").css("background-color","transparent");
			}
		} else {
			$("#logo").css("position","static");
			$("#logo").css("padding","50px 0px");
			$("#desc").css("padding-top","0px");
		}
	}
	
	/*****HANDLE RESOLUTION CHANGING*****/
	
	if (screen.width < 980 || $(window).width() < 980) {
		if ($("#formmobilecss").length == 0) {
			$("head").append("<link id='formmobilecss' href='css/form-mobile.css' type='text/css' rel='stylesheet' />");
		}
	} else {
		$("#formmobilecss").remove();
	}
	
	$(window).resize(function() {
		if ($(window).width() < 980) {
			if ($("#formmobilecss").length == 0) {
				$("head").append("<link id='formmobilecss' href='css/form-mobile.css' type='text/css' rel='stylesheet' />");
			}
		} else {
			$("#formmobilecss").remove();
		}
	});
	
	// /*****SHOW SIGNUP FORM*****/
	
	// $(".button-signup").click(function(){
	// 	$(".button-signup").slideUp('fast', function(){
	// 		$("#divSignup").slideDown('fast');
	// 	});
	// });
	
	$(".avatar-fb").click(function(){
		$(".avatar-fb").css("border","none");
		$(this).css("-moz-box-sizing","border-box");
		$(this).css("border","solid 3px red");

		var fbid = $(this).attr("alt");
		$("#hidden-avatar").remove();
		$("form").append("<input id='hidden-avatar' name='possession[user_invited_id]' type='hidden' value='" + fbid + "' />");
	});




});
