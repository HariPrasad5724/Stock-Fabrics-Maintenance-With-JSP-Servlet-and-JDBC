<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   //JDBC Insertion
   String cname =request.getParameter("cname");
   String billno=request.getParameter("billno");
   String weight=request.getParameter("weight");
   String amount=request.getParameter("amount");
   String day=request.getParameter("day");
   String month=request.getParameter("month");
   String year=request.getParameter("year");
        try
	     {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "insert into ExpenseBills values('" +cname+ "','" +billno+ "','" +weight+ "','" +amount+ "','" +day+ "','" +month+ "','" +year+ "')";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                           out.println("Sales Bill Inserted Successfully!");
                      }
                      else
                      {
                           out.println("Bill Not Inserted");

                      }
             }
		catch(Exception e)
		{
                out.println(e);
		}
%>

<html>
   <head>
      <title>Adding Purchase Bill</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
   </head>
   <body>
   <h1>Added successfully</h1>
   <br>
   <h2>To Move Home click the button below</h2>
      <br>
      <form action="Home.jsp">
          <input type="submit" id="home" value="Go to Home" />
      </form>
   <h2>To logout click the button below</h2>
      <br>
      <form action="Login">
          <input type="submit" value="Logout" />
      </form>
</html>