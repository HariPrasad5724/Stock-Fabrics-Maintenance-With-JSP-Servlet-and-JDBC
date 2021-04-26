import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

public class Login extends HttpServlet {
    public void showLoginForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Login</title>");
        out.println("<link rel=stylesheet href=https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css>");
        out.println("</head>");
        out.println("<body>");
        out.println("<br><h1>Welcome to the Stock and Bill Maintenance Portal</h1>");
        out.println("<form method=post>");
        out.println("<br><h1>Enter your details below to login!</h1>");
        out.println("<br><h1>Username: <input type=text name=username id=user></h1>");
        out.println("<br><h1>Password: <input type=password name=password id=pwd></h1>");
        out.println("<br><h1><input type=submit value=Login id=login></h1>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        showLoginForm(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Cookie ck = new Cookie("username", username);
        res.addCookie(ck);
        if (password.equals("admin123")) {
            RequestDispatcher rd = req.getRequestDispatcher("./main.jsp");
            rd.forward(req, res);
        } else {
            showLoginForm(req, res);
        }
    }
}