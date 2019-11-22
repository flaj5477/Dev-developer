<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	pageName = "Q & A";
</script>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/qna.css">
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/styles/github.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
<script>
	hljs.initHighlightingOnLoad();
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>


<body id="pp">

	<form name = 'qnaform' action='updateQnaForm' method = 'post'>
	<input type="hidden" name="qNo" value="${qna.qNo}">
	</form>
	
	<div class="container-fluid mt--3">
		<div class="main-qqqcontent">
			<div class="col-xs-12 qqqcard">
				<div class="main-question-detail">
					<h3>
						${qna.qTitle }
						<div class="question-meta">
							<span>조회수 ${qna.qViews}</span> <span>답변수 ${qna.aCount}</span> <span>좋아요
								${qna.count}</span>
							<%-- <span>등록일 ${qna.qDate }</span> --%>
						</div>
					</h3>
					<div class="question-detail-content" style="border-bottom: 1px solid #cdb8f3;">
						<div class="rowqqq">
							<div style="margin-top: 10px;"></div>
						</div>
						<div class="question-content-left">
							<ul>
								<li class="question-vote-count licount" style="margin-bottom: 5px;">${questionVO.qLikeCount}</li>
								<li><a class="rec_update" type="1" no="${qna.qNo}"> <i class="fa fa-star fa-2x" 
									
										aria-hidden="true"></i>
								</a></li>
							</ul>
						</div>
						<div class="question-content-right mt-15">
							<div>
								<div class="content fr-view" style="margin-bottom : 0px">						 
										${qna.qContents }		 
								</div>
							</div>
							<div class="row content-bottom">
								<div class="col-xs-12" style="margin-bottom : 0px">
									<ul class="contributors"
										style="float: right; margin-top: 30px;">
										<li class="question"><a class="user-card hover"
											style="margin-bottom: 20px;" href="#">
												<div class="user-image">
													<img alt="${qna.membersId}"
														src="${pageContext.request.contextPath}/images/profile/${qna.membersImage}"
														width="110px" height="110px" />
												</div>
												<div class="user-info">
													<h6 class="user-name">${qna.membersId}</h6>
													<h6 class="contribution-time" style="font-size: 0.670rem;">${qna.qDate}에 작성</h6>
												</div>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class ="qUp"> 
				<button class="btn qqqbutton" 
			 onclick="location.href='qna'">
					목록보기</button>				
					<c:if test="${not empty sessionScope.members.membersId}">					 
					<button class="btn qqqbutton" id="ani">
					답변달기</button>	
					</c:if>
					 <c:if test = "${sessionScope.members.membersNo == qna.membersNo}"> 			
				<button class="btn qqqbutton" 
			 onclick="document.qnaform.submit()">질문수정</button> 
			  <button class="btn qqqbutton" id="queDel">질문삭제</button>			
					</c:if>
				</div>	
			</div>	 
			<c:if test="${not empty anslist}">
			<div class="col-xs-12 qqqcard qqqcard-tab">
                <div class="main-qqqtopbar-wrapper">
                    <h2 class="title pull-left">
                        ${fn:length(anslist)} 답변                
                    </h2>                               
                </div>
				<c:forEach items="${anslist}" var="ans">
                <div class="main-question-answer">
                	
                    <div class="answer-detail-content answer-selection">
                        <div class="answer-content-left">
                            <ul>
								<li class="question-vote-count licount" style="margin-bottom: 5px;">${ans.aLikeCount}</li>
								<li><a class="rec_update" type="2" no="${ans.aNo}"> <i class="fa fa-star fa-2x"
										aria-hidden="true"></i>
								</a></li>
							</ul>
                        </div>
                        <div class="answer-content-right" style="
  						  padding-top: 30px;">           
                                <div class="content fr-view" style="margin-bottom : 0px">
									${ans.aContents}
                                </div>
                         							<div class="row content-bottom">
								<div class="col-xs-12" style="margin-bottom : -25px">									
									<ul class="contributors"
										style="float: right; margin-top: 30px;">
										<li class="question"><a class="user-card hover"
											style="margin-bottom: 20px;" href="#">
												<div class="user-image">
													<img alt="${ans.membersId}"
														src="${pageContext.request.contextPath}/images/profile/${ans.membersImage}"
														width="110px" height="110px" />
												</div>
												<div class="user-info">
													<h6 class="user-name">${ans.membersId}</h6>
													<h6 class="contribution-time" style="font-size: 0.670rem;">${ans.aDate}에 작성</h6>
												</div>
										</a></li>
									</ul>
								</div>
							</div>       
                        </div>
                    </div> <%-- <input type="hidden" value="${ans.aNo}" id= "aa"> --%>
                   <c:if test = "${sessionScope.members.membersNo == ans.membersNo }">
                   <input type="hidden" id= "sdf" value="${ans.aNo}">
                <div class ="qUp"> <button class="btn qqqbutton dd" id="ansUpdate" value="${ans.aNo}">
					답변수정</button>
				 <button class="btn qqqbutton" id="ansDel"
				 onclick="dddd(${ans.aNo},${ans.qNo})">
					답변삭제</button></div>
					</c:if>
                </div>
                </c:forEach>
            </div>
            </c:if>   
			<c:choose>
        	<c:when test="${not empty sessionScope.members.membersId}">
				<div class="col-xs-12 qqqcard pl-10" id="ansUpdatee">
			<div class="main-answer-form" id="answer_form">
				<form method="post" action="insertAnq" id ="anq">
				<input type ="hidden" name ="qNo" value="${qna.qNo}"></input>
				<input type ="hidden" id = "zd"name ="" value=""></input>
				<h2 class="title">답변 작성</h2>
				<div class="qqqalert qqqalert-secondary mb-20">
					<p style="font-size: 0.8rem">
						<img src="https://i.imgur.com/CUtuI2T.png">버튼으로 코드를 넣을 수
						있습니다.
					</p>
				</div>
				<div class="form-group">
					<textarea name="aContents" cols="40" rows="10" id="ans_content"
						placeholder="에디터">
					</textarea>
				</div>
					<button class="btn qqqbutton" type="submit" id="ansbutton">답변하기</button>				 
				</form>
			</div>
			<div id ="asd"></div>
		</div>
		</c:when>
		<c:otherwise>
		<div style ="text-align:center">답변을 작성하려면<a data-toggle="modal" href="login2" data-target="#modal-login"
	role="button"> 로그인</a>이 필요합니다.</div>
		<br><br>
		</c:otherwise>
		</c:choose>
	</div>
		 <div id="ffff"></div>
</div>
  

  	<div id="modal-login" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="로그인" aria-describedby="테스트 모달">
		<div class="modal-dialog">
			<div class="modal-content" style="background: #5561A5; width:70%;"></div>
		</div>
	</div> 

	 <script>
                CKEDITOR.replace( 'ans_content' ,{height: 300, 
                	  filebrowserUploadUrl: 'qnaUpload.jsp'
                });
                
            	$('#modal-login').on('show.bs.modal', function (e) {	 
            	    $(this).find('.modal-content').load("login2");
            	});

            	
 $(function(){
		/*--------------------------------
		          좋아요 증가/삭제
		--------------------------------*/
		$(".rec_update").click(function(){
		var type = $(this).attr('type'); 
		var no = $(this).attr('no');
		var li = $(this).parent().prev();
		var star = $(this).children();
			$.ajax({
				url: "recUpdate",
                type: "POST",
                data: {
                	qaNo: no,
                	qaType: type
                    
                },
                success: function (data) {
                	li.html(data);
                	star.css('color', '#eca912');
                }
                	
               
			})  //end of ajax
		}) //end of click

     		 
		/*--------------------------------
		        답변작성
		--------------------------------*/    		 
		$("#ansbutton").click(function(){
			var content = CKEDITOR.instances['ans_content'].getData();
			
			if(content==""){
				alert("내용을 입력하세요");
				CKEDITOR.instances['ans_content'].focus();
				return false;
			}			
			document.insertAnq.submit();			
		  
	 	}) 
	 
		/*--------------------------------
		          답변수정
		--------------------------------*/
		$(".dd").click(function(){
			$("#anq").attr("action", "updateAnq");
			$("#ansbutton").attr("id","ansupdatebutton")
			$("#ansupdatebutton").text("답글수정")
			var a =$(this).val();
			$("#zd").attr("name",'aNo')
			$("#zd").attr("value",a)
			
			var offset = $("#ffff").offset();

			$("html").animate({scrollTop:offset.top}, 1000);

		})
		
		/*--------------------------------
		          수정실행
		--------------------------------*/
		$("#ansupdatebutton").click(function(){
			
			document.updateAnq.submit();
 
	 	})
	 	
 		/*--------------------------------
		     답변달기  
		--------------------------------*/	 	
		$("#ani").click(function(){

			var offset = $("#ffff").offset();

			$("html").animate({scrollTop:offset.top}, 1000);
		
	    });
	 	
	 
		/*--------------------------------
		        좋아요 증가/삭제
		--------------------------------*/
 		function dddd(aNo,qNo){ 
	 		if(confirm("정말 삭제하시겠습니까 ?")){ 
	 			location.href='deleteAnq?aNo='+aNo+'&qNo='+qNo; 
	 		}else{
	 			
	 			return false ; 
	 		} 
 		};
 		
 		/*--------------------------------
		        좋아요 증가/삭제
		--------------------------------*/
 		$("#queDel").click(function(){ 
	 		if(confirm("정말 삭제하시겠습니까 ?")){ 
	 			location.href='deleteQna?qNo=${qna.qNo}';
	 		}else{
	 			return false; 
	 		} 
 		})
})
	 		
</script>
	 	
	 	
	 	
</body>
</html>