<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   String name =request.getParameter("c_name");
   String phone=request.getParameter("c_phone");
   String type=request.getParameter("c_type");
   String color=request.getParameter("c_color");
   String gsm=request.getParameter("c_gsm");
   try
	     {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "insert into CustomerDetails values('" +name+ "','" +phone+ "','" +type+ "','" +color+ "','" +gsm+ "')";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            out.println("<br>");
                            out.println("<h1>CUSTOMER ADDED SUCCESSFULLY!</h1>");
                            out.println("<br>");
                      }
                      else
                      {
                            out.println("<br>");
                            out.println("<h1>PLEASE TRY AGAIN LATER</h1>");
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
      <title>Add Customer</title>
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