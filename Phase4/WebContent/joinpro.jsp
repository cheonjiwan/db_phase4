<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 처리</title>
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
 
 		// 필수
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String phone=request.getParameter("phone");
        String name = request.getParameter("name");
        
        // 나머지
        String address = request.getParameter("address");
        if(address.equals(""))
        	address="null";
		int user_type = 0;
		String gender = request.getParameter("gender");
		if(gender.equals(""))
        	gender="null";
		else if(gender.equals("여"))
			gender="F";
		else if(gender.equals("남"))
			gender="M";
		String bdate = request.getParameter("ymd");
		if(bdate.equals(""))
        	bdate="null";
		 
		//System.out.println(bdate);
		String job = request.getParameter("job");
		if(job.equals(""))
        	job="null";
		
		String query = "insert into account values("+"'"+id+"',"+"'"+password+"',"+"'"+phone+"',"+"'"+name+"',"+user_type+",";
		
		if(!address.equals("null"))
			query+="'"+address+"',";
		else
			query+=address+",";
		
		if(!gender.equals("null"))
			query+="'"+gender+"',";
		else
			query+=gender+",";
		
		if(!bdate.equals("null"))
			query+="TO_DATE("+"'"+bdate+"',"+"'yyyy-mm-dd'),";
		else
			query+=bdate+",";
		
		if(!job.equals("null"))
			query+="'"+job+"')";
		else
			query+=job+")";
/* 		if(!bdate.equals("null"))
			query = "isert into account values("+"'"+id+"',"+"'"+password+"',"+"'"+phone+"',"+"'"+name+"',"+user_type+","+"'"+address+"',"+"'"+gender+"',"+"TO_DATE("+"'"+bdate+"',"+"'yyyy-mm-dd'),"+"'"+job+"')";
		else
			query = "insert into account values("+"'"+id+"',"+"'"+password+"',"+"'"+phone+"',"+"'"+name+"',"+user_type+","+"'"+address+"',"+"'"+gender+"',"+"TO_DATE("+"'"+bdate+"',"+"'yyyy-mm-dd'),"+"'"+job+"')"; */
		
		System.out.println(query);
		//rs = pstmt.executeQuery();
		
		try {
            
            int res=stmt.executeUpdate(query);
            
            //System.out.println("Ddddddddddd");
      
            if(res!=0)
            {
               System.out.println("회원가입 완료!");
               conn.commit();
            }
            
         } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
         }
		
%>
	
	<form method="POST" action="login.jsp" >
		<div id="wrap">
        <br><br>
        <br><br>
        <font color="blue"><%=name %></font>님 가입을 축하드립니다.<br>
        	회원님의 아이디는 <font color="blue"><%=id %></font> 입니다.<br>
        	
        <input type="submit" value="확인">
</div>
	</form>


</body>
</html>