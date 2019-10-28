<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    회원가입테스트
  </title>
  <!-- Favicon -->
  <link href="../assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="../assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="../assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="../assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- daum 도로명주소 찾기 api
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->



<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식  5에서 12자 
var idJ = /^[a-z0-9][a-z0-9_\-]{4,11}$/;
// 비밀번호 정규식 6~15자
var pwJ = /^[A-Za-z0-9]{5,14}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;



var address = $('#sample3_detailAddress');

$(document).ready(function() {
   var address = $('#sample3_detailAddress');

   //아이디 중복확인
      $("#membersId").blur(function() {
          if($('#membersId').val()==''){
             $('#id_check').text('아이디를 입력하세요.');
             $('#id_check').css('color', 'red');                     
      
             } else if(idJ.test($('#membersId').val())!=true){
                $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                $('#id_check').css('color', 'red');
             } else if($('#membersId').val()!=''){
                
               var membersId=$('#membersId').val();
                 $.ajax({
                     async : true,
                        type : 'POST',
                      data : membersId,
                      url : 'idsearch',
                        dateType: 'json',
                        contentType: "application/json; charset=UTF-8",
                        success : function(data) {

             if(data && data.memberId != ''){
                $('#id_check').text('중복된 아이디 입니다.');
                      $('#id_check').css('color', 'red');
                      $("#usercheck").attr("disabled", true);
             }else{
                if(idJ.test(membersId)){
                   $('#id_check').text('사용가능한 아이디 입니다.');
                   $('#id_check').css('color', 'blue');
                   $("#usercheck").attr("disabled", false);
                }
                else if(membersId==''){
                $('#id_check').text('아이디를 입력해주세요.');
                      $('#id_check').css('color', 'red');
                      $("#usercheck").attr("disabled", true);
                }
                else{
                   $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                   $('#id_check').css('color', 'red');
                   $("#usercheck").attr("disabled", true);
                }
             }

           }

                });//ajax/// 
             }//else if
           
    });//blur 
    
    $('form').on('submit',function(){
        var inval_Arr = new Array(8).fill(false);
        if (idJ.test($('#membersId').val())) {
           inval_Arr[0] = true;   
        } else {
           inval_Arr[0] = false;
           alert('아이디를  확인하세요.');
           return false;
        }
        // 비밀번호가 같은 경우 && 비밀번호 정규식
        if (($('#membersPw').val() == ($('#membersPw2').val()))
              && pwJ.test($('#membersPw').val())) {
           inval_Arr[1] = true;
        } else {
           inval_Arr[1] = false;
           alert('비밀번호를 확인하세요.');
           return false;
        }
        // 이름 정규식
        if (nameJ.test($('#membersName').val())) {
           inval_Arr[2] = true;   
        } else {
           inval_Arr[2] = false;
           alert('이름을 확인하세요.');
           return false;
        }
 
        // 이메일 정규식
        if (mailJ.test($('#membersMail').val())){
           console.log(phoneJ.test($('#membersMail').val()));
           inval_Arr[4] = true;
        } else {
           inval_Arr[4] = false;
           alert('이메일을 확인하세요.');
           return false;
        }
        // 휴대폰번호 정규식
        if (phoneJ.test($('#membersTel').val())) {
           console.log(phoneJ.test($('#membersTel').val()));
           inval_Arr[5] = true;
        } else {
           inval_Arr[5] = false;
           alert('휴대폰 번호를 확인하세요.');
           return false;
        }
        //성별 확인
         if(member.mem_gender[0].checked==false&&member.mem_gender[1].checked==false){
                inval_Arr[6] = false;
              alert('성별을 확인하세요.');
              return false;
            
        } else{
           inval_Arr[6] = true;
        } 
  
        //주소확인
        if(address.val() == ''){
           inval_Arr[7] = false;
           alert('주소를 확인하세요.');
           return false;
        }else
           inval_Arr[7] = true;
     
        //전체 유효성 검사
        var validAll = true;
        for(var i = 0; i < inval_Arr.length; i++){
           if(inval_Arr[i] == false){
              validAll = false;
           }
        }
        if(validAll == true){ // 유효성 모두 통과
           alert('가입완려');      
        } else{
           alert('정보를 다시 확인하세요.')
        }
      });


   $('#membersId').blur(function() {
      if (idJ.test($('#membersId').val())) {
         console.log('true');
         $('#id_check').text('');
      } else {
         console.log('false');
         $('#id_check').text('5~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
         $('#id_check').css('color', 'red');
      }
   });
   $('#membersPw').blur(function() {
      if (pwJ.test($('#membersPw').val())) {
         console.log('true');
         $('#pw_check').text('');
      } else {
         console.log('false');
         $('#pw_check').text('6~15자의 숫자 , 문자로만 사용 가능합니다.');
         $('#pw_check').css('color', 'red');
      }
   });

   //1~2 패스워드 일치 확인
   $('#membersPw2').blur(function() {
      if ($('#membersPw').val() != $(this).val()) {
         $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
         $('#pw2_check').css('color', 'red');
      } else {
         $('#pw2_check').text('');
      }
   });

   //이름에 특수문자 들어가지 않도록 설정
   $("#membersName").blur(function() {
      if (nameJ.test($(this).val())) {
         console.log(nameJ.test($(this).val()));
         $("#name_check").text('');
      } else {
         $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
         $('#name_check').css('color', 'red');
      }
   });
   $("#membersMail").blur(function() {
      if (mailJ.test($(this).val())) {
         $("#email_check").text('');
      } else {
         $('#email_check').text('이메일 양식을 확인해주세요.');
         $('#email_check').css('color', 'red');
      }
   });
   

        
 
              // 휴대전화
              $('#membersTel').blur(function(){
                 if(phoneJ.test($(this).val())){
                    console.log(nameJ.test($(this).val()));
                    $("#phone_check").text('');
                 } else {
                    $('#phone_check').text('휴대폰번호를 확인해주세요 ');
                    $('#phone_check').css('color', 'red');
                 }
              });
});


</script>

</head>

<body class="bg-default">
  <div class="main-content">
     
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6">
              <h1 class="text-white">ㅎㅇ!</h1>
              <p class="text-lead text-light"> ㅎㅇ.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <!-- Table -->
      <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
          <div class="card bg-secondary shadow border-0">
            <div class="card-header bg-transparent pb-5">
              <div class="text-muted text-center mt-2 mb-4"><small>Sign up with</small></div>
              <div class="text-center">
               
                <a href="#" class="btn btn-neutral btn-icon">
                  <span class="btn-inner--icon"><img src="../assets/img/icons/common/google.svg"></span>
                  <span class="btn-inner--text">Google</span>
                </a>
              </div>
            </div>
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>Or sign up with credentials</small>
              </div>
              <form action="signup" method = "post" role="form" id="usercheck">
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name = "membersId" id="membersId" class="form-control" placeholder="아이디" type="text">
                    <div class="eheck_font" id="id_check"></div>
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name = "membersPw" id="membersPw" class="form-control" placeholder="비밀번호" type="password">
                    <div class="eheck_font" id="pw_check"></div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name = "membersPw2" id="membersPw2" class="form-control" placeholder="비밀번호 확인" type="password">
                    <div class="eheck_font" id="pw2_check"></div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name = "membersName" id ="membersName" class="form-control" placeholder="이름" type="text">
                    <div class="eheck_font" id="name_check"></div>
                  </div>
                </div>


                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name = "membersTel" id="membersTel" class="form-control" placeholder="연락처('-'없이 번호만 입력해주세요)" type="text">
                    <div class="eheck_font" id="phone_check"></div>
                  </div>
                </div>


                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"></span>
                    </div>
                    <input name ="membersMail" id = "membersMail" class="form-control" placeholder="이메일" type="email">
                    <div class="eheck_font" id="email_check"></div>
                  </div>
                </div>


                  

                 
                     
                    <div class="form-group">      
                      
                        <div style=" display : inline;" class="input-group input-group-alternative mb-3">          
                        <input class="form-control" style="width: 40%;  display: inline-block" placeholder="　우편번호" name="sample3_postcode" id="sample3_postcode" type="text" readonly="readonly" >
                        &nbsp;&nbsp;
                        <button style="padding: 9px" type="button" class="btn btn-secondary" onclick="sample3_execDaumPostcode()"><i class="fa fa-search"></i> 우편번호 찾기</button>                  
                        </div>             
                        </div>
                        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                            </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="　주소"  id="sample3_Addr" name="sample3_Addr" type="text" readonly="readonly" />
                        </div>
                       
   
                        <div class="form-group">
                            <div class="input-group input-group-alternative mb-3">
                            <input style="width: 30%;  " class="form-control" placeholder="　상세주소" name="sample3_detailAddress" id="sample3_detailAddress" type="text"  />
                            <input class="form-control" type="text" id="sample3_extraAddress" placeholder="　참고항목" readonly="readonly"/>
                         
                        </div>
                      </div>
                      
                    
                      <div class="custom-control custom-radio mb-3" style="display: inline-block;  padding: 20px 100px">
                          <input name="membersType" class="custom-control-input" id="customRadio5" checked="" type="radio" value="일반" >
                          <label class="custom-control-label" for="customRadio5">일반회원</label>
                        </div>
                         
                        <div class="custom-control custom-radio mb-3" style="display: inline-block; ">
                          <input name="membersType" class="custom-control-input" id="customRadio6"  value="기업" type="radio">
                          <label class="custom-control-label" for="customRadio6">기업회원</label>
                        </div>
                    
                    

               
                <div class="text-center">
                  <button type="submit" class="btn btn-primary mt-4">회원가입</button>
                </div>
                <input type = "hidden" name= "membersAddr"/>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  


  
  <!--   Core   -->
  <script src="../assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="../assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="../assets/js/argon-dashboard.min.js?v=1.1.0"></script>
   <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>


    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById('wrap');
    
        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }
    
        function sample3_execDaumPostcode() {
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                      // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample3_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample3_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample3_postcode').value = data.zonecode;
                    document.getElementById("sample3_Addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample3_detailAddress").focus();


                     
            //document.getElementById('sample3_Addr').value = addr;
            
                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';
    
                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = size.height+'px';
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);
    
            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        }
    </script>
</body>

</html>