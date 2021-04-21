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
    String billno=request.getParameter("billno");
    String billtype=request.getParameter("type");
    if(billtype.equals("sales"))
    {
        try
        {
                      Connection con=null;
                      out.println("Connected");
                      con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","57241516");
                      String sql = "select customer_name,weight,inccost from IncomeBills where billno = '"+billno+"'";
                      PreparedStatement ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery();
                      if(rs.next())
                      {
                            String name=rs.getString("customer_name");
                            int wgt=rs.getInt("weight");
                            int cost=rs.getInt("inccost");
                            out.println("Available "+name+" "+wgt+" "+cost);
                      }
                      else
                      {
                          out.println("Not available");
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
</body>
</html>