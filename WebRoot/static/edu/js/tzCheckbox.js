(function($){
	$.fn.tzCheckbox = function(options){
		
		// Default On / Off labels:
		
		options = $.extend({
			labels : ['ON','OFF']
		},options);
		
		return this.each(function(){
			var originalCheckBox = $(this),
				labels = [];

			// Checking for the data-on / data-off HTML5 data attributes:
			if(originalCheckBox.data('on')){
				labels[0] = originalCheckBox.data('on');
				labels[1] = originalCheckBox.data('off');
			}
			else labels = options.labels;

			// Creating the new checkbox markup:
			var checkBox = $('<span>',{
				class	: 'tzCheckBox '+(this.checked?'checked':''),
				html:	'<span class="tzCBContent">'+labels[this.checked?0:1]+
						'</span><span class="tzCBPart"></span>'
			});

			// Inserting the new checkbox, and hiding the original:
			checkBox.insertAfter(originalCheckBox.hide());

			checkBox.click(function(){
				checkBox.toggleClass('checked');
				var isChecked = checkBox.hasClass('checked');
				originalCheckBox.attr('checked',isChecked);
				if(isChecked){ 
			 
					$(".tzCheckBox").css({
						"backgroundPosition":"top left",
						"margin":"0 14px 0 0",
						"cursor": "pointer" 
					});
					
					$(".tzCBContent").css({
						"text-align": "right",
						"padding":"0 0 0 38px"
					});
					
					$(".tzCBPart").css({
						"backgroundPosition": "top right",
						"left": "auto",
						"right":"-14px"
					});
				 
				}else{
					$(".tzCheckBox").css({
						"backgroundPosition":"",
						"margin":"",
						"margin-left": "14px"    
					});
					$(".tzCBContent").css({
						"text-align": "left", 
						"padding":""
					});
					
					$(".tzCBPart").css({
						"backgroundPosition": "",
						"left":"-14px"
					});
				}
				//展示时间控件
				showREMINDLEARNING();
				
				checkBox.find('.tzCBContent').html(labels[isChecked?0:1]);
			});
			
			// Listening for changes on the original and affecting the new one:
			originalCheckBox.bind('change',function(){
					
				checkBox.click();
			});
		});
	};
})(jQuery);