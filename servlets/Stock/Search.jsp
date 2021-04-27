<!DOCTYPE html>
<html>
<head>
<title>Search Fabric</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
</head>
<body>
<h1> Fabric status is displayed below</h1>
<h1>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
    //JDBC Search
   String ftype=request.getParameter("type");
   String fcolor=request.getParameter("color");
   String fgsm=request.getParameter("gsm");
        try
	     {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      out.println("Connected to DB...");
                      String sql = "select weight,cost,stockid from StockItems where fabtype = '"+ftype+"' and color = '"+fcolor+"' and gsm = '"+fgsm+"'";    
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            out.println("<br><br>Fabric is available in Database!");
                      }
                      else
                      {
                            out.println("<br><br>Fabric is unavailable in Database!");
                      }
             }
	     catch(Exception e)
	     {
                    out.println(e);
	     }
%>
<%
         //Search in Cookies
        /* Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
              for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   String query = cookie.getValue();
                    if (query.equals(request.getParameter("color"))&&query.equals(request.getParameter("type"))&&query.equals(request.getParameter("gsm"))) {
                        out.println("<br><br>Stock Found in cookies");
                    }
              }
          }*/
      %></h1>
      <br>
      <h2>To Move Home click the button below</h2>
      <br>
      <form action="Home.jsp">
          <input type="submit" id="home" value="Go to Home" />
      </form>
      <h2>To logout click the button below</h2>
      <br>
      <form action="../Login">
          <input type="submit" value="Logout" />
      </form>
</body>
</html>