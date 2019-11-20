<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>:: 카카오톡 공유하기 ::</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    function shareKakaotalk() {
        Kakao.init("0fe4d2d7552d0e2374af4e3c7b9e1f65");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"WARCRAFT3 THE REIGN OF CHAOS"   // 콘텐츠의 타이틀
                , description:"너흰아직 준비가 안되었다!"   // 콘텐츠 상세설명
                , imageUrl:"illidan_stormrage.jpg"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"http://magic.wickedmiso.com/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"http://magic.wickedmiso.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"게시글 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"http://magic.wickedmiso.com/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"http://magic.wickedmiso.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
</script>
</head>
<body>
    <h1>카카오톡 공유하기</h1>
    <input type="button" onClick="shareKakaotalk();" value="KAKOA Talk으로 공유하기"/>
</body>
</html>