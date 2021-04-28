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
      %> please select the operations listed below </h1>
<h1> Add the Customers with requirements here </h1>
<form action="AddCustomer.html">
  <input type="submit" id="addcustomer" value="Add Customer" />
</form>
<h1> Enter the Customer name to be searched  :</h1>
<form action="SearchCustomer.html">
    <input type="submit" id="searchcustomer" value="Search Customer" />
</form>
<br>
<h1> Enter the Customer name to be searched  :</h1>
<form action="CheckReadyCustomer.jsp">
    <input type="submit" id="checkreadycustomer" value="Ready Customer" />
</form>
<br>
<h2>To logout click the button below</h2>
      <br>
      <form action="../Login">
          <input type="submit" value="Logout" />
      </form>
</body>
</html>