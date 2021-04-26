<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
</head>
<body>
<h1>Hello <%
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         if( cookies != null ) {
              for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   String name = cookie.getName();
                    if (name.equals("username")) {
                        String username = cookie.getValue();
                        out.println(username);
                        break;
                    }
              }
          }
          else 
          {
                  out.println("ADMIN");
          }
      %> please select the operations listed below </h1><br><br>
<h1> Select below to know your monthly profit  :</h1>
<form action="MonthlyProfit.html">
  <input type="submit" id="monthlyprofit" value="Monthly Profit" />
</form>
<h1> Select here to find the overall Profit  :</h1>
<br>
<form action="ProfitCheck.jsp">
   <input type="submit" id="profitcheck" value="Check Profit" />
</form>
<br>
<h2>To logout click the button below</h2>
      <br>
      <form action="../Login">
          <input type="submit" value="Logout" />
      </form>
</body>
</html>