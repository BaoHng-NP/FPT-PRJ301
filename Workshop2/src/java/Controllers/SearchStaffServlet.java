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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baohu
 */
public class SearchStaffServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String searchType = request.getParameter("searchType");
        MobileDAO mobileDAO = new MobileDAO();
        String message = "";
        List<Mobile> mobileList=null;
        if (searchType != null) {
            try {
                if (searchType.equals("id")) {
                    String id = request.getParameter("searchValue");
                    mobileList = mobileDAO.searchID(id);
                    request.setAttribute("listMobile", mobileList);
                    request.setAttribute("value", id);
                } else if (searchType.equals("name")) {
                    // Xử lý tìm kiếm theo tên
                    String name = request.getParameter("searchValue");
                    mobileList = mobileDAO.searchName(name);

                    request.setAttribute("listMobile", mobileList);
                    request.setAttribute("value", name);
                }
                if (mobileList.isEmpty()) {
                    message = "No mobiles found!!";
                    request.setAttribute("msg", message);

                }
            } catch (Exception ex) {
                message = "No mobiles found!!";
                request.setAttribute("msg", message);
                System.out.println("E");
            } finally {
                request.getRequestDispatcher("HomeStaff.jsp").forward(request, response);
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
