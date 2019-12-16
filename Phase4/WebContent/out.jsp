<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>탈퇴 화면</title>
<script type="text/javascript">
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
</head>
<%
String id=request.getParameter("id");
%>
<body>
<br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
    <form name="out" method="post" action="deletepro.jsp?id=<%=id %>"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>