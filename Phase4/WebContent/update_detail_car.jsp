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
		ArrayList<String> car = new ArrayList<String>();

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
		
		String[] fuel_list={"Gasolin","Disel","Electric","CNG","LPG"};
		
		String id=request.getParameter("id");
		String car_number=request.getParameter("car_number");

		String query = "select vehicle.car_number,vehicle.price,vehicle.year,vehicle.distance_driven,make.name,vehicle.model_name,vehicle.detail_model_name,category.c_name,engine_displacement.quantity,transmission.type\r\n"
				+ "from vehicle,engine_displacement,make,category,transmission\r\n" + "where car_number="+car_number+ " and vehicle.quantity_num=engine_displacement.quantity_num and vehicle.m_number=make.m_number and vehicle.category_num=category.category_num and vehicle.transmission_num=transmission.transmission_num";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while (rs.next())

			for (int i = 1; i <= 10; i++)
				car.add(rs.getString(i));

		query = "select color.type\r\n" + "from car_include,color\r\n" + "where car_number=" +car_number+ " and car_include.color_num=color.color_num";

		rs = pstmt.executeQuery(query);
		while (rs.next()) {
			car.add(rs.getString(1));

		}

		query = "select fuel.type\r\n" + "from car_use,fuel\r\n" + "where car_number="+car_number+ "and car_use.fuel_num=fuel.fuel_num";

		rs = pstmt.executeQuery(query);
		while (rs.next()) {
			car.add(rs.getString(1));

		}
		
		String[] selected_car=new String[12];
		for(int i=0; i<12; i++)
			selected_car[i]="";
		int check=0;
		
		for (int j = 0; j <=10 ; j++)
		{
			selected_car[j]=car.get(j);
		}
		for(int j=11; j<car.size(); j++)
		{
			String car_get=car.get(j);
			for(int i=0; i<5; i++)
			{
				if(car_get.equals(fuel_list[i]))
					check+=1;
			}
			if(check!=0)
			{
				selected_car[11]+=car.get(j)+" ";
			}
			else
			{
				selected_car[10]+=" "+car.get(j);
			}
			check=0;
		}
			//out.print("<td>"+car.get(j)+"</td>");
		
		out.println("</td>");
		out.println("</table>");
		
//		out.println(id+car_number);

		session.setAttribute("car_number",selected_car[0]);
 	   session.setAttribute("price",selected_car[1]);
 	   session.setAttribute("year",selected_car[2]);
 	   session.setAttribute("distance",selected_car[3]);
 	   session.setAttribute("make",selected_car[4]);
 	   session.setAttribute("model",selected_car[5]);
 	   session.setAttribute("detail_model",selected_car[6]);
 	   session.setAttribute("category",selected_car[7]);
 	   session.setAttribute("engine_displacement",selected_car[8]);
 	  session.setAttribute("transmission",selected_car[9]);
 	 session.setAttribute("color",selected_car[10]);
 	session.setAttribute("fuel",selected_car[11]);
 	  

%>	
	
	<br><br>
        <b><font size="6" color="gray">차량 정보</font></b>
        <br><br><br>
                  
        <table>
            <tr>
                <td id="id">차량번호</td>
                <td><%=car_number %></td>
            </tr>
                        
            <tr>
                <td id="price">가격</td>
                <td><%=selected_car[1] %></td>
            </tr>
                    
            <tr>
                <td id="year">연식</td>
                <td><%=selected_car[2] %></td>
            </tr>
                    
            <tr>
                <td id="distance">주행거리</td>
                <td><%=selected_car[3]%></td>
            </tr>
                    
            <tr>
                <td id="make">제조사</td>
                <td>
                    <%=selected_car[4] %> 
                </td>
            </tr>
                    
            <tr>
                <td id="model">모델</td>
                <td>
                    <%=selected_car[5] %>
                </td>
            </tr>
                    
            <tr>
                <td id="detail_model">세부 모델</td>
                <td><%=selected_car[6] %></td>
            </tr>
            <tr>
                <td id="category">차종</td>
                <td>
                    <%=selected_car[7] %>
                </td>
            </tr>
            
            <tr>
                <td id="engine_displacement">배기량</td>
                <td>
                    <%=selected_car[8] %>
                </td>
            </tr>
            
            <tr>
                <td id="transmission">기어</td>
                <td>
                    <%=selected_car[9] %>
                </td>
            </tr>
            
			<tr>
                <td id="color">색상</td>
                <td>
                    <%=selected_car[10] %>
                </td>
            </tr>
            
            <tr>
                <td id="fuel">연료</td>
                <td>
                    <%=selected_car[11] %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="정보 변경" onclick="location.href='vehicle_modifyfrom.jsp?id=<%=id%>'">
</body>
</html>