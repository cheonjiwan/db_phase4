<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ȭ��</title>
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
<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
 
<script type="text/javascript">

    function checkValue()
    {
        if(!document.userInfo.id.value){
            alert("���̵� �Է��ϼ���.");
            return false;
        }
        
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
        if(!document.userInfo.id_check.value)
        {
        	alert("���̵� �ߺ�Ȯ���� ���ּ���");
        	return false;
        }
    }
    
    function goLoginForm() {
        location.href="login.jsp";
    }
    
    function idCheck(){
    	var form1 = document.userInfo;
    	var user_id=form1.id.value;
    	var url="idCheck.jsp?id=" + user_id;
    	var temp = document.getElementById('id_check');
    	window.open(url,"idCheck","toolbar=no,location=no,menubar=no,scrollbar=no,resizable=no,width=300,height=180");
    	return;
    }

</script> 
</head>
<body>
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">ȸ������</font></b>
        <br><br><br>
        
        
        <form method="post" action="joinpro.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="id">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                        <form method:"post" action="idCheck.jsp">
                        	<input type="button" value="�ߺ�Ȯ��" onClick="idCheck()">
                        	Ȯ�� ���� : <input type="text" name="id_check" value="">
                        </form>
                            
                    </td>
                </tr>
                        
                <tr>
                    <td id="password">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="passwordcheck">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="phone">�޴���</td>
                    <td>
                        <input type="text" name="phone" maxlength="20">
                    </td>
                </tr>
                
                <tr>
                    <td id="name">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                
                <tr>
                    <td id="address">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address" maxlength="40"/>
                    </td>
                </tr>
                
                <tr>
                    <td id="gender">����</td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>��
                        <input type="radio" name="gender" value="F" checked>��
                    </td>
                </tr>
                    
                <tr>
                    <td id="ymd">�������</td>
                    <td>
                    	<input type="text" id="datepicker" name="ymd">
                    </td>
                    <!-- <td>
                        <input type="text" name="birth_yy" maxlength="4" placeholder="��(4��)" size="6" >
                        <select name="birth_mm">
                            <option value="">��</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birth_dd" maxlength="2" placeholder="��" size="4" >
                    </td> -->
                    
                </tr>
                    
                <tr>
                    <td id="job">����</td>
                    <td>
                        <input type="text" name="job" maxlength="30">
                    </td>
                </tr>
                
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���" onclick="location.href='firstpage.html'">
        </form>
    </div>
</body>
</html>