<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%
String id=(String)session.getAttribute("id");
String password=(String)session.getAttribute("password");
String phone=(String)session.getAttribute("phone");
String name=(String)session.getAttribute("name");
String user_type=(String)session.getAttribute("user_type");
String address=(String)session.getAttribute("address");
String gender=(String)session.getAttribute("gender");
String bdate=(String)session.getAttribute("bdate");
String job=(String)session.getAttribute("job");

System.out.println("��������");
System.out.println(id);
System.out.println(password);
System.out.println(phone);
System.out.println(name);
System.out.println(user_type);
System.out.println(address);
System.out.println(gender);
System.out.println(bdate);
System.out.println(job); 
%>

<title>ȸ������ ����ȭ��</title>

</head>
<script type="text/javascript">  
   	function checkValue() 
    {
        if(!document.userInfo.password.value){
            alert("��й�ȣ�� �Է��ϼ���.");
            return false;
        }
    }
    
</script>
<body>
<br><br>
        <b><font size="6" color="gray">ȸ������ ����</font></b>
        <br><br><br>
		<form method="post" action="modifypro.jsp?id=<%=id %>" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="id">���̵�</td>
                    <td id="id"><%=id %></td>
                </tr>
                <tr>
                    <td id="password">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=password%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
            	<tr>
            		<td id="phone">�޴���</td>
                    <td>
                        <input type="text" name="phone" maxlength="20" 
                            value="<%=phone%>">
                    </td>
                </tr>
                
                <tr>
                    <td id="name">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="20" 
                            value="<%=name%>">
                    </td>
                </tr>
                
                <tr>
                    <td id="address">�ּ�</td>
                    <td>
                        <input type="text" name="address" maxlength="50" 
                            value="<%=address%>">
                    </td>
                </tr>
                
                <tr>
                   <td id="gender">����</td>
                    <td>
                    	<%if(gender.equals("F"))  
                    	{
                    		%>
                    		<input type="radio" name="gender" value="M" >��
                        <input type="radio" name="gender" value="F" checked>��
                        <%	
                    	}else
                    	{
                    		%>	
                    		<input type="radio" name="gender" value="M" checked>��
                        <input type="radio" name="gender" value="F" >��                    		
                        <%
                    	}
                    	 %>
                        
                    </td>
                </tr>
                    
                <tr>
                    <td id="ymd">�������</td>
                    <td>
                        <input type="text" id="datepicker" name="ymd" value="<%=bdate%>">
                    </td>
                </tr>
                    
                <tr>
                    <td id="job">����</td>
                    <td>
                        <input type="text" name="job" maxlength="20" 
                            value="<%=job%>">
                    </td>
                </tr>
                    
            </table>
            <br><br>
            <input type="button" value="���" onclick="javascript:window.location='loginok.jsp?id=<%=id%>'">
            <input type="submit" value="����"/>  
        </form>
</body>
</html>