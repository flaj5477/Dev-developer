<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="./resources/json.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/inline/ckeditor.js"></script>
<title>Insert title here</title>
<style type="text/css">

/*ck에디터~	*/
div[contenteditable] {
    outline: 1px solid #848484;
}

.ck-editor__editable {
    max-height: 100px;
    min-width : 100%;
}
/* ~~~ */

.red{
  color: red;
}

.hide{
  display: none;
}
.transEdit{
  padding: 5px 5px;
  margin: 0px;
  background-color: white;
  border: 1px solid;
  border-radius: 0.25rem;
  margin-right: -10px;
  margin-left: -10px;
  margin-top: -5px;
}

.transEdit .col{
  padding: 10px;
}

 .row{
  margin-right: 0px !important;
  margin-left: 0px !important;
  padding: 5px;
} 

/*
.transEdit .row > *:not(:first-child) {
  border-left: solid gray 0.5px;
}
 */
.ni-fat-remove{
  font-size: 20px;
}
.form-control-alternative2 {
  box-shadow: 0 1px 3px rgba(50, 50, 93, 0.6), 0 1px 3px rgba(0, 0, 0, 0.4);
  border: 1px;
  transition: box-shadow .15s ease;
}

.translate {
  border-bottom: 1px solid #848484;
  padding: 30px 30px;
}

.otherTrans{
  margin: 5px;
  background-color: #f4f5f7;
  border-radius: 0.25rem;
  cursor : pointer
}

.otherTrans div{
  border : 0px;
}

.col.otherTrans.pr-2 {
    max-width: 95%;
}

.badge a {
    color: #000;
}

</style>
  <style>
  .toggler { width: 500px; height: 200px; position: relative; }
  #button { padding: .5em 1em; text-decoration: none; }
  #effect { position: relative; }
  .newClass { width: 240px;  padding: 1em; letter-spacing: 0; margin: 0; }
  .anotherNewClass { text-indent: 40px; letter-spacing: .2em; width: 410px; height: 100px; padding: 30px; margin: 10px; font-size: 1.1em; }
  </style>
<script>
	pageName = "위키가이드";
	var membersGrade = '${sessionScope.members.membersGrade}';		//로그인한계정 등급
	var myEditor;	//ck에디터
	$(function(){
		btnControl();		//위키삭제
		startTrans();		//번역시작 번역라인클릭
		hover();			//마우스올라간 번역라인 색바꾸기
		btnClose();			//번역편집창 닫기
		otherTransClick();	//번역편집창에서 다른번역 가져오기
		//hideOtherTrans();	//	''		  다른번역 숨기기
		startTrans();			//번역시작 (번역 라인 클릭시)
		delWikiTrans();			//번역삭제
		wikiTransRec();			//추천,추천삭제

	    
			
		$('#modal-login').on('show.bs.modal', function (e) {
   		 
    	    $(this).find('.modal-content').load("login2");
    	});
	
		
	});

	/*
		위키버튼 클릭이벤트
	*/
	function btnControl(){
		$('#btnDelWiki').on('click', function(){
			/* document.frm.action.value = "deleteWiki";
			document.frm.submit(); */
			var result = confirm('정말삭제?'); 
			
			if(result) { //yes 
				$("#frm").attr("action", "deleteWiki").submit();
			} else { //no 
				return;
			}
		});
		
		$('#btnOriWiki').on('click', function(){
			$("#frm").attr("action", "getWiki").submit();
		});
		
		$('#btnTransWiki').on('click', function(){
			$("#frm").attr("action", "transWikiForm").submit();
		});
		
		$('#btnGetTransWiki').on('click', function(){
			$("#frm").attr("action", "getWikiTrans").submit();
		});
	}//버튼클릭이벤트 끝
	
	/*
		곽동우
		20191030
		번역 하기(문장클릭이벤트 번역 open)
	*/
	function startTrans(){
		$('.translate').off("click").on('click', function(){
			var id = $(this).attr("id");		//아이디 ex)translate13 .. 14..
			var manualNo = ${wiki.manualNo};
			
			
			transClose(id);

			
			$(this).attr("class", "translate hide");	//클릭한 기존 문장 숨김
			
			//translate 다음 클래스 transEdit hide 를 transEdit 로만듬
			$(this).nextAll().filter(".transEdit.hide").first().attr("class", "transEdit open");	//편집창 열어줌
			//$(this+'transEdit hide').first().attr("class", "transEdit");
			
			var manualLine = $(".transEdit.open .badge").attr('id');
			
			
			//ck 에디터 생성
			InlineEditor
	        .create( document.querySelector( '.editor'+manualLine ), {
	     	   toolbar: [ "undo", "redo", "bold", "italic", "blockQuote", "heading",  "link", "numberedList", "bulletedList",  "insertTable" ]  //툴바설정  
	        })
	        .then( editor => {
		            myEditor = editor;
		        } )
	        .catch( error => {
	            console.error( error );
	        } );
					
			getWikiTransLine(manualLine, manualNo);	//위키번역 가져오기
			
		});
	}
	
	/*
		곽동우
		20191031
		번역종료(편집창닫는다)
	*/
	function transClose(id){
		//편집창 숨기고 기존문장 보이게
		$('.translate.hide').attr("class", "translate");	
		$('.transEdit.open').attr("class", "transEdit hide");	//다른곳에 편집창 열려있으면 숨김
		
		//ck에디터가 존재하면 destroy해라
		var editor = myEditor;	//ck에디터
		if (editor) { editor.destroy(true); }
	}
	
	/*
		곽동우
		20191031
		x아이콘 클릭
	*/
	function btnClose(){
		$('[name="btn-trans-close"]').on("click", function(){
			transClose();
		});
	}
	
	function hover(){
		$('.translate, .otherTrans, .ni-fat-remove').hover(function() {	// on이벤트? 해줘야됨
			$(this).css("background-color", "#f0f0f0");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}
	
	/*
		곽동우
		20191103
		다른번역 클릭
	*/
	function otherTransClick(){
		$('body').on('click','.otherTrans',function(){
			var transArea = $(".transEdit.open #transContents");
			var otherTransVal = $(this).children().eq(1).html();	//왜 날짜 회원번호도 같이?
			
			//otherTransVal = otherTransVal.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			
			//otherTransVal.text();
			
			myEditor.setData(otherTransVal);	//텍스트입력창에 값저장
					
		});
	}
	
	/*
		곽동우
		20191108
		번역삭제
	*/
	function delWikiTrans(){
		$('body').on('click','[name=deltransbtn]',function(event){
			
			event.stopPropagation();	//버블링 제어 
			
			var $transNo = $(this).parent().parent().attr('id');
			
			var check = confirm("정말 삭제?");
			
			if(check){
				$.ajax({
					url: "delWikiTrans",
					type: "POST",
					dataType: 'text',	//받는 데이터타입
					data: { transNo : $transNo },	//request로 받아쓰면됨	(getparameter)
					/* success: function(data){
						if(data == 1) alert("삭제성공");
					} */
						error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
					    success : function(data) {
					    	$('#'+$transNo).detach();
					    },
					    complete : function() {
					         
					    }
				});
			}
		});
	}
	
	/*
		곽동우
		20191112
		번역추천버튼클릭
	*/
	function wikiTransRec(){
		$("body").on("click", ".ni-favourite-28", function(event){
			event.stopPropagation();	//버블링 제어 
			
			if("${sessionScope.members}" == ""){
				$('#wikimodal').click();
				return
			}
			
			var clickObj = $(this);
			
			var manualNo = "${wiki.manualNo}";
			var transNo = clickObj.parent().parent().attr('id');
			
			
			var membersNo = "${sessionScope.members.membersNo}";
						//$(this).next().children('a').text(); 등록한놈아이디
			
			if(clickObj.hasClass("red") === true){	//이미추천한거면
				$.ajax({
					url: 'wikiTransRecDel',
					type: 'post',
					data : { manualNo : manualNo,
							 transNo : transNo,
							 membersNo : membersNo  },
					success: function(){
						
						clickObj.removeClass("red");
					},
					error:function(){
						alert("실패");
					}
				});
			} else{	//추천안된거면
						
				$.ajax({
					url: 'wikiTransRec',
					type: 'post',
					data : { manualNo : manualNo,
							 transNo : transNo,
							 membersNo : membersNo  },
					success: function(){
						clickObj.addClass("red");
					},
					error:function(){
						alert("실패");
					}
				});
			}
		});
	}
	
	
	
	/*
		곽동우
		20191104
		파파고api사용
	*/
	function papagoTrans(){
		var manualBefore= $(".transEdit.open #oriContents").text();
		
		var check = confirm("파파고번역을 불러올까요?")
		
		if(check){
			$.ajax({
				url: "papagoTrans",
				type: 'POST',
				dataType: 'json',//결과 데이타 타입
				data: { oriContents : manualBefore },
				success: function(data){
					var papagoTrans = data.message.result.translatedText
					myEditor.setData(papagoTrans);
				},
				error:function(xht, status, message){
					alert(" status: " + status + " er:"+message);
				}
			});
		}
	}
	
	

	/*
		곽동우
		20191031
		위키등록 버튼 클릭시
		위키번역 등록
	*/
	function insertWikiTrans(){
		
		if("${sessionScope.members}" == ""){
			$('#wikimodal').click();
			return
		}
		
		//var transArea = $(".transEdit.open #transContents");
		var manualLine = $(".transEdit.open .badge").attr('id');
		var transArea = $(".transEdit.open .editor");
		var transVal = transArea.val();
		
		/* if(transVal == '') {
			alert("번역을 입력해야합니다")
			return; */
		if (myEditor.getData()=="") {
			alert('내용을 입력 하세요');
			myEditor.editing.view.focus()
			return;
		} else {
			//$("#frm").attr("action", "transWiki").submit();
			
			
			var manualBefore= $(".transEdit.open #oriContents").html();
			/* var manualAfter = transVal; */
			var manualAfter = myEditor.getData()	//ck에디터 값 가져옴
			var manualNo = '${wiki.manualNo}';
			var membersNo = '${sessionScope.members.membersNo}';
			
			//var param = JSON.stringify($("#frm").serializeObject());	//단건일때 //다건일땐 변환애줘야됨
			$.ajax({
				url: "transWiki",
				type: 'POST',
				dataType: 'json',
				data: JSON.stringify({manualLine: manualLine, 
									  manualBefore: manualBefore, 
									  manualAfter: manualAfter, 
									  manualNo: manualNo, 
									  membersNo: membersNo}),  //param, 
				contentType: 'application/json',
				success: function(response){
					if(response.result == true){	// 서버에서 등록후에 true라고 넘어오면
						//userList();
						alert("등록됨");
						myEditor.setData('');	//텍스트에어리어 초기화
						getWikiTransLine(manualLine, manualNo);	//메뉴얼번호 메뉴얼라인수 넘겨줌
						$("#transContent"+manualLine).html(manualAfter);	//번역 라인에 등록
						
						
					}
				},
				error:function(xht, status, message){
					alert(" status: " + status + " er:"+message);
				}
			});
		}
	}
	
	
	/*
		곽동우
		20191101
		위키번역 목록 조회 요청
	*/
	function getWikiTransLine(manualLine, manualNo){
		
		var membersNo = '${sessionScope.members.membersNo}';
		if(membersNo == null || membersNo == "") { membersNo = 0 };
		
		$.ajax({
			url:'getWikiTransLine',
			type:'POST', 	//요청방식
			dataType:'json',	//결과데이터타입
			data: JSON.stringify({manualLine: manualLine,
								  manualNo: manualNo,
								  loginNo : membersNo,
								  orderby : 'rec'}),
			contentType: 'application/json',
			error:function(xhr, status, msg){
				alert("상태값 : "+status + " Http에러메세지 :"+msg);
			},
			success:function(data){
				if(data.length == 0) {
					wikiTransEmpty(manualLine);
					return;
				}
				wikiTransLineResult(data, manualLine);
			}
		});
	}
	
	/*
		곽동우
		20191105
		번역없는라인
	*/
	function wikiTransEmpty(manualLine){
		$('#othertrans_'+manualLine).empty();
		
		$('<div>').attr('class','row otherTrans')
	   	 .append($('<div id="otcontents" >').attr("align", "center").html("번역이 없어요 "))
		 .append($('<i class="ni ni-fat-remove">'))
		 .appendTo('#othertrans_'+manualLine);
	}
	
	/*
		곽동우
		20191101
		위키번역 목록 조회 응답
	*/
	function wikiTransLineResult(data, manualLine){	 //data서버에서넘겨받은 json
		$('#othertrans_'+manualLine).empty();
		$.each(data,function(idx,item){		//데이터안의 건수만큼 each돌아감
			/* $('<tr>').append($('<td>').html(item.id))
					 .append($('<td>').html(item.name))
					 .append($('<td>').html(item.password))
					 .append($('<td>').html(item.role))
					 .append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					 .append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
					 .append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
					 .appendTo('tbody'); */
			   var manualAfterBr = (item.manualAfter).replace(/(\n|\r\n)/g, '<br>');	//br치환
			   
			   //이미 번역추천 했나?
			   if(item.myTransRec == 'o'){
				   var recBtn = $('<i class="ni ni-favourite-28 red">');	//빨간버튼
			   }else {
				   var recBtn = $('<i class="ni ni-favourite-28">');		//회색버튼
			   }
			   
			   //자기번역이면 삭제버튼 보이게
			   if(item.membersId == "${sessionScope.members.membersId}"){
				   var delbtn = '<i name="deltransbtn" class="ni ni-fat-remove">' ;
			   }else{
				   var delbtn = null;
			   }
			   
			  
			   $('<div>').attr({
				   			'class': 'col otherTrans pr-2 ',
				   			"id" : item.transNo
			   		})
				.append($('<div class="row nav nav-pills justify-content-end">').html(  delbtn  ))			   		
			   	.append($('<div id="otcontents" class="row" >').html(manualAfterBr))   
			   	.append($('<div class="row nav nav-pills justify-content-end">')
			   			.append("추천수"+item.rec).append( recBtn ).append($('<badge class="badge badge-primary ml-3">').html("<br>"+item.translDate+" <br> "+item.membersId+"</a>" )))//"<a href=' getWiki= "+item.membersNo +"'>"+
				.appendTo('#othertrans_'+manualLine);
		});//each
	}//wikiTransLineResult

	/*
		20191106
		곽동우
		otherTrans 숨기기
	*/
	/* function hideOtherTrans(){
		$( ".transEdit" ).on( "click", function() {
			alert("와!")
		      $( "[name = rEdit]" ).switchClass( "col", "col hide", 1000 );
		      $( "[name = lEdit]" ).switchClass( "anotherNewClass", "newClass", 1000 );
		    });
	} */
	
	/*
		20191107
		곽동우
		otherTrans 숨기기
	*/
	function setTrans(){
		for(var i in transList) {
			console.log(i);
			
		}
	}
	
	/*
		20191115
		곽동우
		ck에디터 생성
	*/
	/* function createCKEditor(manualLine){
		var Editor;	
		
		InlineEditor	//ck 에디터 사용
        .create( document.querySelector( '.editor'+manualLine ), {
     	   toolbar: [ "undo", "redo", "bold", "italic", "blockQuote", "heading",  "link", "numberedList", "bulletedList",  "insertTable" ]    
        })
        .then( editor => {
	            console.log( 'Editor was initialized', editor );
	            Editor = editor;
	        } )
        .catch( error => {
            console.error( error );
        } );
		
		return Editor;
	} */
</script>
</head>
<body>
<button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-color="info" data-placement="top" data-content="This is a very beautiful popover, show some love.">
  Info popover
</button>
	<div class="main p-5">
		<form name="frm" id="frm" action="updateWikiForm" method="post">
			<div>
			<div id="modal-login" class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="로그인" aria-describedby="테스트 모달">
				<div class="modal-dialog">
					<div class="modal-content" style="background: #5561A5; width:70%;"></div>
				</div>
			</div> 	
				<c:if test="${sessionScope.members.membersGrade eq 5}">
					<span class="col-3 text-right">
						<button type="button" id="btnDelWiki" class="btn btn-danger">삭제</button>
						<button class="btn btn-primary">수정</button>
					</span>
				</c:if>
			</div>
		
			<div class="nav-wrapper">
			    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0" id="btnOriWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-1" aria-selected="false"><i class="ni ni-cloud-upload-96 mr-2"></i>원문보기</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0 active" id="btnTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-2" aria-selected="true"><i class="ni ni-bell-55 mr-2"></i>번역하기</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0" id="btnGetTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>번역본보기</a>
			        </li>
			    </ul>
			</div>
		
			<input type="hidden" name="manualNo" value="${wiki.manualNo}">
			<input type="hidden" name="manualContentsPath" value="${wiki.manualContentsPath}">
		
			<div class="col">
				<div class="row align-items-center">
					<div class="col">
						<div class="ct-page-title">
				          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
				          <span>
							<c:choose>
								<c:when test="${wiki.manualTags eq null}">
									<span class="badge badge-default" style="color: white"><a href = "wikihome?select=tags&page=1&searchVal=기타" style="color: white">기타</a></span>
								</c:when>
								<c:when test="${not empty wiki.manualTags}">
									<c:forEach items="${wiki.divTagList }" var="tag" varStatus="index">
										<span class="badge badge-default" ><a href = "javascript:clickTag(event,'${tag}')" style="color: white">${tag}</a></span>
									</c:forEach>		
								</c:when>
							</c:choose>
						  </span>
				        </div>
			        </div>
			    </div>
	
				<hr>
				<%-- 위키 번역 문장 뿌려줌 --%>
				
				<c:forEach var="entry" items="${transWiki}" varStatus="status">
					<c:if test="${not empty entry.value}">
						<div class="translate open col" id="translate${entry.key}">
							<div class="row">
								<div class="col">${entry.value }</div>
								
								<c:choose>	<%-- 번역있으면 출력해줌  (transList 컨트롤러에서 따로 들고온거임)  --%>
									<c:when test="${not empty transList.get(status.index)}">
										<div class="translated col font-italic" id="transContent${entry.key}">${transList.get(status.index)}</div>
									</c:when>
									<c:when test="${empty transList.get(status.index)}">
										<div class="untranslated col font-italic" id="transContent${entry.key}">${transList.get(status.index)}</div>
									</c:when>
								</c:choose>
								
							</div>
						</div>
						
						
						<%-- 변역등록 편집기 --%>	
						<div class="transEdit hide">
							<div class="row">
								
								<%-- 번역편집기 왼쪽    --%>
								<div class="col" name="lEdit">
									<div class="row">
										<span class="badge badge-primary" id="${entry.key}">
											${wiki.manualTitle}/번역_${entry.key} </span>
									</div>
									<div class="row" id="oriContents">
										${entry.value }
									</div>
									<div class="row">
										<div class="editor${entry.key}" id="transContents">
									        ${entry.value }
									    </div>
									</div>
									<div class="row">
										<a href='javascript:void(0);' onclick="insertWikiTrans();" class="btn btn-sm btn-primary">번역등록</a>
										<a href='javascript:void(0);' onclick="papagoTrans();" class="btn btn-sm btn-primary">구글번역</a>
									</div>
								</div>
								
								<%-- 번역편집기 오른쪽--%>
								<div class="col mr--3" name="rEdit">
									<span class="row nav nav-pills justify-content-end">
											<i name="btn-trans-close" class="ni ni-fat-remove"></i>
									</span>
									<div class="scrollspy-example" id="othertrans_${entry.key}">
										<div class="row">
											다른사람 번역한거 표시
										</div>
									</div>
								
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</form>
	</div>
	
	<a data-toggle="modal" href="login2" data-target="#modal-login"
	role="button" id="wikimodal" style="display: none">로그인</a>	
</body>
</html>