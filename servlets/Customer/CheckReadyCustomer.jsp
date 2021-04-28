<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
try
 {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "select customer_name,customer_phone from AvailableCustomers ";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      while(rs.next())
                      {
                          out.println("<br>");
                            out.println("<h2>List of Customer Available currently with requested products!</h2>");
                            out.println("<br>");
                            out.println("<br>");
                            out.println("<h1>Requested Customer name: "+rs.getString(1)+"</h1>");
                            out.println("<br>");
                            out.println("<h1>Requested Customer Phone number: "+rs.getString(2)+"</h1>");
                            out.println("<br>");
                      }
             }
		catch(Exception e)
		{
                    out.println(e);
		}
%>

<html>
   <head>
      <title>Ready Customers</title>
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