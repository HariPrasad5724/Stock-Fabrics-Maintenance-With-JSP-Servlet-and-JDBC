<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   //JDBC Delete
   String ftype=request.getParameter("type");
   String fcolor=request.getParameter("color");
   String fgsm=request.getParameter("gsm");
   String fid="1";
   try
	     {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      out.println("Connected to Database...");
                      String sql = "delete from StockItems where fabtype='"+ftype+"' and color='"+fcolor+"' and gsm='"+fgsm+"' and stockid='"+fid+"'"; 
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            out.println("Removing Fabric from Database!");
                      }
                      else
                      {
                            out.println("Try again!");
                      }
             }
		catch(Exception e)
		{
                    out.println("<h1>Fabric Not Found in the DB!</h1><br>");
                    out.println("Error message: "+e);
		}
%>
<html>
   <head>
      <title>Remove Stock</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
   </head>
   <body>
   <br>
   <h2>To Move Home click the button below</h2>
      <br>
      <form action="Home.jsp">
          <input type="submit" id="home" value="Go to Home" />
      </form>
      <br>
   <h2>To logout click the button below</h2>
      <br>
      <form action="Login">
          <input type="submit" value="Logout" />
      </form>
</html>