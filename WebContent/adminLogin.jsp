<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入</title>
<link rel="stylesheet" type="text/css" href="style.css">  
  <style>
  .login-box{
    height: 380px;
}</style>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/loginT">
    <div class="login-box">
    <img src="user.png" class="avatar">
        <h1>使用者登入</h1>
            <p>帳號</p>
            <input type="text" name="email" placeholder="輸入帳號" required="required">
            <p>密碼</p>
            <input type="password" name="password" placeholder="輸入密碼" required="required">
            <input type="submit" name="submit" value="登入">
            <!-- <input type="button" name="index" value="首頁"> -->
            </form>
             <center><h1><a href="index.html">首頁</a></h1></center>
        </div> 
</body>
</html>