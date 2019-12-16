<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<%

String id=request.getParameter("id");
%>
<head>
<meta charset="EUC-KR">
<title>현재 유저정보 출력화면</title>
</head>

<body>
	<% 
	 	String serverIP = "155.230.36.61";
		String strSID = "orcl";
		String portNum = "1521";
		String user = "s2015113955";
		String pass = "wan2good";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		System.out.println(url);
		Connection conn = null;
		PreparedStatement pstmt;
		Statement stmt = null;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		stmt = conn.createStatement();
		
        request.setCharacterEncoding("euc-kr");
        
        //
        String password="";
        String phone="";
    	String name="";
    	String address="";
    	String gender="";
    	String bdate="";
    	String job="";
    	String user_type="";
    	
        int index=0;
        
        System.out.println(id);
        String query = "select * from account where id="+"'"+id+"'";
        
        rs=stmt.executeQuery(query);
        while(rs.next())
        {
        	password=rs.getString(2);
        	phone=rs.getString(3);
        	name=rs.getString(4);
        	user_type=rs.getString(5);
        	address=rs.getString(6);
        	gender=rs.getString(7);
        	bdate=rs.getString(8);
        	job=rs.getString(9);
        }
        //System.out.println(bdate);
        if(address==null)
        	address=" ";
        if(gender==null)
        	gender=" ";
        if(bdate!=null)
        {
        	index=bdate.indexOf(' ');
        	bdate=bdate.substring(0,index);
        }
        else
        {
        	bdate=" ";
        }
        	
        if(job==null)
        {
        	job=" ";
        }
        
        session.setAttribute("id",id);
 	   session.setAttribute("password",password);
 	   session.setAttribute("phone",phone);
 	   session.setAttribute("name",name);
 	   session.setAttribute("user_type",user_type);
 	   session.setAttribute("address",address);
 	   session.setAttribute("gender",gender);
 	   session.setAttribute("bdate",bdate);
 	   session.setAttribute("job",job);
%>

		<br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                       
        <table>
            <tr>
                <td id="id">아이디</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="password">비밀번호</td>
                <td><%=password %></td>
            </tr>
            
            <tr>
                <td id="phone">휴대폰</td>
                <td><%=phone %></td>
            </tr>  
            
            <tr>
                <td id="name">이름</td>
                <td><%=name %></td>
            </tr>
            
            <tr>
                <td id="address">주소</td>
                <td>
                    <%=address%>
                </td>
            </tr>
            
            <tr>
                <td id="gender">성별</td>
                <td><%=gender%></td>
            </tr>
                    
            <tr>
                <td id="bdate">생일</td>
                <td><%=bdate%></td>
            </tr>
            
            <tr>
                <td id="job">직업</td>
                <td><%=job%></td>
            </tr>   
            
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
	<script type="text/javascript">
    
	   function changeForm(val){
	       if(val == "-1"){
	           location.href="loginok.jsp?id=<%=id%>";
	       }else if(val == "0"){
	    	   
	           location.href="modifyfrom.jsp";
	       }
	   }
        
    </script>
</body>
</html>