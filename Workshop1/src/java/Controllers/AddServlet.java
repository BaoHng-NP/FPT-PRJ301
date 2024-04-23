/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Car;
import Models.CarsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baohu
 */
public class AddServlet extends HttpServlet {
private final String displayMessagePage = "DisplayMessage.jsp";

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
        String carName, manufacturer;
        int carID, releasedYear;
        double price;
        String message = "Something went wrong.";
        response.setContentType("text/html;charset=UTF-8");
        String url = displayMessagePage;
        try {
            String carIdStr = request.getParameter("txtCarId");
            carID = Integer.parseInt(carIdStr);
            carName = request.getParameter("txtCarName");
            manufacturer = request.getParameter("txtManufacturer");
            String priceStr = request.getParameter("txtPrice");
            price = Double.parseDouble(priceStr);
            String releasedYearStr = request.getParameter("txtReleasedYear");
            releasedYear = Integer.parseInt(releasedYearStr);
            Car car = new Car(carID, carName, manufacturer, price, releasedYear);
            CarsDAO carDAO = new CarsDAO();
            if (carDAO.addCar(car) == true) {
                message = "Car added successfully!";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.setAttribute("action", "Add new car");
            request.setAttribute("page", "HomePage.jsp");
            request.setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
