<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>


<html>
   <head>
      <title>Calculating The Total Profit from the initial days</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
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
                                    int tot = Icost - Ecost;
                                     out.println("<br>");
                                    out.println("<h1>The total profit is "+tot+"</h1>");
                                     out.println("<br>");
                                }
                                else {
                                     out.println("<br>");
                                    out.println("<h1>Something went wrong while calculating!!</h1>");
                                     out.println("<br>");
                                }
                            } catch (Exception e) {
                                 out.println("<br>");
                                out.println("<h1>"+e+"</h1>");
                                 out.println("<br>");
                            }
                        }
                    }
                catch (Exception e) {
                     out.println("<br>");
                    out.println("<h1>"+e+"</h1>");
                     out.println("<br>");
     }
%>
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