<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ż�� ȭ��</title>
<script type="text/javascript">
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
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
    <b><font size="6" color="gray">�� ����</font></b>
    <br><br><br>
    <form name="out" method="post" action="deletepro.jsp?id=<%=id %>"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">��й�ȣ</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="���" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'">
        <input type="submit" value="Ż��" /> 
    </form>
</body>
</html>