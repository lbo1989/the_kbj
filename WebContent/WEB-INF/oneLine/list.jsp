<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 css 입니다. -->
<link rel="stylesheet" href="css/comm.css">
<!-- 각자 css는 여기다 추가해주시면 됩니다. -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="css/oneLine/list.css">

</head>
<body>
	<c:set var="currpage" value="${requestScope.currpage }" />
	<c:set var="totalcount" value="${requestScope.totalcount }" />
	<c:set var="pageperSize" value="${requestScope.pageperSize }" />
	<c:set var="list" value="${requestScope.list }" />
	<c:set var="replist" value="${requestScope.replist }" />	
	
	<c:set var="session_mno" value="${sessionScope.mno}"/>
	
	<jsp:include page="../comm/header.jsp"></jsp:include>
	<div class="right">
		<section class="content_box">
			<div class="content_top">
				<p class="sponsor">
					<a href="#"><span class="glyphicon glyphicon-bell"></span>개인후원</a>
				</p>
				<div class="searchbox">
					<input type="text" value="search" class="search">
				</div>
			</div>
			<div class="content">
				<h2 class="con_title">한줄 게시판</h2><!-- 각자카테고리명 텍스트만 바꿔주세요 -->
				<div class="board_menu_box">
					<ul class="board_menu">
						<li class="board_menu_li"><a href="">최신순</a></li>
						<li class="board_menu_li"><a href="">댓글순</a></li>
						<li class="board_menu_li"><a href="">조회순</a></li>
						<li class="board_menu_li"><a href="">추천순</a></li>
					</ul>
					<input type="button" value="글쓰기" class="btn_write" onclick="write_send()">
				</div>
				<div class="board_box">
					<!--내용작성 start -->
					<c:forEach var="list" items="${requestScope.list}">
					<div class="board_content">
                        <div class="board_top">
                           <div class="top_left">
                                <p><img src="img/oneLine/01.png" alt="#"></p>
                                <div class="profile">
                                    <h6>${list.mnick }</h6>
                                    <h6>${list.bwrdate }</h6>
                                </div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="top_right">
                                <div class="glyphicon glyphicon-pencil pen" onclick="board_modify(${list.bno},${list.mno},${session_mno})"></div>
                                <div class="glyphicon glyphicon-trash trash" onclick="board_delete(${list.bno},${list.mno},${session_mno})"></div>
                            </div>
                            
                            <div class="clear"></div>
                        </div>
                        
                        <div class="board_middle">
                            <h5>${list.bcontent }</h5>
                        </div>
                        
                        <div class="board_bottom">
                            <div class="bottom_left1">
                                <div class="glyphicon glyphicon-thumbs-up"></div>
                                <h6>${list.blikecount }</h6>
                            </div>
                            
                            <div class="bottom_right1">
                                <h6>${list.brecount }</h6>
                            </div>
                            
                            <div class="clear"></div>
                            
                            <div class="bottom_form">
                                <form method="post" action="subadd.do" name="frm">
                                    <input type="hidden" name="no" value="1">
                                    <div class="row">
                                      <div class="no-padding col-md-11 row_area">
                                          <textarea name="textarea" id="textarea" class="form-control form_area" rows="1"></textarea>
                                      </div>
                                      <div class="no-padding col-md-1 row_submit">
                                          <button type="button" class="btn btn-default form_submit" onclick="reply_send(this,${session_mno},${list.bno})">제출</button>
                                      </div>
                                    </div>
                                </form>                                
                            </div>
                        </div>
                        
	                      <div class="reply_content">
	                      <c:forEach var="replist" items="${requestScope.replist}">
                        	<c:if test="${list.bno == replist.bno }">
	                            <div class="reply_profile">
	                                <p><img src="img/oneLine/01.png" alt="#"></p>
	                            </div>
	                            <div class="reply">
	                                <div class="reply_title">
	                                   <div class="reply_left">
	                                        <h5>${replist.mnick }</h5>
	                                        <h6>${replist.rwrdate }</h6>
	                                        <div class="clear"></div>
	                                   </div>
	                                   
	                                   <div class="reply_right">
	                                   	   <div class="glyphicon glyphicon-pencil pen" onclick="reply_modify(${replist.rno},${replist.mno},${session_mno})"></div>
	                                       <div class="glyphicon glyphicon-remove" onclick="reply_delete(${replist.rno},${replist.mno},${session_mno})"></div>
	                                   </div>
	                                   <div class="clear"></div>
	                                </div>
	                                <p class="reply_write">${replist.rcontent }</p>
	                            </div>
	                            <div class="clear"></div>
	                            </c:if>
                          </c:forEach>
	                       </div>
                        </div>
	                    </c:forEach>    
                    </div>
				</div>
			</section>
        </div>
        <!--내용작성 end -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/oneLine/list.js"></script>
<script>
let mno = <%= session.getAttribute("mno") %>

function reply_send(th,mno,bno)
{
	  if(mno != null)
	  {
		 let content = $(th).parent().prev().children().val();
		 $.ajax({
			 url:"oneLineRepinsert.do"
			 ,method:"post"
			 ,dataType:"text"
			 ,data:{'content':content,"mno":mno,"bno":bno}
			 ,success:function(data)
			 {
				 alert("정상적으로 댓글을 작성 하였습니다!");
				 console.log("reply_insert 성공");
				location.href="oneLineList.do";
			 }
			 ,error:function(data)
  			 {
  				console.log('error',data);
  			 }
		 });
	  }
	  else
	  {
		alert("로그인 해주세요!");
		location.href="memberLogin.do";
	  }
}

function write_send()
{
	  if(mno != null)
	  {
		location.href="oneLineInsert.do";
	  }
	  else
	  {
		alert("로그인 해주세요!");
		location.href="memberLogin.do";
	  }
}


	$(document).ready(function(){
	  
	  /* 댓글 토글 기능 */
	  $(".bottom_right1").click(function(){
	    $(this).parent().next().slideToggle();
	  });
	  
	  <%-- let mno = <%= session.getAttribute("mno") %> --%>
	

	  let currpage = ${currpage};
	  let totalcount = ${totalcount};
	  let pageperSize = ${pageperSize};
	  
	  $(document).scroll(function(){
		  let a = $(document).height();
		  let b =  $(window).height(); 
		  let c = $(window).scrollTop();
		  		  
	  	  if(a == b+c)
	  	  {
	  		alert('게시글을 업데이트 하였습니다!');	  
	  		 /* 게시글 가져오기 */
	  		 $.ajax({
	  				url:"oneLineListResult.do"
	  				,method:"post"
	  				,dataType: "json"
	  				,data:{'currpage':currpage+1,'totalcount':totalcount, 'pageperSize':pageperSize}
	  			,success:function(data)
	  			{
	  				let bno_temp = 0;
	  				let result;
	  				$.each(data,function(index,item){
	  					if( bno_temp != item.bno)
	  					{
	  					bno_temp = item.bno;
	  					console.log("item.bno : " + item.bno);
	  					console.log("item.bnick : " + item.bnick);
	  					result+='<div class="board_content">                                                                                  ';
                        result+='<div class="board_top">                                                                                          ';
                        result+='   <div class="top_left">                                                                                        ';
                        result+='        <p><img src="img/oneLine/01.png" alt="#"></p>                                                            ';
                        result+='        <div class="profile">                                                                                    ';
                        result+='            <h6>'+item.bnick+'</h6>                                                                              ';
                        result+='            <h6>'+item.bwrdate+'</h6>                                                                            ';
                        result+='        </div>                                                                                                   ';
                        result+='        <div class="clear"></div>                                                                                ';
                        result+='    </div>                                                                                                       ';
                        result+='                                                                                                                 ';
                        result+='    <div class="top_right">                                                                                      ';
                        result+='        <div class="glyphicon glyphicon-pencil pen onclick="board_modify('+item.bno+','+item.mno+','+mno+')"></div>                                                       ';
                        result+='        <div class="glyphicon glyphicon-trash trash onclick="board_delete('+item.bno+','+item.mno+','+mno+')"></div>                                                      ';
                        result+='    </div>                                                                                                       ';
                        result+='                                                                                                                 ';
                        result+='    <div class="clear"></div>                                                                                    ';
                        result+='</div>                                                                                                           ';
                        result+='                                                                                                                 ';
                        result+='<div class="board_middle">                                                                                       ';
                        result+='    <h5>'+item.bcontent+'</h5>                                                                                   ';
                        result+='</div>                                                                                                           ';
                        result+='                                                                                                                 ';
                        result+='<div class="board_bottom">                                                                                       ';
                        result+='    <div class="bottom_left1">                                                                                   ';
                        result+='        <div class="glyphicon glyphicon-thumbs-up"></div>                                                        ';
                        result+='        <h6>'+item.blikecount+'</h6>                                                                             ';
                        result+='    </div>                                                                                                       ';
                        result+='                                                                                                                 ';
                        result+='    <div class="bottom_right1">                                                                                  ';
                        result+='        <h6>'+item.brecount+'</h6>                                                                               ';
                        result+='    </div>                                                                                                       ';
                        result+='                                                                                                                 ';
                        result+='    <div class="clear"></div>                                                                                    ';
                        result+='                                                                                                                 ';
                        result+='    <div class="bottom_form">                                                                                    ';
                        result+='        <form method="post" action="subadd.do" name="frm">                                                       ';
                        result+='            <input type="hidden" name="no" value="1">                                                            ';
                        result+='            <div class="row">                                                                                    ';
                        result+='              <div class="no-padding col-md-11 row_area">                                                        ';
                        result+='                  <textarea name="textarea" id="textarea" class="form-control form_area" rows="1" ></textarea>   ';
                        result+='              </div>                                                                                             ';
                        result+='              <div class="no-padding col-md-1 row_submit">                                                       ';
                        result+='                  <button type="submit" class="btn btn-default form_submit" onclick="send()">제출</button>         ';
                        result+='              </div>                                                                                             ';
                        result+='            </div>                                                                                               ';
                        result+='        </form>                                                                                                  ';
                        result+='    </div>                                                                                                       ';
                        result+='</div>                                                                                                           ';
                        result+='                                                                                                                 ';
	                    result+='  <div class="reply_content">                                                                                    ';
	  					}
	                    
	  					if( item.rcontent != null && item.rwrdate != null && item.rnick != null)
	  					{
	  					console.log("item.reply : " + item.rnick);
	                    result+='        <div class="reply_profile">                                                                              ';
	                    result+='            <p><img src="img/oneLine/01.png" alt="#"></p>                                                        ';
	                    result+='        </div>                                                                                                   ';
	                    result+='        <div class="reply">                                                                                      ';
	                    result+='            <div class="reply_title">                                                                            ';
	                    result+='               <div class="reply_left">                                                                          ';
	                    result+='                    <h5>'+item.rnick+'</h5>                                                                   ';
	                    result+='                    <h6>'+item.rwrdate+'</h6>                                                                 ';
	                    result+='                    <div class="clear"></div>                                                                    ';
	                    result+='               </div>                                                                                            ';
	                    result+='                                                                                                                 ';
	                    result+='               <div class="reply_right">                                                                         ';
	                    result+='               	   <div class="glyphicon glyphicon-pencil pen"></div>                                         ';
	                    result+='                   <div class="glyphicon glyphicon-remove"></div>                                                ';
	                    result+='               </div>                                                                                            ';
	                    result+='               <div class="clear"></div>                                                                         ';
	                    result+='            </div>                                                                                               ';
	                    result+='            <p class="reply_write">'+item.rcontent+'</p>                                                      ';
	                    result+='        </div>                                                                                                   ';
	                    result+='        <div class="clear"></div>                                                                                ';
	                    result+='   </div>                                                                                                        ';
                        result+='</div>                                                                                                           ';
	  					}
	  					else
	  					{
	  						result+='</div>';	
	  					}
	  				});                                                                                                                           
	  				
	  				$('.board_content:last').append(result);
	  				currpage=currpage+1;
	  			}
	  			,error:function(data)
	  			{
	  				console.log('error',data);
	  			}
	  		});
	  	  }
	  });
	});
</script>
</body>
</html>