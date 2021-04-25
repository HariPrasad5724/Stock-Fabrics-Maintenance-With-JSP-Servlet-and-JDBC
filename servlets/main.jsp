<%@ page import = "java.io.*,java.util.*" %>
<%
   Cookie Name = new Cookie("username", request.getParameter("username"));
   Name.setMaxAge(60*60*24);    
   response.addCookie(Name);
%>
<html>
   <head>
      <title>Main</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
   </head>
   
   <body>
      <h1>Hello <%= request.getParameter("username")%></h1>
      <br>
      <h2>To maintain Stock details click the button below</h2>
      <br>
      <form action="./Stock/Home.jsp">
          <input type="submit" id="stock" value="Stock Maintenance" />
      </form>
      <br>
      <br>
      <h2>To maintain Bill details click the button below</h2>
      <br>
      <form action="./Bill/Home.jsp">
          <input type="submit" id="bill" value="Bill Maintenance" />
      </form>
      <br>
      <h2>To maintain Accounting details click the button below</h2>
      <br>
      <form action="./Accounts/Home.jsp">
          <input type="submit" id="account" value="Accounting Finance" />
      </form>
      <br>
      <h2>To logout click the button below</h2>
      <br>
      <form action="Login">
          <input type="submit" value="Logout" />
      </form>
   </body>
</html>
