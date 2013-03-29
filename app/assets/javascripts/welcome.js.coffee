# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$ ->
	$("td[id='piece_title']").hover -> 
		temp = $(this).html()
		$(this).html($(this).parent().find("#comment").val())
		$(this).closest('tr').find("#comment").val(temp)
		
