<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container-fluid mt--3">
		<div class="main-qqqcontent">
			<div class="col-xs-12 qqqcard">
				<div class="main-question-detail">
					<h3>
						${qna.qTitle }
						<div class="question-meta">
							<span>조회수 ${qna.qViews}</span> <span>답변수 ${qna.aCount}</span> <span>좋아요
								0</span>
							<%-- <span>등록일 ${qna.qDate }</span> --%>
							<input type="hidden" value="1" name="qaType" class="qType">
						</div>
					</h3>
					<div class="question-detail-content" style="border-bottom: 1px solid #cdb8f3;">
						<div class="rowqqq">
							<div style="margin-top: 10px;"></div>
						</div>
						<div class="question-content-left">
							<ul>
								<li class="question-vote-count" style="margin-bottom: 5px;">0</li>
								<li><a id="rec_update"> <i class="fa fa-star fa-2x"
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
					<button class="btn qqqbutton" 
					 id="ani">
					답변달기</button>	
					</c:if>	
					 <c:if test = "${sessionScope.members.membersNo == qna.membersNo}"> 			
				<button class="btn qqqbutton" 
			 onclick="location.href='updateQna?qNo=${qna.qNo}'">
					질문수정</button>  <button class="btn qqqbutton"
			 onclick="location.href='deleteQna?qNo=${qna.qNo}'" id="queDel">
					질문삭제</button>			
					</c:if>
				</div>
			
			</div>
			 
			<c:if test="${not empty ans}">
			<div class="col-xs-12 qqqcard qqqcard-tab">
                <div class="main-qqqtopbar-wrapper">
                    <h2 class="title pull-left">
                        ${fn:length(ans)} 답변                
                    </h2>                   
                    
                </div>
				<c:forEach items="${ans}" var="ans">
                <div class="main-question-answer">
                	
                    <div class="answer-detail-content answer-selection">
                        <div class="answer-content-left">
                            <ul>
								<li class="question-vote-count" style="margin-bottom: 5px;">0</li>
								<li><a href="javascript:;"
									data-href="/tag/etc/question/323/bookmark"
									data-toggle="baseajax"> <i class="fa fa-star fa-2x"
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
													<input type="hidden" value="${ans.aNo}" id= "${ans.aNo}">
												</div>
										</a></li>
									</ul>
								</div>
							</div>       
                        </div>
                    </div>
                   <c:if test = "${sessionScope.members.membersNo == ans.membersNo }">
                <div class ="qUp"> <button class="btn qqqbutton" id="ansUpdate">
					답변수정</button>
				 <button class="btn qqqbutton" 
			 onclick="location.href='deleteAnq?aNo=${ans.aNo}&qNo=${ans.qNo}'" id="ansDel">
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
					<button class="btn qqqbutton" type="submit" id="ansbutton">
								답변하기</button>
				 
				</form>
			</div>
			<div id ="asd"></div>
		</div>
		</c:when>
		<c:otherwise>
		<div style ="text-align:center">답변작성하려면	<a data-toggle="modal" href="login2" data-target="#modal-login"
	role="button">로그인</a></div>
		<br><br>
		</c:otherwise>
		</c:choose>
	</div>
		 
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
     </script>
     
     <script>
 	$(function(){
		$("#rec_update").click(function(){
		var type = $(".qType").val(); //없애기
			
			$.ajax({
				url: "recUpdate",
                type: "POST",
                data: {
                	qaNo: '${qna.qNo}',
                	qaType: type
                    
                },
                success: function () {
			        
                },
			})
		})
 	})

     </script>
     <script>
     
     	 $(document).ready(function(){ 
		$("#ansbutton").click(function(){
			var content = CKEDITOR.instances['ans_content'].getData();
			
			if(content==""){
				alert("내용을 입력하세요");
				CKEDITOR.instances['ans_content'].focus();
				return false;
			}			
			document.insertAnq.submit();			
		 }) 
	 	})
	 	</script>
<!-- 	 <script>
	 var a = $("#aa").val();
	 $(document).ready(function(){ 
	 $(function(){
			$("#ansUpdate").click(function(){
				$("#anq").attr("action", "updateAnq");
				$("#ansbutton").attr("id","ansupdatebutton")
				$("#anoo").attr("value",a)
				
				var offset = $("#asd").offset();

				$("html").animate({scrollTop:offset.top}, 1000);
			
			    });
			})
	 })
	 </script>
	      <script>
     	 $(document).ready(function(){ 
		$("#ansupdatebutton").click(function(){
			
			document.updateAnq.submit();
		 }) 
	 	})
	 	</script>	 -->
	 	<script>
		$("#ani").click(function(){

			var offset = $("#asd").offset();

			$("html").animate({scrollTop:offset.top}, 1000);
		
		    });
	 	
	 	</script>
	 	<script> 
	 	
	 		$("#ansDel").click(function(){ 
	 		if(confirm("정말 삭제하시겠습니까 ?") == true){ 
	 			 
	 		}else{
	 		
	 			return ; 
	 		} 
	 		});

	 		$("#queDel").click(function(){ 
		 		if(confirm("정말 삭제하시겠습니까 ?") == true){ 
		 			 
		 		}else{
		 		
		 			return ; 
		 		} 
		 		})
	 		
	 	</script>
	 	
	 	
	 	
</body>
</html>