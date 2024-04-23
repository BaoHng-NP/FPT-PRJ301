/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.DAO.MobileDAO;
import Models.Entities.Mobile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baohu
 */
public class AddServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addMobile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mobileId, mobileName, description;
        int yearOfProduction, quantity;
        double price;
        boolean notSale = false;
        String message = "mobile ID existed!!! please try again.";
        try {
            mobileId = request.getParameter("mobileId");
            mobileName = request.getParameter("mobileName");
            description = request.getParameter("description");
            yearOfProduction = Integer.parseInt(request.getParameter("numYear"));
            quantity = Integer.parseInt(request.getParameter("numQuantity"));
            price = Double.parseDouble(request.getParameter("numPrice"));
            String notSaleStr = request.getParameter("chkNotSale");
            if(notSaleStr != null) {
                notSale = true;
            }
            Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
            MobileDAO mobileDAO = new MobileDAO();
            if(mobileDAO.addMobile(mobile) == true) {
                message = "The mobile '"+mobileId+"' has been added successfully";
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }finally{

            request.setAttribute("msg", message);
            request.getRequestDispatcher("addMobile.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
