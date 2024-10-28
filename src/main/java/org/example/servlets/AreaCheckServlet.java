package org.example.servlets;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.Data;
import org.example.hitChecker.CheckHit;
import org.example.models.Point;
import org.example.models.PointCheckResult;
import org.example.validator.Validate;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    @Inject
    private PointCheckResult pointCheckResult;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long time = System.nanoTime();

        try {
            Data data = (Data) request.getAttribute("data");

            if (data == null) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, String.format("403: %s", "FORBIDDEN"));
            } else {
                double x = toDouble(data.getX());
                double y = toDouble(data.getY());
                double r = toDouble(data.getR());
                String inpType = data.getInpType();
                Validate valid = new Validate();
                boolean validationRes = false;
                if (inpType.equals("click")) {
                    validationRes = valid.checkMouse(x, y, r);
                } else if (inpType.equals("form")) {
                    validationRes = valid.checkForm(x, y, r);
                }

                if (!validationRes) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, String.format("400: %s", "COORDS VALIDATION ERROR"));
                } else {
                    CheckHit checker = new CheckHit();
                    boolean isHit = checker.hit(x, y, r);

                    Point point = new Point(x, y, r, isHit, time);
                    pointCheckResult.addInput(point);
                    request.getSession().setAttribute("pointCheckResult", pointCheckResult);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, String.format("400: %s", "JSON PARSING ERROR"));
        }

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private double toDouble(double n) {
        BigDecimal bd = new BigDecimal(n).setScale(1, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}