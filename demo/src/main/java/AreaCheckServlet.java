import Model.Point;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {
    private Point point;
    private int radius;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private PrintWriter out;

    private ArrayList<Point> data;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        validateFields(req, resp);
    }

    public void validateFields(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        data = new ArrayList<>();
        String x = req.getParameter("x");
        String y = req.getParameter("y");
        String r = req.getParameter("radius");
        try {
            double pointX = Double.parseDouble(x);
            double pointY = Double.parseDouble(y);
            int pointR = Integer.parseInt(r);
            setPoint(new Point(pointX, pointY, pointR));

            final HttpSession session = req.getSession();

            if (session.getAttribute("data") != null) {
                data = (ArrayList<Point>) session.getAttribute("data");
            }
            data.add(getPoint());
            session.setAttribute("data", data);

            setOut(resp.getWriter());

            getOut().println("<html><head>" +
                    "<link rel='stylesheet'     type='text/css' href='css/style.css'>" +
                    "</head><body>" +
                    " <a href='index.jsp' class='btn-back'>back</a>");
            getOut().println("<table class='table' style='margin:0 auto'>" +
                    "<tr><th>X</th><th>Y</th><th>R</th><th>result</th></tr>");

            for (int i = 0; i < data.size(); i++) {
                getOut().println("<tr><td>" + data.get(i).getX() + "</td>");
                getOut().println("<td>" + data.get(i).getY() + "</td>");
                getOut().println("<td>" + data.get(i).getR() + "</td>");
                getOut().println("<td>" + data.get(i).getResult() + "</td></tr>");
            }

            getOut().println("</table>");

            // check x and y zone

            //generateHTML(getResponse());
        } catch (NumberFormatException e) {
            setOut(getResponse().getWriter());
            out.println("<html> " +
                    "<head> " +
                    "</head> " +
                    "<body>" +
                    "<b>Поля формы не прошли валидацию</b> <a href='index.jsp'>Вернуться к форме</a>" +
                    "</body>" +
                    "</html>");
        }
    }


    private boolean checkRadiusArea(Point point) {
        return true;
    }

    private void generateHTML(HttpServletResponse resp) throws IOException {
        PrintWriter outHTML = resp.getWriter();
        outHTML.println(
                "<html><head></head>" +
                        "<body>" +

                        "</body></html>"
        );
    }


    public void setOut(PrintWriter out) {
        this.out = out;
    }

    public PrintWriter getOut() {
        return out;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public int getRadius() {
        return radius;
    }

    public void setPoint(Point point) {
        this.point = point;
    }

    public Point getPoint() {
        return point;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpServletResponse getResponse() {
        return response;
    }


}
