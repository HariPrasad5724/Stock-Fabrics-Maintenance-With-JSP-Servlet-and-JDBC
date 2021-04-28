<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<html>
   <head>
      <title>Search Customer</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
   </head>
   <body>
   <h1>Customer Search Portal</h1>
   <%
   String name =request.getParameter("s_name");
   String phone=request.getParameter("s_phone");
 try
	     {
                      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "select fabtype,color,gsm from CustomerDetails where customer_name='"+name+"' or customer_phone='"+phone+"' ";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            String type =rs.getString("fabtype");
                            String color =rs.getString("color");
                            int gsm=rs.getInt("gsm");
                            out.println("<html><body>");
                            out.println("<h2>THE CUSTOMER YOU HAVE REQUESTED IS AVAILABLE AND THE FABRICS ORDERED BY HIM ARE!!<h2>");
                            out.println("<br>");
                            out.println("<br>");
                            out.println("<h1>Requested Fabric name: "+type+"</h1>");
                            out.println("<br>");
                            out.println("<h1>Requested Fabric Color: "+color+"</h1>");
                            out.println("<br>");
                            out.println("<h1>Requested Fabric GSM: "+gsm+"</h1>");
                            out.println("<br>");
                            out.println("</body></html>");
                      }
                      else
                      {
                            out.println("CUSTOMER DOESN'T EXIST PLEASE ENTER CORRECTLY!");
                      }
             }
		catch(Exception e)
		{
                    out.println(e);
		}
%>
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