<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>
<body>
<h1>Hello <%
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
              for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   String name = cookie.getName();
                    if (name.equals("username")) {
                        String username = cookie.getValue();
                        out.println(username);
                        break;
                    }
              }
          }
          else 
          {
                  out.println("NULL");
          }
      %> please select the operations listed below </h1><br><br>
<h1> Enter the details of the fabric to be inserted  :</h1>
<form action="Insert.html">
  <input type="submit" value="Insert" />
</form>
<h1> Enter the details of the fabric to be removed  :</h1>
<br>
<form action="Delete.html">
   <input type="submit" value="Remove" />
</form>
<h1> Enter the details of the fabric to be searched :</h1>
<br>
<form action="Search.html">
    <input type="submit" value="Search" />
</form>
<br>
<h1>Click below to logout </h1><br>
<a href="Login"> Logout </a>
</body>
</html>