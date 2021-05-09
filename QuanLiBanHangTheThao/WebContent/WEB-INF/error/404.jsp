<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<title>Error 404</title>
<link rel="stylesheet" type="text/css" href="resources/error/404.css">
</head>
<body>
	<div class="text">
  <div>ERROR</div>
  <h1>404</h1>
  <hr>
  <div>Page Not Found</div>
</div>

<div class="astronaut">
  <img src="https://images.vexels.com/media/users/3/152639/isolated/preview/506b575739e90613428cdb399175e2c8-space-astronaut-cartoon-by-vexels.png" alt="" class="src">
</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded",function(){
	  
	 var body=document.body;
	  setInterval(createStar,100);
	  function createStar(){
	    var right=Math.random()*500;
	    var top=Math.random()*screen.height;
	    var star=document.createElement("div");
	 star.classList.add("star")
	  body.appendChild(star);
	  setInterval(runStar,10);
	    star.style.top=top+"px";
	  function runStar(){
	    if(right>=screen.width){
	      star.remove();
	    }
	    right+=3;
	    star.style.right=right+"px";
	  }
	  } 
	})
</script>
</body>
</html>