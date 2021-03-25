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
                           out.println("Fabric Inserted Successfully!");
                      }
                      else
                      {
                           out.println("Fabric Not Inserted");

                      }
             }
		catch(Exception e)
		{
                out.println(e);
		}
%>

<html>
   <head>
      <title>Adding Stock</title>
   </head>
   <body>
   <h1>Added successfully</h1>
   <h2>To Move Home click the button below</h2>
      <br>
      <form action="Home.jsp">
          <input type="submit" value="Go to Home" />
      </form>
   <h2>To logout click the button below</h2>
      <br>
      <form action="Login">
          <input type="submit" value="Logout" />
      </form>
</html>