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
   alert('검색어를 입력하세요'); 
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
<h1 aligh="center">차량 이름 검색</h1>
<h3 aligh="center">영어로 입력해 주세요.</h3>
 <table width="200" border="0" align="center">
  <tr>
   <td align ="center" valign="bottom">
    <select name="keyField">
     <option value="make">제조사</option>
     <option value="model_name">모델명</option>
     <option value="detail_model_name">세부모델명</option>
     </select>
     </td>
     
   <td>
    <input type="text" size="16" name="keyWord"> 
   </td>
   
   <td>
    <input type="submit" value="찾기">
   </td>  
  </tr>
 </table>
</form>
</body>
</html>