<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<% 
		String serverIP = "155.230.36.61";
		String strSID = "orcl";
		String portNum = "1521";
		String user = "s2015113955";
		String pass = "wan2good";
		String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
		System.out.println(url);
		Connection conn = null;
		PreparedStatement pstmt;
		Statement stmt = null;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();

		String id=request.getParameter("id");
		String car_number=request.getParameter("car_number");
		String m_name=request.getParameter("m_name");
		String model_name=request.getParameter("model_name");
		String detail_model_name=request.getParameter("detail_model_name");
		String category=request.getParameter("category");
		String quantity=request.getParameter("quantity");
		String transmission=request.getParameter("transmission");
		String[] color=request.getParameterValues("color");
		String[] fuel=request.getParameterValues("fuel");
	   String price = request.getParameter("price");
		String distance_driven = request.getParameter("distance_driven");
		String year = request.getParameter("year");
		
		String query1="select vehicle.car_number";
		String query2="from vehicle";
		String query3="where vehicle.car_number not in(select car_number from order_list) and vehicle.opendata=1";
		
		System.out.println(m_name+model_name+detail_model_name+category);
		if(transmission==null||color==null||fuel==null||category==null||quantity==null)
		{
			%>
			<form action="insert.jsp" method="post">
				<center>
					<br />
					모든 정보를 입력하세요
					<input type="hidden" name="id" value=<%=id %>></input>
					
					<input type="hidden" name='car_number' value="<%=car_number%>">
					<input type="hidden" name='price' value="<%=price%>">
					<input type="hidden" name='distance_driven' value="<%=distance_driven%>">
					<input type="hidden" name='year' value="<%=year%>">
					<input type="submit" value="닫기">
				</center>
			</form>
			
			<% 
		}
		else{
	
			String sql="select m_number from make where name='"+m_name+"'";
			String m_number="";
			String category_num="";
			String quantity_num="";
			String transmission_num="";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				m_number=rs.getString(1);
			}
			sql="select category_num from category where c_name='"+category+"'";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				category_num=rs.getString(1);
			}
			
			sql="select quantity_num from engine_displacement where quantity='"+quantity+"'";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				quantity_num=rs.getString(1);
			}
			sql="select transmission_num from transmission where type='"+transmission+"'";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				transmission_num=rs.getString(1);
			}
			
			sql="insert into vehicle values("+car_number+","+price+","+year+","+distance_driven+","+m_number+",'"+model_name+"','"+detail_model_name+"',"+category_num+","+quantity_num+","+transmission_num+",1)";
			System.out.println(sql);

			
			int res=stmt.executeUpdate(sql);
			conn.commit();
			
			 for(int i=0; i<color.length; i++)
             {
            	  sql="select color_num from color where type='"+color[i]+"'";
				  rs=stmt.executeQuery(sql);
				  while(rs.next())
				  {
					  String sql2="insert into car_include values("+car_number+","+rs.getString(1)+")";
					  res=stmt.executeUpdate(sql2);
   					  System.out.println(sql2);
					  conn.commit();
				  }
             }
			
			 
			 for(int i=0; i<fuel.length; i++)
             {
            	  sql="select fuel_num from fuel where type='"+fuel[i]+"'";
				  rs=stmt.executeQuery(sql);
				  while(rs.next())
				  {
					  String sql2="insert into car_use values("+car_number+","+rs.getString(1)+")";
					  res=stmt.executeUpdate(sql2);
   					  System.out.println(sql2);
					  conn.commit();
				  }
             }
		%>
		<body>
			<h1> 등록 완료되었습니다</h1>
			<form action="loginok.jsp" method="post">
				<input type="hidden" name="id" value=<%=id %>></input>
				<input type="submit" value="메인화면"></input>
				
			
			</form>
			</body>
			</html>
			 
			 <%
			 
			 
		
		}
		%>
