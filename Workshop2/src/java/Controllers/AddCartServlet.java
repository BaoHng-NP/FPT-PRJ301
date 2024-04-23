/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.DAO.MobileDAO;
import Models.Entities.CartItem;
import Models.Entities.Mobile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author baohu
 */
public class AddCartServlet extends HttpServlet {

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
        String url = null;
        String message, mobileId;
        Mobile selectedMobile = null;
        CartItem item = null;
        HashMap<String, CartItem> itemsInCart = null;
        
            MobileDAO mobileDAO = new MobileDAO();
            HttpSession shoppingCart = request.getSession();
            itemsInCart = (HashMap<String, CartItem>) shoppingCart.getAttribute("Cart");
            mobileId = request.getParameter("MobileId");
            Mobile mobile = mobileDAO.getMobileById(mobileId);
            selectedMobile = mobile;
            shoppingCart.setAttribute("initQuantity", mobile.getQuantity());
            if(itemsInCart == null) {
                itemsInCart = new HashMap<String, CartItem>();
                shoppingCart.setAttribute("Cart", itemsInCart);
            }
            item = itemsInCart.get(selectedMobile.getMobileId());
            if(item == null) {
                item = new CartItem(selectedMobile.getMobileId(), selectedMobile.getMobileName(), 1, selectedMobile.getPrice());
                itemsInCart.put(item.getItemId(), item);
                message = "The mobile " + item.getItemName() + " has been added to cart successfully";
                mobileDAO.updateMobileQuantity(mobileId, selectedMobile.getQuantity() - 1);
            }else{
                item.setQuantity(item.getQuantity() + 1);
                message = "The cart has been updated successfully";
                mobileDAO.updateMobileQuantity(mobileId, selectedMobile.getQuantity() - 1);
            }
            
            url = "HomeUser";
            System.out.println(message);
            request.setAttribute("msg", message);
        
            request.getRequestDispatcher(url).forward(request, response);
        
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
            Logger.getLogger(AddCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
