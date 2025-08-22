<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login - GaadiDost</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
<header>
  <div class="container">
    <h1 class="logo">GaadiDost</h1>
    <nav>
      <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
      <a href="${pageContext.request.contextPath}/signup.jsp" class="btn">Sign Up</a>
    </nav>
  </div>
</header>

<section class="main-content" style="margin-left:0;">
  <div class="card" style="max-width:420px;margin:40px auto;">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
      <input type="text" name="username" placeholder="Enter Username" required />
      <input type="password" name="password" placeholder="Enter Password" required />
      <button type="submit" class="cta-btn full-width">Login</button>
    </form>
    <p style="margin-top:10px;">Don’t have an account? <a href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a></p>
  </div>
</section>

<footer>
  <p>&copy; 2025 GaadiDost. All Rights Reserved.</p>
</footer>
</body>
</html>
