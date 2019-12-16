<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 화면</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(function() {
$( "#datepicker" ).datepicker(
{
	changeMonth: true, 
    changeYear: true,
    nextText: '다음 달',
    prevText: '이전 달',
    dateFormat: 'yy-mm-dd',
    yearRange:'1901:2000',
    showMonthAfterYear: true ,
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        
}
 
);
});
</script> 
<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
 
<script type="text/javascript">

    function checkValue()
    {
        if(!document.userInfo.id.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.password.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        if(!document.userInfo.phone.value){
        	alert("휴대폰 번호를 입력하세요");
        	return false;
        }
        if(!document.userInfo.name.value){
        	alert("이름을 입력하세요");
        	return false;
        }
        if(!document.userInfo.id_check.value)
        {
        	alert("아이디 중복확인을 해주세요");
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
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        
        <form method="post" action="joinpro.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="id">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="20">
                        <form method:"post" action="idCheck.jsp">
                        	<input type="button" value="중복확인" onClick="idCheck()">
                        	확인 유무 : <input type="text" name="id_check" value="">
                        </form>
                            
                    </td>
                </tr>
                        
                <tr>
                    <td id="password">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="passwordcheck">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="phone">휴대폰</td>
                    <td>
                        <input type="text" name="phone" maxlength="20">
                    </td>
                </tr>
                
                <tr>
                    <td id="name">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="40">
                    </td>
                </tr>
                
                <tr>
                    <td id="address">주소</td>
                    <td>
                        <input type="text" size="50" name="address" maxlength="40"/>
                    </td>
                </tr>
                
                <tr>
                    <td id="gender">성별</td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="F" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="ymd">생년월일</td>
                    <td>
                    	<input type="text" id="datepicker" name="ymd">
                    </td>
                    <!-- <td>
                        <input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birth_mm">
                            <option value="">월</option>
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
                        <input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4" >
                    </td> -->
                    
                </tr>
                    
                <tr>
                    <td id="job">직업</td>
                    <td>
                        <input type="text" name="job" maxlength="30">
                    </td>
                </tr>
                
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" value="취소" onclick="location.href='firstpage.html'">
        </form>
    </div>
</body>
</html>