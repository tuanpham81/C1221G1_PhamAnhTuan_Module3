import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculatorServlet", urlPatterns = "/display-discount")
public class DiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Float.parseFloat(request.getParameter("price"));
        double percent = Float.parseFloat(request.getParameter("percent"));

        double discount_amount = price * percent * 0.01;
        double discount_price = price - discount_amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        writer.println("<p>Discount Amount: " + discount_amount +" VND"+"</p>");
        writer.println("<p>Price after discount: " + discount_price +" VND"+ "</p>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
