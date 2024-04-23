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
public class UpdateServlet extends HttpServlet {

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
        
        try {
            String mobileId = request.getParameter("mobileId");
            //get mobile from DB
            MobileDAO dao = new MobileDAO();
            Mobile mobile = dao.getMobileById(mobileId);
            request.setAttribute("mobile", mobile);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher("updateMobile.jsp").forward(request, response);
        }
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
        String message = "Something went wrong!!!";
        try {
            mobileId = request.getParameter("mobileId");
            mobileName = request.getParameter("mobileName");
            description = request.getParameter("description");
            quantity = Integer.parseInt(request.getParameter("numQuantity"));
            yearOfProduction = Integer.parseInt(request.getParameter("numYear"));
            price = Double.parseDouble(request.getParameter("numPrice"));
            String notSaleStr = request.getParameter("chkNotSale");
            if (notSaleStr != null) {
                notSale = true;
            }
            
                Mobile mobile = new Mobile();
                mobile.setMobileId(mobileId);
                mobile.setMobileName(mobileName);
                mobile.setDescription(description);
                mobile.setPrice(price);
                mobile.setYearOfProduction(yearOfProduction);
                mobile.setQuantity(quantity);
                mobile.setNotSale(notSale);
                System.out.println(mobile);
                
                MobileDAO mobileDAO = new MobileDAO();
                if (mobileDAO.updateMobile(mobile) == true) {
                    message = "The user '" + mobileId + "' has been updated successfully";
                }
            
        } catch (Exception e) {
            System.out.println(e);
        } finally {

            request.setAttribute("msg", message);
            request.getRequestDispatcher("updateMobile.jsp").forward(request, response);
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
