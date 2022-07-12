<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
<style>
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}

#joinForm{width: 750px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888}
.fpmgBt2{background-color: lightsalmon;color: #fff}

</style>
</head>
<script>
	function checkAll(){
		   if(document.getElementById("chkAll").checked==true){  //id 를 사용하여 하나의 객체만을 호출
		         for(var i=0;i<4;i++) document.getElementsByName("chk")[i].checked=true;   //name 을 사용하여 배열 형태로 담아 호출
		      }
		      if(document.getElementById("chkAll").checked==false){
		         for(var i=0;i<4;i++) document.getElementsByName("chk")[i].checked=false;  
		      }
		}
	
	function agree(){
		var check1 = document.getElementById('chk1').checked;
		var check2 = document.getElementById('chk2').checked;
		var check3 = document.getElementById('chk3').checked;
		var check4 = document.getElementById('chk4').checked;
		
		if(check1 == false || check2 == false){
			alert("이용약관에 동의해주세요");
			return;
		}
		
		location.href="new_check.do";

	}
	
	function refuse(){
		var result = confirm("약관에 동의하지 않을 시 회원가입이 되지 않습니다.");
		if(result){
			alert("메인페이지");
			location.href="main.do";
		}
	}
	
</script>
<body>
    <form action="" id="joinForm" name="joinForm">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll" >
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk1">
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
korea_store 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 korea_store의 이용과 관련하여 it_korea를 제공하는 korea 주식회사(이하 ‘korea’)와 이를 이용하는 korea 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 korea 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk2">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
korea_store 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 korea_store의 이용과 관련하여 it_korea를 제공하는 korea 주식회사(이하 ‘korea’)와 이를 이용하는 korea 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 korea 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk3">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
korea_store 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 korea_store의 이용과 관련하여 it_korea를 제공하는 korea 주식회사(이하 ‘korea’)와 이를 이용하는 korea 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 korea 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04" id="chk4">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1" onclick="refuse(); return false;">비동의</button></li>
                <li><button class="fpmgBt2" onclick="agree(); return false;">동의</button></li>
            </ul>
        </form>
</body>
</html>