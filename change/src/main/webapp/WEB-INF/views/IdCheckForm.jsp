<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js	"></script>
    
    <script type="text/javascript">
        
        // 아이디 중복체크
        function idCheck(f){
 
            var id = f.id.value.trim();
 
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } 
            else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
                alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
                return false;
            }
            else
            {
                var url = "check_id.do";
                var param="id="+id;
        		sendRequest(url, param, resultFn, "POST");
            }
        }
        
        function resultFn(){
            if(xhr.readyState == 4 && xhr.status == 200){
                // 결과값을 가져온다.
                var data = xhr.responseText; 
                if(data == "no"){
                    alert("사용할수없는 아이디입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(data == "yes"){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                }
            }
        }
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(f){
        	var id = f.id.value.trim();
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.userInfo.idDuplication.value = id;
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.userInfo.id.value = id;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script>
    
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
            <input type="text" name="id" id="userId">
            <input type="button" value="중복확인" onclick="idCheck(this.form);">
        
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue(this.form)">
        </form>
    </div>
</div>    
</body>
</html>
