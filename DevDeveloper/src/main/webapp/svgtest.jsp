<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SVG.js페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.7.1/svg.js"></script>
<script>
	$(document).ready(function(){
		var draw = SVG('drawing')
		
		var rect1 = $('#rect1').attr({ fill: '#196127' })
		var rect2 = $('#rect2').attr({ fill: '#239a3b' })
		var rect3 = $('#rect3').attr({ fill: '#7bc96f' })
		var rect4 = $('#rect4').attr({ fill: '#c6e48b' })
		var rect5 = $('#rect5').attr({ fill: '#ebedf0' })
		
	})
	
</script>
</head>
<body>
<div id="drawing">
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="100">
  <g>
    <rect width="30" height="30" fill="#196127" id="rect1"></rect>
    <rect width="30" height="30" y="40" fill="#196127"></rect>
    
   </g>
  </svg>
  
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30">
    <rect width="30" height="30" fill="#196127" id="rect2"></rect>
  </svg>
  
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30">
    <rect width="30" height="30" fill="#196127" id="rect3"></rect>
  </svg>
  
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30">
    <rect width="30" height="30" fill="#196127" id="rect4"></rect>
  </svg>
  
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30">
    <rect width="30" height="30" fill="#196127" id="rect5"></rect>
  </svg>
   
   
</div>
</body>
</html>