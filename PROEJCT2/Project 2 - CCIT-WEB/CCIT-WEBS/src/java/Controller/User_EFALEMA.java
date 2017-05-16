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
@WebServlet(name = "User_EFALEMA", urlPatterns = {"/User_EFALEMA"})
public class User_EFALEMA extends HttpServlet {

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
            String NIM = request.getParameter("NIM");
            String FID = request.getParameter("FID");
            String Question  = request.getParameter("Question");
            String pertanyaan  = request.getParameter("pertanyaan");
            String Critism  = request.getParameter("Critism");
            String Suggestion  = request.getParameter("Suggestion");
            
            System.out.println(NIM+FID+Question+pertanyaan+Critism+Suggestion);
            
            Admin c = new Admin();
            c.setNIM(NIM);
            c.setIDFacultyEfalema(FID);
            c.setQuestion(Question);
            c.setValue(pertanyaan);
            c.setCritism(Critism);
            c.setSuggestion(Suggestion);
                int i = c.addEFALEMAStudent();
                if(i > 0)
                {
                    RequestDispatcher dispatch = request.getRequestDispatcher("Student-EFALEMA-add.jsp");
                    request.setAttribute("status", "Success!");
                    dispatch.forward(request, response);
                }
                else
                {
                    RequestDispatcher dispatch = request.getRequestDispatcher("Student-EFALEMA-add.jsp");
                    request.setAttribute("status", "Failed!");
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
