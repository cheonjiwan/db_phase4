<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>form</title>
<script type="text/javascript">
 function check(){
  if(document.search.keyWord.value==''){
   alert('�˻�� �Է��ϼ���'); 
   document.search.keyWord.focus();
   return false;
  }
 }
</script>
</head>
<%
String id = request.getParameter("id");
%>
<body>
<form name = "search" method = "post" action ="search_result.jsp?id=<%=id %>" onsubmit="return check()">
<h1 aligh="center">���� �̸� �˻�</h1>
<h3 aligh="center">����� �Է��� �ּ���.</h3>
 <table width="200" border="0" align="center">
  <tr>
   <td align ="center" valign="bottom">
    <select name="keyField">
     <option value="make">������</option>
     <option value="model_name">�𵨸�</option>
     <option value="detail_model_name">���θ𵨸�</option>
     </select>
     </td>
     
   <td>
    <input type="text" size="16" name="keyWord"> 
   </td>
   
   <td>
    <input type="submit" value="ã��">
   </td>  
  </tr>
 </table>
</form>
</body>
</html>