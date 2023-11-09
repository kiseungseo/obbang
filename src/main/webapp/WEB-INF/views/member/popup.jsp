<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<script language="JavaScript">
//head 태그 안에 스크립트 선언
        function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closePop() {
            if ( document.pop_form.chkbox.checked ){
                setCookie( "maindiv", "done" , 1 );
            }
            document.all['layer_popup'].style.visibility = "hidden";
        }
</script>
 <script language="Javascript">
    cookiedata = document.cookie;   
    if ( cookiedata.indexOf("maindiv=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>
	
	
	
	
</head>
<style>
.layerPopup {
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,.5);
  z-index: 9000;
}

.layerPopup .layerBox {
  z-index: 10000;   
  position: relative;
  padding: 30px;
  background: #fff;
  border-radius: 6px;
  transform: translate(-60%, -10%);
  width: 550px;
}

.layerPopup .layerBox .title {
  margin-bottom: 10px;
  padding-bottom: 10px;
  font-weight: 600;
  border-bottom: 1px solid #d9d9d9;
}

.layerPopup .layerBox .btnTodayHide {
  font-size: 14px;
  font-weight: 600;
  color: black;
  float: left;
  text-decoration: none;
  width: 150px; 
  height: 30px;
  line-height: 30px;
  border: black solid 1px;
  text-align: center;
  text-decoration: none;
}

.layerPopup div {
  display: inline;
}

.layerPopup form {
  margin-top: 5px;
  font-size: 16px;
  font-weight: 600;
  weight: 100%;
  height: 30px;
  line-height: 30px;
}

.layerPopup #close {
  font-size: 16px;
  font-weight: 600;
  width: 40px;
  height: 30px;
  color: black;
  float: right;
  line-height: 30px;
  text-align: center;
  text-decoration: underline;
}

.layerPopup a {
  text-decoration: none;
  color: black;
  width: 50px;
  height: 40px;
}
</style>





<body>
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    <div class="layerBox">
        <h4 class="title">공지사항</h4>
        <div class="cont">
            <p>
<img src="https://img.freepik.com/free-vector/salted-egg-banner-design-with-custard-crepe-cake-watercolor-illustration_83728-2198.jpg?w=740&t=st=1681456771~exp=1681457371~hmac=48bdb46a196b8767e1b067637e3dd3869ca76a1e0cd54ae77b069f04e6528273" 
width=auto height=500 usemap="#popup" alt="event page">
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
        <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
		<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
		</form>
	</div>
</div>
</body>
</html>