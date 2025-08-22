package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("username", "Satya");
        RequestDispatcher rd = req.getRequestDispatcher("contact.jsp");
        rd.forward(req, resp);
    }
}

