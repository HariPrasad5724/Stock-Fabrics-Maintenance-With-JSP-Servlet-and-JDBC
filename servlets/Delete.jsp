<!DOCTYPE html>
<html>
<head>
<title>Remove Fabric</title>
</head>
<body>
<%
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if((cookie.getValue( )).compareTo("type") == 0 && (cookie.getValue( )).compareTo("color") == 0) {
                  cookie.setMaxAge(0);
                  response.addCookie(cookie);
                  out.print("Deleted cookie: " + 
                  cookie.getName( ) + "<br/>");
               }
               out.print("Name : " + cookie.getName( ) + ",  ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
            }
         } else {
            out.println(
            "<h2>No Stock founds</h2>");
         }
      %>
<h1> Enter the details of the fabric to be removed </h1>
<form action="Home.jsp" method="GET">
<h1>Fabric Type: <input type="text" name="type" /><br><br>
Fabric Color: <input type="text" name="color" /><br><br>
Fabric GSM: <input type="text" name="gsm" /><br><br>
<input type="submit" value="Submit" /><br><br>
<h1>Click below to logout </h1><br>
<a href="Login"> Logout </a>
</form>
</body>
</html>