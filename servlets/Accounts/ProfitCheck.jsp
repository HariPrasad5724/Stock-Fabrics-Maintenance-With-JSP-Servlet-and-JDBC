<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<html>
   <head>
      <title>Calculating The Total Profit from the initial days</title>
   </head>
   <body>
   <h1>Calculating....</h1>
<%
   try {
                Connection con = null;
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "57241516");
                        String sumI = "select sum(inccost) from IncomeBills";
                        PreparedStatement ps1 = con.prepareStatement(sumI);
                        ResultSet rs1 = ps1.executeQuery();
                        if (rs1.next()) {
                            int Icost = rs1.getInt("sum(inccost)");
                            try {
                                Connection con1 = null;
                                con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system","57241516");
                                String sumE = "select sum(expcost) from ExpenseBills";
                                PreparedStatement ps2 = con1.prepareStatement(sumE);
                                ResultSet rs2 = ps2.executeQuery();
                                if (rs2.next()) {
                                    int Ecost = rs2.getInt("sum(expcost)");
                                    out.println("Calculated..\n");
                                    int tot = Icost - Ecost;
                                    out.println("The total profit is "+tot);
                                }
                                else {
                                    out.println("Something went wrong while calculating!!");
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    }
                catch (Exception e) {
                    out.println(e);
     }
%>
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