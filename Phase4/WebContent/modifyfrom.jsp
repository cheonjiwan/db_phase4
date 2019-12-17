<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page session = "true" %>
    <%@ page import="java.util.*" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(function() {
$( "#datepicker" ).datepicker(
{
	changeMonth: true, 
    changeYear: true,
    nextText: '다음 달',
    prevText: '이전 달',
    dateFormat: 'yy-mm-dd',
    yearRange:'1901:2000',
    showMonthAfterYear: true ,
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        
}
 
);
});
</script>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%
String id=(String)session.getAttribute("id");
String password=(String)session.getAttribute("password");
String phone=(String)session.getAttribute("phone");
String name=(String)session.getAttribute("name");
String user_type=(String)session.getAttribute("user_type");
String address=(String)session.getAttribute("address");
String gender=(String)session.getAttribute("gender");
String bdate=(String)session.getAttribute("bdate");
String job=(String)session.getAttribute("job");

System.out.println("유저정보");
System.out.println(id);
System.out.println(password);
System.out.println(phone);
System.out.println(name);
System.out.println(user_type);
System.out.println(address);
System.out.println(gender);
System.out.println(bdate);
System.out.println(job); 
%>

<title>회원정보 수정화면</title>

</head>
<script type="text/javascript">  
   	function checkValue() 
    {
        if(!document.userInfo.password.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
    }
    
</script>
<body>
<br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
		<form method="post" action="modifypro.jsp?id=<%=id %>" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="id">아이디</td>
                    <td id="id"><%=id %></td>
                </tr>
                <tr>
                    <td id="password">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=password%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
            	<tr>
            		<td id="phone">휴대폰</td>
                    <td>
                        <input type="text" name="phone" maxlength="20" 
                            value="<%=phone%>">
                    </td>
                </tr>
                
                <tr>
                    <td id="name">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="20" 
                            value="<%=name%>">
                    </td>
                </tr>
                
                <tr>
                    <td id="address">주소</td>
                    <td>
                        <input type="text" name="address" maxlength="50" 
                            value="<%=address%>">
                    </td>
                </tr>
                
                <tr>
                   <td id="gender">성별</td>
                    <td>
                    	<%if(gender.equals("F"))  
                    	{
                    		%>
                    		<input type="radio" name="gender" value="M" >남
                        <input type="radio" name="gender" value="F" checked>여
                        <%	
                    	}else
                    	{
                    		%>	
                    		<input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="F" >여                    		
                        <%
                    	}
                    	 %>
                        
                    </td>
                </tr>
                    
                <tr>
                    <td id="ymd">생년월일</td>
                    <td>
                        <input type="text" id="datepicker" name="ymd" value="<%=bdate%>">
                    </td>
                </tr>
                    
                <tr>
                    <td id="job">직업</td>
                    <td>
                        <input type="text" name="job" maxlength="20" 
                            value="<%=job%>">
                    </td>
                </tr>
                    
            </table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'">
            <input type="submit" value="수정"/>  
        </form>
</body>
</html>