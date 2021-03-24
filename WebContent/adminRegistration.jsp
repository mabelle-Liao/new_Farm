<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊</title>
<link rel="stylesheet" type="text/css" href="style.css">  
  <style>
  .register-box{
    height: 630px;
}
</style>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/registerT">
    <div class="register-box">
    <img src="domain.png" class="avatar">
        <h1>註冊帳號</h1>
            <p>姓名</p>
            <input type="text" name="name" placeholder="輸入姓名" required="required">
            <p>帳號</p>
            <input type="text" name="account" placeholder="輸入帳號" required="required">
            <p>密碼</p>
            <input type="password" name="password" placeholder="輸入密碼" required="required">
            <p>果園地址</p>
            <input type="text" name="address" placeholder="輸入地址" required="required">
            <p>聯絡方式</p>
            <input type="text" name="contact" placeholder="輸入電話" required="required">
            <input type="submit" name="register" value="Register">
            </form>
             <center><h1><a href="adminLogin.jsp">登入</a></h1></center>
        </div> 
</body>
</html>