# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	
	getStyle = (oElm, strCssRule) ->
	  strValue = ""
	  if document.defaultView and document.defaultView.getComputedStyle
	    strValue = document.defaultView.getComputedStyle(oElm, "").getPropertyValue(strCssRule)
	  else if oElm.currentStyle
	    strCssRule = strCssRule.replace(/\-(\w)/g, (strMatch, p1) ->
	      p1.toUpperCase()
	    )
	    strValue = oElm.currentStyle[strCssRule]
	  strValue
	
	element = document.getElementById("new_piece")
	width = getStyle(element, "width")
	height = getStyle(element, "height")
	alert "setting window size to " + width + "," + height
	window.resizeTo parseInt(height), parseInt(width)
