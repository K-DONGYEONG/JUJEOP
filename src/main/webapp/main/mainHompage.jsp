<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//response.setIntHeader("Refresh",5);
	String s_id = (String)session.getAttribute("s_id");
	String menu = request.getParameter("menu");
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<%@include file="/common/bootstrap_common.jsp"%>
    <title>JUJEOP 주접</title>
	<script type="text/javascript">
		let zipcodeModal = null;
		function choice(zipcode, address){
			$('#mem_zipcode').val(zipcode);
			$('#mem_addr').val(address);
			zipcodeModal.hide();
		}
		function zipcodeSearch(){
			const dong = $('#dong').val();
  			$.ajax({
			      url:'./member/zipcodeList.bs?dong='+dong,
			      success:function(data){
			      	$("#d_zipcode").html(data);
					zipcodeModal = new bootstrap.Modal(document.getElementById('zipcodeModal'));
					zipcodeModal.show();
			      },
			      error:function(e){
			    	  $("#loginForm").text(e.responseText);
			      }
			});			
		}
		function memberUpdateAction(){
    		$("#f_memberUpd").attr('method','get');
    		$("#f_memberUpd").attr('action','./member/memberUpdate.bs');
    		$("#f_memberUpd").submit();			
		}
		function memberUpdateForm(){

  			$.ajax({
			      url:'./member/memberDetail.bs?mem_id=<%=s_id%>',
			      success:function(data){
			      	$("#d_update").html(data);
					const updateModal = new bootstrap.Modal(document.getElementById('updateModal'));
					updateModal.show();
			      },
			      error:function(e){
			    	  $("#loginForm").text(e.responseText);
			      }
			});
			
		}
    	function memberShip(){
    		alert('memberShip호출');
    		$("#f_member").attr('method','get');
    		$("#f_member").attr('action','./member/memberInsert.bs');
    		$("#f_member").submit();
        }	
		function loginAction(){
		    const id = $('#mem_id').val(); 
		    const pw = $('#mem_pw').val(); 
			$.ajax({
			      url:'./member/login.bs?mem_id='+id+'&mem_pw='+pw,
			      success:function(data){
			          $("#loginForm").html(data);
			      },
			      error:function(e){
			    	  $("#loginForm").text(e.responseText);
			      }
		      });								
		}
    		
	    function logoutAction(){
	        $.ajax({
	  	      url:'./main/logout.jsp',
	  	      success:function(data){
	  	          $("#loginForm").html(data);
	  	      },
	  	      error:function(e){
	  	    	  $("#login").text(e.responseText);
	  	      }
	        });
	      }      		
	</script>
  </head>
  <body>
	<%@include file="/include/main_homepage.jsp"%>

	<%@ include file="/main/homeCarousel.jsp" %>

	<%@ include file="/include/footer.jsp" %>

  </body>
</html>
<style>
    .centered-navigation {
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f8f9fa; 
      padding: 5px 0; 
    }
    </style>