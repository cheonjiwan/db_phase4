<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(function() {
$( "#datepicker" ).datepicker(
{
	changeMonth: true, 
    changeYear: true,
    nextText: '���� ��',
    prevText: '���� ��',
    dateFormat: 'yy-mm-dd',
    yearRange:'1901:2000',
    showMonthAfterYear: true ,
    dayNamesMin: ['��', 'ȭ', '��', '��', '��', '��', '��'],
    monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
        
}
 
);
});
</script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����ó��</title>
<script type="text/javascript">

    function checkValue()
    {
        
        if(!document.userInfo.password.value){
            alert("��й�ȣ�� �Է��ϼ���.");
            return false;
        }
        
        if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
            return false;
        }
        if(!document.userInfo.phone.value){
        	alert("�޴��� ��ȣ�� �Է��ϼ���");
        	return false;
        }
        if(!document.userInfo.name.value){
        	alert("�̸��� �Է��ϼ���");
        	return false;
        }
    }
</script> 
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
	
	String id=request.getParameter("id");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	String bdate = request.getParameter("ymd");
	String job = request.getParameter("job");
	
	if(address.equals(" "))
		address="null";
	if(bdate.equals(" "))
		bdate="null";
	if(job.equals(" "))
		job="null";
	
	
	System.out.println("���ǰ�");
	System.out.println(session.getAttribute("id"));
	System.out.println(session.getAttribute("password"));
	System.out.println(session.getAttribute("phone"));
	System.out.println(session.getAttribute("name"));
	//System.out.println(user_type);
	System.out.println(session.getAttribute("address"));
	System.out.println(session.getAttribute("gender"));
	System.out.println(session.getAttribute("bdate"));
	System.out.println(session.getAttribute("job"));
	
	System.out.println(id);
	System.out.println(password);
	System.out.println(phone);
	System.out.println(name);
	//System.out.println(user_type);
	System.out.println(address);
	System.out.println(gender);
	System.out.println(bdate);
	System.out.println(job); 
	
	int check=0;
	String changevalue="";
	String[] values;
	/* if(!session.getAttribute("password").equals(password))
		changevalue+="password ";
	if(!session.getAttribute("phone").equals(phone))
		changevalue+="phone ";
	if(!session.getAttribute("name").equals(name))
		changevalue+="name ";
	if(!session.getAttribute("address").equals(" "))
		changevalue+="address ";
	if(!session.getAttribute("gender").equals(gender))
		changevalue+="gender ";
	if(!session.getAttribute("bdate").equals(" "))
		changevalue+="bdate ";
	if(!session.getAttribute("job").equals(" "))
		changevalue+="job "; */
	
	
	
	values=changevalue.split(" ");
	
	try
	{
		//String query = "update account set password=10000, phone=?, name=?, address=?, gender=?, bdate=?, job=? where id=?";
		String query="update account set password="+"'"+password+"',"+" phone="+"'"+phone+"',"+"name="+"'"+name+"',";
		
		if(address.equals("null"))
			query+="address="+address+", ";
		else
			query+="address='"+address+"', ";
		
		query+="gender="+"'"+gender+"', ";
		
		if(bdate.equals("null"))
			query+="bdate="+bdate+", ";
		else
			query+="bdate=TO_DATE("+"'"+bdate+"',"+"'yyyy-mm-dd'), ";
		
		if(job.equals("null"))
			query+="job="+job;
		else
			query+="job="+"'"+job+"'";
		
		
		query+=" where id="+"'"+id+"'";
		System.out.println(query);
		String dbpw="";
		
		int res=stmt.executeUpdate(query);
        
        //System.out.println("Ddddddddddd");
  
        if(res!=0)
        {
           System.out.println("���� �Ϸ�!");
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

<br><br>
    <font size="5" color="gray">ȸ�������� �����Ǿ����ϴ�.</font>
    <br><br>
    <input type="button" value="��������" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'"/>


</body>
</html>