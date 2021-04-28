<%
   //Cookies Insertion
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

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   //JDBC Insertion
   String ftype=request.getParameter("type");
   String fcolor=request.getParameter("color");
   String fgsm=request.getParameter("gsm");
   String fweight=request.getParameter("weight");
   String fcost=request.getParameter("cost");
   String fid="1";
        try
	     {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "insert into StockItems values('" +ftype+ "','" +fcolor+ "','" +fgsm+ "','" +fweight+ "','" +fcost+ "','" +fid+ "')";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                           out.println("<br>");
                           out.println("<h1>Fabric Inserted Successfully!</h1>");
                           out.println("<br>");
                      }
                      else
                      {
                           out.println("<br>");
                           out.println("<h1>Fabric Not Inserted</h1>");
                           out.println("<br>");
                      }
             }
		catch(Exception e)
		{
                out.println("<br>");
                out.println("<h1>"+e+"</h1>");
                out.println("<br>");
		}
%>

<html>
   <head>
      <title>Add Stock</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
   </head>
   <body>
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
</html>