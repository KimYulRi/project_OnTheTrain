<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${ path }/css/myPage/myPageQnaWrite.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div id="container">
        <section>
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageticket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div id="mypagechoose" class="toolbarcontent">1:1 문의</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>

            <div id="toptoolbar">
                <div id="toptoolbartitle" >1:1 문의 작성하기</div>
            </div>
            <div id="qnawritebody">

                <div id="qnatypebody" class="qna">
                    <div id="qnatypetitle">문의구분*</div>
                    <div id="qnatypecontent">
                        <select name="qnatype" id="qnatype">
                            <option value="" disabled selected>-문의구분-</option>
                            <option value="결제문의">결제문의</option>
                            <option value="환불문의">환불문의</option>
                            <option value="신고문의">신고문의</option>

                        </select>
                    </div>
                </div>
                <div class="qnaline"></div>

                <div id="qnatitlebody" class="qna">
                    <div id="qnatitletile">제목*</div>
                    <div id="qnatitlecontent"><textarea name="qnatitleinput" id="qnatitleinput" cols="80" rows="1" placeholder="최대 30자 이내로 입력해주십시오."></textarea></div>
                </div>

                <div class="qnaline"></div>
                
                <div id="qnacontentbody" class="qna">
                    <div id="qnacontenttitle">내용*</div>
                    <div id="qnacontentcontent"><textarea name="qnacontentinput" id="qnacontentinput" cols="80" rows="5" placeholder="최대 300자 이내로 입력해주십시오."></textarea></div>
                </div>
                <div class="qnaline"></div>
                <div id="qnafilebody" class="qna">
                    <div id="qnafiletitle">첨부파일</div>
                    <div id="qnafilecontent"><button id="filebtn">파일 선택</button> 파일이름.jpg</div>
                </div>
                <div class="qnaline"></div>
                
                <div id="qnabottombtn">
                    <button id="qnasubmit">작성 완료</button>
                    <button id="qnacancle">취소</button>
                </div>
            </div>



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>