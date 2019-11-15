<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<body id="pp">
	<div class="container-fluid mt--3">
		<div class="main-qqqcontent">
			<div class="col-xs-12 qqqcard">
				<div class="main-question-detail">
					<h3>
						${qna.qTitle }
						<div class="question-meta">
							<span>조회수 ${qna.qViews }</span> <span>답변수 0</span> <span>좋아요
								0</span>
							<%-- <span>등록일 ${qna.qDate }</span> --%>
						</div>

					</h3>

					<div class="question-detail-content" style="border-bottom: 1px solid #cdb8f3;">
						<div class="rowqqq">
							<div style="margin-top: 10px;"></div>
						</div>

						<div class="question-content-left">
							<ul>

								<li class="question-vote-count" style="margin-bottom: 5px;">0</li>

								<li><a href="javascript:;"
									data-href="/tag/etc/question/323/bookmark"
									data-toggle="baseajax"> <i class="fa fa-star fa-2x"
										aria-hidden="true"></i>
								</a></li>
							</ul>
						</div>
						<div class="question-content-right mt-15">
							<div>
								<div class="content fr-view" style="margin-bottom : 180px">
									 
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
			</div>
					 <div class="col-xs-12 qqqcard qqqcard-tab">
                <div class="main-qqqtopbar-wrapper">
                    <h2 class="title pull-left">
                        1 답변
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
                                <div class="content fr-view" style="margin-bottom : 180px">
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
                    </div>
                
                </div>
                </c:forEach>
            </div>
            
			<c:choose>
        	<c:when test="${not empty sessionScope.members.membersId}">
				<div class="col-xs-12 qqqcard pl-10">
			<div class="main-answer-form" id="answer_form">
				<form method="post" action="insertAnq">
				<input type ="hidden" name ="qNo" value="${qna.qNo}"></input>
				<h2 class="title">답변 작성</h2>
				<div class="qqqalert qqqalert-secondary mb-20">
					<p style="font-size: 0.8rem">
						<img src="https://i.imgur.com/CUtuI2T.png">버튼으로 코드를 넣을 수
						있습니다.
					</p>
				</div>

				<div class="form-group">
					<textarea name="aContents" cols="40" rows="10" id="id_content"
						placeholder="에디터">
					</textarea>

				</div>

				<!-- <button class="btn btn-darkblue" type="button"
					data-toggle="answer_create"
					data-href="/tag/etc/question/323/answer/create">작성한 답변
					등록하기</button> -->
					<button class="btn btn-darkblue" type="submit" id="qqqbutton">
								답변하기</button>
<!-- 				<button class="btn btn-darkblue hide" type="button"
					data-toggle="answer_update" data-href="">작성한 답변 수정하기</button>
				<button class="btn btn-darkblue hide" type="button"
					data-toggle="answer_cancel">취소하기</button>
				<p class="error text-left" id="answer_error"></p> -->
				</form>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div style ="text-align:center">답변 작성을 하시려면 <a data-toggle="modal" href="login2" data-target="#modal-login"
	role="button"> 로그인</a>이 필요합니다.</div>
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
	  
	 
                CKEDITOR.replace( 'id_content' ,{height: 300, 
                	  filebrowserUploadUrl: 'qnaUpload.jsp'
                });
                
            	$('#modal-login').on('show.bs.modal', function (e) {
            		 
            	    $(this).find('.modal-content').load("login2");
            	});
     </script>
</body>
</html>