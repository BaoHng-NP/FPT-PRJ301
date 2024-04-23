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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author baohu
 */
public class UpdateCartServlet extends HttpServlet {

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
        String action=request.getParameter("action");
        MobileDAO dao=new MobileDAO();
        if(action.equals("Update")){
        
        String url = null;
        String message, itemId;
        int newQuantity, initQuantity;
        CartItem item = null;
        HashMap<String, CartItem> cart = null;

        try{
            itemId = request.getParameter("ItemId");
            Mobile m=dao.getMobileById(itemId);

            initQuantity = Integer.parseInt(request.getParameter("currentQuantity"));
            newQuantity = Integer.parseInt(request.getParameter("quantity"));
            if((m.getQuantity()+initQuantity)-newQuantity>=0){
            if(itemId != null) {
                HttpSession sessionCart = request.getSession();
                cart = (HashMap<String, CartItem>) sessionCart.getAttribute("Cart");
                item = cart.get(itemId);
                item.setQuantity(newQuantity);
                MobileDAO mobileDAO = new MobileDAO();
                Mobile selectedMobile = mobileDAO.getMobileById(itemId);
                mobileDAO.updateMobileQuantity(item.getItemId(), (initQuantity+m.getQuantity())-item.getQuantity());
                message = "Your cart has been updated successfully";
                request.setAttribute("msg", message);
                url = "ViewCart";
            }}
            else{
                message="NOOOOO";
               request.setAttribute("msg2", message);
                url = "ViewCart"; 
            }
        }catch(Exception e) {
            log("Update Controller has error:" + e.getMessage());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    else{
    String url = null;
        String itemId, message;
        HashMap<String, CartItem> cart = null;
        int initQuantity; //biến dùng để set up lại quantity ban đầu
        try{
            itemId = request.getParameter("ItemId");
            Mobile m=dao.getMobileById(itemId);
            initQuantity = Integer.parseInt(request.getParameter("currentQuantity"));
            if(itemId != null) {
                HttpSession sessionCart = request.getSession();
                cart = (HashMap<String, CartItem>) sessionCart.getAttribute("Cart");
                cart.remove(itemId);
                
                //update quantity
                MobileDAO mobileDAO = new MobileDAO();
                mobileDAO.updateMobileQuantity(itemId, (initQuantity+m.getQuantity()));
                
                message = "The mobile "+itemId+" has been removed successfully";
                request.setAttribute("msg", message);
                url = "ViewCart";
            }
        }catch(Exception e) {
            log("RemoveCartController has error: "+ e.getMessage());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
