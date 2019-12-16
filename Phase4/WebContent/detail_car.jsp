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
		out.println("<table border=\"1\" width=\"800\">");
		out.println("<tr>");
		out.println("Car_Number  Price  Year  Distance  Make  Model  Detail_model  Category  Engine_displacement  Transmission  Color  Fuel");
		for (int j = 0; j < car.size(); j++)
			out.print("<td>"+car.get(j)+"</td>");
		
		out.println("</td>");
		out.println("</table>");
		
		out.println(id+car_number);

	%>
<body>	
	<form action="buy.jsp" method="post">
	<input type="hidden" name="id" value=<%=id %>></input>
	<input type="hidden" name="car_number" value=<%=car_number %>></input>
	<input type="submit" value="구매하기"></input>
	</form>

</body>
</html>