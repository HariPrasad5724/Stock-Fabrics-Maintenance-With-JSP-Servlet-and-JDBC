<%
   Cookie type = new Cookie("type", request.getParameter("type"));
   Cookie color = new Cookie("color", request.getParameter("color"));
   Cookie gsm = new Cookie("gsm", request.getParameter("gsm"));
   Cookie weight = new Cookie("weight", request.getParameter("weight"));
   Cookie cost = new Cookie("cost", request.getParameter("cost"));

   type.setMaxAge(60*60*24);
   color.setMaxAge(60*60*24);
   gsm.setMaxAge(60*60*24);
   weight.setMaxAge(60*60*24);
   cost.setMaxAge(60*60*24);

   response.addCookie(type);
   response.addCookie(color);
   response.addCookie(gsm);
   response.addCookie(weight);
   response.addCookie(cost);
%>

<html>
   <head>
      <title>Adding Stock</title>
   </head>
   
   <body>
   <h1>Added successfully</h1>
   <h1>Click below to logout </h1><br>
   <a href="Login"> Logout </a>
   </body>

</html>