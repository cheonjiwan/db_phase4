<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ŵ���</title>
</head>
<%
String id = request.getParameter("id");
%>
<body>
<h1>������ ��� ȭ���Դϴ�.</h1>
   <input type="button" value="���� �Ź� ���" onclick="insert_vehicle.jsp?id=<%=id%>"/>
   <input type="button" value="���� ���� ����" onclick="vehicle_update.jsp?id=<%=id%>"/>
   <input type="button" value="���� �������� ����" onclick="openmind.jsp?id=<%=id%>"/>
</body>
</html>