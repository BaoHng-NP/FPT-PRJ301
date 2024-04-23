/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.CategoryDAO;
import daos.ProductDAO;
import dtos.CategoryDTO;
import dtos.ProductDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class HomepageController extends HttpServlet {

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
            out.println("<title>Servlet HomepageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomepageController at " + request.getContextPath() + "</h1>");
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
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO cDAO=new CategoryDAO();
        List<CategoryDTO> categories= cDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        String search = request.getParameter("search");
        String cid= request.getParameter("cid");
        if(cid != null && !cid.isEmpty()){
            List<ProductDTO> pizzas = productDAO.getProductByCategories(cid);
            if(pizzas == null || pizzas.isEmpty()){
                request.setAttribute("message", "No product found");
            } else {
                request.setAttribute("pizzas", pizzas);
            }
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }
        
        if(search != null && !search.isEmpty()){
            List<ProductDTO> pizzas = productDAO.searchProductByIdOrNameOrUnitPrice(search);
            if(pizzas == null || pizzas.isEmpty()){
                request.setAttribute("message", "No product found");
            } else {
                request.setAttribute("pizzas", pizzas);
            }
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }
        List<ProductDTO> pizzas = productDAO.getAllProducts();
        if(pizzas == null || pizzas.isEmpty()){
            request.setAttribute("message", "No product found");
        } else {
            request.setAttribute("pizzas", pizzas);
        }

        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
        processRequest(request, response);
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
