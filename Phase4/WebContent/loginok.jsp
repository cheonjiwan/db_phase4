<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String id=request.getParameter("id");
%>
<body>
<h1> ����</h1>
   <input type="button" value="��ü ���� ��ȸ" onclick="location.href='all_car.jsp?id=<%=id%>'"/>
   <input type="button" value="���� ���� �˻�" onclick="location.href='search.jsp?id=<%=id%>'"/>
   <input type="button" value="���� �̸� �˻�" onclick="location.href='name_search?id=<%=id%>'"/>
   <input type="button" value="ȸ�� ���� ����" onclick="location.href='modify?id=<%=id%>'"/>
   <input type="button" value="�ŷ� ���� ��ȸ" onclick="location.href='when_trade.jsp?id=<%=id%>'"/>
   <input type="button" value="Ż��" onclick="location.href='out.jsp?id=<%=id%>'"/>
   <input type="button" value="������ ���" onclick="location.href='manager.jsp?id=<%=id%>'"/>
   <input type="button" value="�α� �ƿ�" onclick="location.href='logout.jsp?id=<%=id%>'"/>
   
   
</body>
</html>