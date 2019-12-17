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
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
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
		
		String query1="select vehicle.car_number";
		String query2="from vehicle";
		String query3="where vehicle.car_number not in(select car_number from order_list) and vehicle.opendata=1";
		
		System.out.println(m_name+model_name+detail_model_name+category);
		if(!m_name.equals("null"))
		{
			query2=query2+",make";
			query3=query3+" and vehicle.m_number=(select m_number from make where name='"+m_name.replace("/","")+"')";
		}
		if(!model_name.equals("null"))
		{
			
			query3=query3+" and vehicle.model_name='"+model_name.replace("/","")+"'";
		}
		if(!detail_model_name.equals("null"))
		{
			
			query3=query3+" and vehicle.detail_model_name='"+detail_model_name.replace("/","")+"'";
		}
		if(category!=null)
		{
			query2=query2+",category";
			query3=query3+" and vehicle.category_num=(select category_num from category where C_name='"+category.replace("/","")+"')";
		}
		if(quantity!=null)
		{
			
			query2=query2+",engine_displacement";
			query3=query3+" and vehicle.quantity_num=(select quantity_num from engine_displacement where quantity="+quantity.replace("/","")+")";
		}
		if(transmission!=null)
		{
			
			query2=query2+",transmission";
			query3=query3+" and vehicle.transmission_num=(select transmission_num from transmission where type='"+transmission.replace("/","")+"')";
		}
		System.out.println(query1+query2+query3);
		if(color!=null&&color.length>0)
		{
			 query2=query2+",car_include,color";
			 query3=query3+" and vehicle.car_number=car_include.car_number and ( ";
             for(int i=0; i<color.length; i++)
             {
                if(i==color.length-1)
                {
                	query3=query3+"car_include.color_num=(select color_num from color where color.type='"+color[i].replace("/","")+"')";
                }
                else
                {
                   query3=query3+"car_include.color_num=(select color_num from color where color.type='"+color[i].replace("/","")+"')"; 
                    query3=query3+" or ";
                }
			}
             query3=query3+")";
		}
		
		
			 
		if(fuel!=null&&fuel.length>0)
		{
			 query2=query2+",car_use,fuel";
			 query3=query3+" and vehicle.car_number=car_use.car_number and ( ";
             for(int i=0; i<fuel.length; i++)
             {
                if(i==fuel.length-1)
                {
                	query3=query3+"car_use.fuel_num=(select fuel_num from fuel where fuel.type='"+fuel[i].replace("/","")+"')";
                }
                else
                {
                   query3=query3+"car_use.fuel_num=(select fuel_num from fuel where fuel.type='"+fuel[i].replace("/","")+"')"; 
                    query3=query3+" or ";
                }
			}
             query3=query3+")";
		}
		
		
		String query=query1+" "+query2+" "+query3;
		query="select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type\r\n" + 
			"from vehicle,engine_displacement,make,category,transmission\r\n"+
			"where vehicle.car_number in("+query+")\r\n"+
		    "and vehicle.opendata=1 and vehicle.quantity_num=engine_displacement.quantity_num and vehicle.m_number=make.m_number and vehicle.category_num=category.category_num and vehicle.transmission_num=transmission.transmission_num\r\n";
		System.out.println(query);	 
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		
		  out.println("<table border=\"1\">");
			ResultSetMetaData rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			for(int i =1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");}
		while(rs.next()){
			out.println("<tr>");
			
			
			out.println("<form action=\"detail_car.jsp\" method=\"post\">");
			out.println("<input type=\"hidden\" name=\"id\" value="+id+">");
			out.println("<td><input type=\"submit\" name=\"car_number\" value="+rs.getString(1)+"></td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("<td>"+rs.getString(6)+"</td>");
			out.println("<td>"+rs.getString(7)+"</td>");
			out.println("<td>"+rs.getString(8)+"</td>");
			out.println("<td>"+rs.getString(9)+"</td>");
			out.println("<td>"+rs.getString(10)+"</td>");
			out.println("</tr>");

	  	 }
		%>
<body>
<input type="button" value="메인으로" onclick="location.href='loginok.jsp?id=<%=id%>'">
</body>
</html>