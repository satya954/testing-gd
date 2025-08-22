package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AboutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("username", "Satya");
        RequestDispatcher rd = req.getRequestDispatcher("about.jsp");
        rd.forward(req, resp);
    }
}

