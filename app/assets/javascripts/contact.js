$(document).ready(function() {
    $('#contact-form input, #contact-form textarea').focusin(function() {
        var $this = $(this);
        $this.parent().find('.error-message').remove();
    });


	$('#contact-form').submit(function() {
        var $this = $(this);
		
		if($this.hasClass('clicked')){
			return false;
		}

        $this.addClass('clicked');

        var button = $this.find('button');
		
		var errorMessage = button.data('error-message'),
			sendingMessage = button.data('sending-message'),
			okMessage = button.data('ok-message'),
            errorSending = button.data('error-sending'),
            defaultMessage = button.data('default-message'),
			hasError = false;
		
		$('#contact-form .error-message').remove();
		
		$('.requiredField').each(function() {
			if($.trim($(this).val()) == '') {
				var errorText = $(this).data('error-empty');
				$(this).parents('.controls').append('<span class="error-message" style="display:none;">'+errorText+'.</span>').find('.error-message').fadeIn('fast');
				$(this).addClass('inputError');
				hasError = true;
			} else if($(this).is("input[type='email']")) {
				if(!/@/.test($.trim($(this).val()))) {
					var invalidEmail = $(this).data('error-invalid');
					$(this).parents('.controls').append('<span class="error-message" style="display:none;">'+invalidEmail+'.</span>').find('.error-message').fadeIn('fast');
					$(this).addClass('inputError');
					hasError = true;
				}
			} else if($(this).is("input[type='phone']")) {
                if(!/[\d\+\(\)\s\-]/.test($.trim($(this).val()))) {
                    var invalidPhone = $(this).data('error-invalid');
                    $(this).parents('.controls').append('<span class="error-message" style="display:none;">'+invalidPhone+'.</span>').find('.error-message').fadeIn('fast');
                    $(this).addClass('inputError');
                    hasError = true;
                }
            }
		});
		
		if(hasError) {
            button.html('<i class="fa fa-times"></i>' + errorMessage);
			setTimeout(function(){
                button.html('<i class="fa fa-paper-plane"></i>' + defaultMessage);
				$this.removeClass('clicked');
			}, 2000);
		}
		else {
            button.html('<i class="fa fa-paper-plane"></i>'+sendingMessage);
			var formInput = $this.serialize();
			$.post($(this).attr('action'), formInput).done(function(data){
				button.html('<i class="fa fa-check"></i>' + okMessage);
                $this.find('input, textarea').val('');
				setTimeout(function(){
                    button.html('<i class="fa fa-paper-plane"></i>' + defaultMessage);
				    $this.removeClass('clicked');
				}, 30000);
			}).fail(function(data) {
                button.html('<i class="fa fa-times"></i>' + errorSending);
                setTimeout(function(){
                    button.html('<i class="fa fa-paper-plane"></i>' + defaultMessage);
                    $this.removeClass('clicked');
                }, 2000);
            });
		}
		
		return false;	
	});
});