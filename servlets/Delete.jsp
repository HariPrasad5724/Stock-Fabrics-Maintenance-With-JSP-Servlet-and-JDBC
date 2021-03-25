
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
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
                            out.println("Fabric Removed Successfully!");
                      }
                      else
                      {
                            out.println("Try again!");
                      }
             }
		catch(Exception e)
		{
                    out.println(e);
		}
%>
<html>
   <head>
      <title>Remove Stock</title>
   </head>
   <body>
   <h1>Removed the Fabric successfully</h1>
   <h2>To logout click the button below</h2>
      <br>
      <form action="Login">
          <input type="submit" value="Logout" />
      </form>
</html>