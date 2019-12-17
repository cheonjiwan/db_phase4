<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java"
	import="java.text.*,java.sql.*, java.util.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		Statement stmt = null;
		stmt = conn.createStatement();
		int res;
		int flag=0;
		
		
		String id=request.getParameter("id");
		String car_number = request.getParameter("car_number");
    	String price = request.getParameter("price");
    	String year = request.getParameter("year");
    	String distance = request.getParameter("distance");
    	
    	String model_name=request.getParameter("model_name");
		String detail_model_name=request.getParameter("detail_model_name");
		
		String m_name=request.getParameter("m_name");
    	String category = request.getParameter("category");
    	String engine_displacement = request.getParameter("engine_displacement");
    	String transmission = request.getParameter("transmission");
    	
    	String[] color = request.getParameterValues("color");
    	String[] fuel = request.getParameterValues("fuel");
    	
    	String m_number="",category_num="",quantity_num="",transmission_num="";
    	int color_num,fuel_num;
    	
    	
    	System.out.println(id);
    	System.out.println(car_number);
    	System.out.println(price);
    	System.out.println(year);
    	System.out.println(distance);
    	System.out.println(model_name);
    	System.out.println(detail_model_name);
    	System.out.println(m_name);
    	System.out.println(category);
    	System.out.println(engine_displacement);
    	System.out.println(transmission);
    	for(int i=0; i<color.length; i++)
    		System.out.println(color[i]);
    	for(int i=0; i<fuel.length; i++)
    		System.out.println(fuel[i]);
    	
		String sql="";
		System.out.println("?");
		try
		{
			//String query = "update account set password=10000, phone=?, name=?, address=?, gender=?, bdate=?, job=? where id=?";
			
			String query="";
			String query2="";
			String query3="";
			String query4="";
			
			query3 = "delete from car_use where car_number="+car_number;
			res=stmt.executeUpdate(query3);
			if(res!=0)
				System.out.println("연료 삭제완료");
			
			query4 = "delete from car_include where car_number="+car_number;
			res=stmt.executeUpdate(query4);
			if(res!=0)
				System.out.println("색상 삭제완료");
			
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
          
          String sql3="";
          
          sql3="select m_number from make where name='"+m_name+"'";
          rs=stmt.executeQuery(sql3);
          while(rs.next())
          {
             m_number=rs.getString(1);
          }
          
          sql3="select category_num from category where c_name='"+category+"'";
          rs=stmt.executeQuery(sql3);
          while(rs.next())
          {
        	  category_num=rs.getString(1);
          }
          sql3="select quantity_num from engine_displacement where quantity='"+engine_displacement+"'";
          rs=stmt.executeQuery(sql3);
          while(rs.next())
          {
        	  quantity_num=rs.getString(1);
          }
          sql3="select transmission_num from transmission where type='"+transmission+"'";
          rs=stmt.executeQuery(sql3);
          while(rs.next())
          {
        	  transmission_num=rs.getString(1);
          }
          
          query="update vehicle set price="+price+","+" year="+year+","+" distance_driven="+distance+","+" model_name="+"'"+model_name+"',"+" detail_model_name="+"'"+detail_model_name+"',";
		  query2=" m_number="+m_number+","+" category_num="+category_num+","+" quantity_num="+quantity_num+","+" transmission_num="+transmission_num+" where car_number="+car_number;
			
		  query+=query2;
		  System.out.println(query);

		  res=stmt.executeUpdate(query);
	        
	        //System.out.println("Ddddddddddd");
	  
	        if(res!=0)
	        {
	           System.out.println("수정 완료!");
	           flag=1;
	           conn.commit();
	        }
			
			conn.commit();
			
				
			
		}
		catch(Exception sqle)
		{
			try{
				conn.rollback();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		
		
		%>
</body>
<%
if(flag==1)
{
	%>
	<br><br>
    <font size="5" color="gray">차량정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'"/>
    <%	
}
%>


</html>