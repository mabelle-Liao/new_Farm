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
  h3{
color:red;
}
  .login-box{
    height: 400px;
}</style>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/loginT">
    <div class="login-box">
    <img src="user.png" class="avatar">
        <h3><center>帳密錯誤or沒有帳號</center></h3>
            <p>帳號</p>
            <input type="text" name="email" placeholder="Enter Username" required="required">
            <p>密碼</p>
            <input type="password" name="password" placeholder="Enter Password" required="required">
            <input type="submit" name="submit" value="Login">
            </form>
              <center><h1><a href="adminRegistration.jsp">註冊</a></h1></center>
        </div>   
</body>
</html>