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
<link rel="stylesheet" href="css/oneLine/list.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


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
				<!-- <p class="sponsor">
					<a href="#"><span class="glyphicon glyphicon-bell"></span>개인후원</a>
				</p>
				<div class="searchbox">
					<input type="text" value="search" class="search">
				</div> -->
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
					<div class="btns_list">
						<c:choose>
							<c:when test="${sessionScope.dto.mnick != null }">
								<input type="button" value="글쓰기" class="btn btn-info btn_write" id="btn_write" onclick="write_send()">
							</c:when>
							<c:when test="${sessionScope.dto.mnick == null }">
								<input type="button" value="글쓰기" class="btn btn-info btn_write" id="btn_write" onclick="memberLogin()">
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="board_box">
					<!--내용작성 start -->
					<c:forEach var="list" items="${requestScope.list}">
					<div class="board_content">
                        <div class="board_top">
                           <div class="top_left">
                           		<c:set var="img" value="${list.mimg }"/>
                                <p><img src="${list.mimg}" alt=""></p>
                                <div class="profile">
                                    <h6>${list.mnick }</h6>
                                    <h6>${list.bwrdate }</h6>
                                </div>
                                <div class="clear"></div>
                            </div>
                            
                            <div class="top_right">
                                <div class="glyphicon glyphicon-pencil pen board_modify" style="cursor:pointer" onclick="board_modify(${list.bno},${list.mno},${session_mno})"></div>
                                <div class="glyphicon glyphicon-trash trash board_delete" style="cursor:pointer" onclick="board_delete(${list.bno},${list.mno},${session_mno})"></div>
                            </div>
                            
                            <div class="clear"></div>
                        </div>
                        
                        <div class="board_middle">
                            <h5>${list.bcontent }</h5>
                        </div>
                        
                        <div class="board_bottom">
                            <div class="bottom_left1">
                                <%-- <div class="glyphicon glyphicon-thumbs-up"></div>
                                <h6>${list.blikecount }</h6> --%>
                            </div>
                            
                            <div class="bottom_right1" style="cursor:pointer">
                                <h6>댓글보기</h6>
                            </div>
                            
                            <div class="clear"></div>
                            
                            <div class="bottom_form">
                                    <input type="hidden" name="no" value="1">
                                    <div class="row">
                                      <div class="no-padding col-md-11 row_area">
                                          <textarea name="textarea" id="textarea" class="form-control form_area" rows="1"></textarea>
                                      </div>
                                      <div class="no-padding col-md-1 row_submit">
                                          <button type="button" class="btn btn-default form_submit" onclick="reply_send(this,${list.bno},${session_mno})">제출</button>
                                      </div>
                                    </div>
                            </div>
                        </div>
                        
	                      <div class="reply_content">
	                      <c:forEach var="replist" items="${requestScope.replist}">
                        	<c:if test="${list.bno == replist.bno }">
	                            <div class="reply_profile">
	                                <p><img src="${replist.rimg }" alt="#"></p>
	                            </div>
	                            <div class="reply">
	                                <div class="reply_title">
	                                   <div class="reply_left">
	                                        <h5>${replist.mnick }</h5>
	                                        <h6>${replist.rwrdate }</h6>
	                                        <div class="clear"></div>
	                                   </div>
	                                   
	                                   <div class="reply_right">
	                                   	   <div class="glyphicon glyphicon-pencil pen" style="cursor:pointer" onclick="reply_modify(${replist.rno},${replist.mno},${session_mno})"></div>
	                                       <div class="glyphicon glyphicon-remove" style="cursor:pointer" onclick="reply_delete(${replist.rno},${replist.mno},${session_mno})"></div>
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
<div class="script_append"></div>
<jsp:include page="../comm/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/oneLine/list.js"></script>
<script language="JavaScript" charset="UTF-8">
let mno = <%= session.getAttribute("mno") %>


function memberLogin()
{
	location.href="memberLogin.do";
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
	  let script_bool = 0;
	  
	  $(document).scroll(function(){
		  let a = $(document).height();
		  let b =  $(window).height(); 
		  let c = $(window).scrollTop();
		  console.log(a,Math.floor(b+c));
	  	  if(a == Math.floor(b+c))
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
	  				
	  				if(data!="")
	  				{
		  				let bno_temp = 0;
		  				
		  				$.each(data,function(index,item){
		  						let result = "";
			  					if( (bno_temp != item.bno))
			  					{
			  					
			  					bno_temp = item.bno;
			  					result+='<div class="board_content">                                                                                  ';
		                        result+='<div class="board_top">                                                                                          ';
		                        result+='   <div class="top_left">                                                                                        ';
		                        result+='        <p><img src="'+item.mimg+'" alt="#"></p>                                                            ';
		                        result+='        <div class="profile">                                                                                    ';
		                        result+='            <h6>'+item.bnick+'</h6>                                                                              ';
		                        result+='            <h6>'+item.bwrdate+'</h6>                                                                            ';
		                        result+='        </div>                                                                                                   ';
		                        result+='        <div class="clear"></div>                                                                                ';
		                        result+='    </div>                                                                                                       ';
		                        result+='                                                                                                                 ';
		                        result+='    <div class="top_right">                                                                                      ';
		                        result+='        <div class="glyphicon glyphicon-pencil pen" style="cursor:pointer" onclick="board_modify('+item.bno+','+item.mno+','+mno+')"></div>                                                       ';
		                        result+='        <div class="glyphicon glyphicon-trash trash" style="cursor:pointer" onclick="board_delete('+item.bno+','+item.mno+','+mno+')"></div>                                                      ';
		                        result+='    </div>                                                                                                       ';
		                        result+='                                                                                                                 ';
		                        result+='    <div class="clear"></div>                                                                                    ';
		                        result+='</div>                                                                                                           ';
		                        result+='                                                                                                                 ';
		                        result+='<div class="board_middle">                                                                                       ';
		                        result+='    '+item.bcontent+'                                                                                   ';
		                        result+='</div>                                                                                                           ';
		                        result+='                                                                                                                 ';
		                        result+='<div class="board_bottom">                                                                                       ';
		                        result+='                                                                                                                 ';
		                        result+='    <div class="bottom_right3" style="cursor:pointer">                                                                                  ';
		                        result+='        <h6>댓글보기</h6>                                                                               ';
		                        result+='    </div>                                                                                                       ';
		                        result+='                                                                                                                 ';
		                        result+='    <div class="clear"></div>                                                                                    ';
		                        result+='                                                                                                                 ';
		                        result+='    <div class="bottom_form">                                                                                    ';
		                        result+='            <input type="hidden" name="no" value="1">                                                            ';
		                        result+='            <div class="row">                                                                                    ';
		                        result+='              <div class="no-padding col-md-11 row_area">                                                        ';
		                        result+='                  <textarea name="textarea" id="textarea" class="form-control form_area" rows="1" ></textarea>   ';
		                        result+='              </div>                                                                                             ';
		                        result+='              <div class="no-padding col-md-1 row_submit">                                                       ';
		                        result+='                  <button type="submit" class="btn btn-default form_submit" onclick="reply_send(this,'+item.bno+','+mno+')">제출</button>         ';
		                        result+='              </div>                                                                                             ';
		                        result+='            </div>                                                                                               ';
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
			                    result+='               	   <div class="glyphicon glyphicon-pencil pen" style="cursor:pointer" onclick="reply_modify('+item.rno+','+item.mno+','+mno+')"></div>                                         ';
			                    result+='                   <div class="glyphicon glyphicon-remove" style="cursor:pointer" onclick="reply_delete('+item.rno+','+item.mno+','+mno+')"></div>                                                ';
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
			  					$('.board_box').append(result);
		  					});
		  				
		  				if(script_bool == 0)
		  				{
		  					result2 = "";
			  				result2 += '<script>';
			  				result2 += '		$(".bottom_right3").click(function(){';
			  				result2 += '			$(this).parent().next().slideToggle();';
			  				result2 += '		});		';
			  				result2 += '<\/script>';                                                                                                                        
			  				
			  				$('.script_append').append(result2);
			  				script_bool = 1;
		  				}
		  				
		  				currpage=currpage+1;
	  				} 
	  				
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