<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%
	String serverIP = "155.230.36.61";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "s2015113955";
	String pass = "wan2good";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	//System.out.println(url);
	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);%>
	<%
	request.setCharacterEncoding("EUC-KR");
    String id = request.getParameter("id");
    int check=-1;
    
    String query = "select ID "+"from account where ID='"+id+"'";
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	
	String temp;
    // 2: ����� ����
   
    if(rs.next())
   		check=1;
   	else
   		check=0;
	
	if(check==1)
	{
		%>
		<center>
		<br />
		�̹� ������� ID �Դϴ�.
		</center>
		<%
	}
	else
	{
		%>
		<center>
			<br />
			����Ͻ� �� �ִ� ID�Դϴ�.
			<input type="button" value="�ݱ�" onclick="setid()">
		</center>
		<script language="javascript">
	<%
	}
	%>
	
		function setid()
		{
			opener.document.userInfo.id.value="<%=id%>";
			window.self.close();
		}
	</script>
	
	<%
    rs.close();
   	pstmt.close();
   	conn.close();
    
	%>
 