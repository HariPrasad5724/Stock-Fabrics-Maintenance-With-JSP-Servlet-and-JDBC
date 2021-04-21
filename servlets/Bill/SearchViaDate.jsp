<!DOCTYPE html>
<html>
<head>
<title>Search Bill</title>
</head>
<body>
<h1> Fabric status is displayed below</h1>
<h1>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
    //JDBC Search
            String day =request.getParameter("day");
            String mon =request.getParameter("month");
            String year = request.getParameter("year"); 
             try
	        {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      out.println("Connected");
                      String sql = "select billno,customer_name,inccost from IncomeBills where day='"+day+"' and mon='"+mon+"' and year='"+year+"' ";    
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      while(rs.next())
                      {
                            out.println("Bill Available!\n");
                            out.println("Found Bill no:" + rs.getString(1)+" Customer name "+rs.getString(2)+" Income cost "+rs.getString(3));
                      }
             }
	     catch(Exception e)
             {
                    out.println(e);
	        }
      %></h1>
      <h2>To Move Home click the button below</h2>
      <br>
      <form action="Home.jsp">
          <input type="submit" value="Go to Home" />
      </form>
      <h2>To logout click the button below</h2>
      <br>
      <form action="../Login">
          <input type="submit" value="Logout" />
      </form>
</body>
</html>