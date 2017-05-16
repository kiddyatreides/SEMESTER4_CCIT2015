/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import Config.Database;
import Model.Admin;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Badrus
 */
@WebServlet(name = "Admin_Articles_add", urlPatterns = {"/Admin_Articles_add"})
public class Admin_Articles_add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String CategoryID, Texts, Title, AdminID, Photo;
    
    FileItem flItem = null;
        private void processFormField(FileItem item) 
    {
        if (item.getFieldName().equals("CategoryID")) 
        {
            CategoryID = item.getString();
        } 
        else if (item.getFieldName().equals("Texts")) 
        {
            Texts = item.getString();
        }
        else if (item.getFieldName().equals("Title")) 
        {
            Title = item.getString();
        }
        else if (item.getFieldName().equals("AdminID")) 
        {
            AdminID = item.getString();
        }
        else if (item.getFieldName().equals("Photo")) 
        {
            Title = item.getString();
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) 
                {
                    FileItem fileItem = iter.next();
                    if (fileItem.isFormField()) 
                    {
                        processFormField(fileItem);
                    } 
                    else 
                    {
                        flItem = fileItem;
                    }
                }
                try 
                {
                    Photo = flItem.getName();
                    File savedFile = new File("D:\\Java\\CCIT-WEBS\\Web\\Images\\" + Photo);
                    flItem.write(savedFile);
                }
                catch(Exception e)
                { 
                    out.println(e);
                    System.out.println(e.getMessage());
                }

           Database obj_con = new Database();
           
           Admin b = new Admin();
           b.setCategoryID(CategoryID);
           b.setTitle(Title);
           b.setTexts(Texts);
           b.setAdminID(AdminID);
           b.setPhoto(Photo);
           
           int i = b.doInsertArticles();
           if(i > 0)
           {
                RequestDispatcher rd = request.getRequestDispatcher("Admin-Articles-add.jsp");
                request.setAttribute("return", "Add Articles Success!");
                rd.forward(request, response);
           }
           else
           {
                RequestDispatcher rd = request.getRequestDispatcher("Admin-Articles-add.jsp");
                request.setAttribute("return", "Add Articles Failed!");
                rd.forward(request, response);
           }
        }
        }
        catch (Exception ex) 
        {
            out.println(ex.getCause());
            System.out.println(ex.getMessage());
        } 
            /* TODO output your page here. You may use following sample code. */
            
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
