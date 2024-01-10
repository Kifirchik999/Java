import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String queryString = req.getQueryString();
        String forwardAddress = getServletContext().getContextPath();
        resp.setCharacterEncoding("Cp1251");
        if (queryString != null) {
            forwardAddress  += "/areacheck?"+queryString;
            resp.sendRedirect(forwardAddress);
//            AreaCheckServlet validate = new AreaCheckServlet(req, resp);
//            validate.validateFields(req);
        }  else {
            String path = "index.jsp";
            ServletContext servletContext = getServletContext();
            RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(path);
            requestDispatcher.forward(req, resp);
//            resp.getWriter().println("<html> " +
//                    "<head> " +
//                    "</head> " +
//                    "<body>" +
//                    "<b>Поля формы не прошли валидацию</b> <a href='index.jsp'>Вернуться к форме</a>" +
//                    "</body>" +
//                    "</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
