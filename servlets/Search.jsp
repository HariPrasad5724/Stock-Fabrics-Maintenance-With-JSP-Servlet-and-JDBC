
<!DOCTYPE html>
<html>
<head>
<title>Search Fabric</title>
</head>
<body>
<h1> Enter the details of the fabric to be inserted </h1>
<h1><%
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
              for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   String query = cookie.getValue();
                    if (query.equals(request.getParameter("color"))&&query.equals(request.getParameter("type"))||query.equals(request.getParameter("gsm"))) {
                        out.println("Stock found");
                    }
              }
          }
          else 
          {
                  out.println("Stock not found");
          }
      %></h1>
</body>
</html>