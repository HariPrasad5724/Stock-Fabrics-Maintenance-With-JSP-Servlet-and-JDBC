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
        out.println("</head>");
        out.println("<body>");
        out.println("<br><h1>Welcome to the Stock Portal</h1>");
        out.println("<form method=post>");
        out.println("<br><h1>Username: <input type=text name=username></h1>");
        out.println("<br><h1>Password: <input type=password name=password></h1>");
        out.println("<br><input type=submit value=login>");
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
        if (username.equals("admin") && password.equals("admin123")) {
            RequestDispatcher rd = req.getRequestDispatcher("./main.jsp");
            rd.forward(req, res);
        } else {
            showLoginForm(req, res);
        }
    }
}