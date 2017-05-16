/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import Model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Badrus
 */
@WebServlet(name = "Admin_Accounts_Register", urlPatterns = {"/Admin_Accounts_Register"})
public class Admin_Accounts_Register extends HttpServlet {

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
            String Name = request.getParameter("Name");
            String PhoneNumber  = request.getParameter("PhoneNumber");
            String Semester  = request.getParameter("Semester");
            String DateOfBirth  = request.getParameter("DateOfBirth");
            String Gender  = request.getParameter("Gender");
            String Address  = request.getParameter("Address");
            String AcademicYear  = request.getParameter("AcademicYear");
            
            Admin c = new Admin();
            c.setName(Name);
            c.setPhoneNumber(PhoneNumber);
            c.setSemester(Semester);
            c.setDate_of_Birth(DateOfBirth);
            c.setGender(Gender);
            c.setAddress(Address);
            c.setAcademic_Year(AcademicYear);
                int i = c.doInsertStudent();
                if(i > 0)
                {
                    RequestDispatcher dispatch = request.getRequestDispatcher("Admin-Accounts-Register.jsp");
                    request.setAttribute("status", "Add New Student Success!");
                    dispatch.forward(request, response);
                }
                else
                {
                    RequestDispatcher dispatch = request.getRequestDispatcher("Admin-Accounts-Register.jsp");
                    request.setAttribute("status", "Add New Studnet Failed!");
                    dispatch.forward(request, response);
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
