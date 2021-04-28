<!DOCTYPE html>
<html>
<head>
<title>Search Bill</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
</head>
<body>
<h1>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
    //JDBC Search
    String billno=request.getParameter("billno");
    String billtype=request.getParameter("type");
    if(billtype.equals("sales"))
    {
        try
        {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "select customer_name,weight,inccost from IncomeBills where billno = '"+billno+"'";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            String name=rs.getString("customer_name");
                            int wgt=rs.getInt("weight");
                            int cost=rs.getInt("inccost");
                            out.println("<h1>Customer is Available </h1>");
                            out.println("<h1>Customer Name: "+name+"</h1>");
                            out.println("<h1>Total Weight Purchased: "+wgt+"</h1>");
                            out.println("<h1>Amount Recieved: "+cost+"</h1>");
                      }
                      else
                      {
                          out.println("<h1>Bill no unavailable</h1>");
                      }
                }
                catch(Exception e)
                {
                    out.println(e);
                }
    }
    if(billtype.equals("purchase"))
    {
                  try
                  {
                      Connection con=null;
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      out.println("Connected");
                      String sql = "select * from ExpenseBills where billno = '"+billno+"'";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            String name=rs.getString("supplier_name");
                            int wgt=rs.getInt("weight");
                            int cost=rs.getInt("expcost");
                            out.println("Available "+name+" "+wgt+" "+cost);
                      }
                      else
                      {
                            out.println("BILL IS NOT AVAILABLE!!");
                      }
                }
                catch(Exception e) 
                { 
                        System.out.println(e); 
                }
    }
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