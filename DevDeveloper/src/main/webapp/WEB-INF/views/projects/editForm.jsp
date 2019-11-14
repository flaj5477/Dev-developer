<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
<!-- Initialize Quill editor -->
	var toolbarOptions = [ [ {
		'font' : []
	} ], [ {
		'size' : [ 'small', false, 'large', 'huge' ]
	} ], // custom dropdown

	[ {
		'color' : []
	}, {
		'background' : []
	} ], // dropdown with defaults from theme

	[ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
	[ 'blockquote', 'code-block' ],

	[ {
		'header' : 1
	}, {
		'header' : 2
	} ], // custom button values
	[ {
		'list' : 'ordered'
	}, {
		'list' : 'bullet'
	} ],

	[ {
		'align' : []
	} ],

	[ 'clean' ] // remove formatting button
	];

	$(function() {
		var quill = new Quill('#editor', {

			modules : {
				toolbar : toolbarOptions
			},
			theme : 'snow'

		});

		var options = {
			debug : 'info',
			modules : {
				toolbar : '#toolbar'
			},
			placeholder : 'Compose an epic...',
			readOnly : true,
			theme : 'snow'
		};
		var editor = new Quill('#editor', options);
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<textarea class="form-control form-control-alternative" id="editor" name="editor" rows="20" placeholder="여기는 입력하는 곳입니다."></textarea>
</body>
</html>