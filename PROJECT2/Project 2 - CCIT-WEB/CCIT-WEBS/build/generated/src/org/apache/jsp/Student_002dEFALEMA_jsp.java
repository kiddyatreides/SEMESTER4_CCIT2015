package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import Config.Database;

public final class Student_002dEFALEMA_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" class=\"no-js\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Account Super Admin</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/admin.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("\t<script src=\"js/modernizr.custom.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<ul id=\"gn-menu\" class=\"gn-menu-main\">\n");
      out.write("\t\t\t<li class=\"gn-trigger\">\n");
      out.write("\t\t\t\t<a class=\"gn-icon gn-icon-menu\"><span>Menu</span></a>\n");
      out.write("\t\t\t\t<nav class=\"gn-menu-wrapper\">\n");
      out.write("\t\t\t\t\t<div class=\"gn-scroller\">\n");
      out.write("\t\t\t\t\t\t<ul class=\"gn-menu\">\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"gn-icon icon-dashboard\" href=\"Student-Dashboard.jsp\">Dashboard</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-category\" href=\"Student-EFALEMA.jsp\">EFALEMA</a></li>\n");
      out.write("                                                        \n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div><!-- /gn-scroller -->\n");
      out.write("\t\t\t\t</nav>\n");
      out.write("\t\t\t</li>\n");
      out.write("                        <li class=\"welcome\">\n");
      out.write("                            ");

                        String user = (String)session.getAttribute("stud");
                        if(user != null)
                        {
                            out.println("Welcome " + user);
                        }
                        else
                        {
                            response.sendRedirect("Student-Login.jsp");
                        }
                    
      out.write("\n");
      out.write("                        </li>\n");
      out.write("\t\t\t<li><a href=\"#\"><span>LOGOUT</span></a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("        <div class=\"path\"><span class=\"place-path\"><img src=\"icon/home.png\" /><p>Home / EFALEMA Manager</p></span></div>\n");
      out.write("        <div class=\"welcome-top\">\n");
      out.write("            <p>Evaluasi Faculty Oleh Mahasiswa(EFALEMA)</p>\n");
      out.write("            <p>Welcome back !</p>\n");
      out.write("            <nav id=\"crud-position\" class=\"nav-article\">\n");
      out.write("               <ul>\n");
      out.write("                    <a title=\"delete category\">\n");
      out.write("                        <div class=\"delete-categories\" style=\"position: relative;float:right; margin-top: 60px; margin-right: 300px;\">\n");
      out.write("                        </div>\n");
      out.write("                    </a>    \n");
      out.write("                    <li style=\"margin-top: -45px;  margin-left: 1100px;\"><a title=\"Add EFALEMA\" href=\"Student-EFALEMA-add.jsp\"><div class=\"icon-submenu-article icon-add\"></div></a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <form id=\"form1\" action=\"Student-EFALEMA-add.jsp\">\n");
      out.write("                <div class=\"table-row\">\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>ID EFALEMA</td>\n");
      out.write("                            <td>ID Faculty</td>\n");
      out.write("                            <td>ID Kelas</td>\n");
      out.write("                            <td>ID Course</td>\n");
      out.write("                            <td>Status</td>\n");
      out.write("                            \n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                Database Ko =  new Database();
                                ResultSet rset = null;
                                String id = (String)session.getAttribute("stud");
                                String FID = "";
                                try{
                                    Connection kon = Ko.Open();
                                    String str4 = null;
                                    str4 = "select * from Faculties.EFALEMA where NIM = ?";
                                    PreparedStatement stt = kon.prepareStatement(str4);
                                    
                                    stt.setString(1, id);
                                    
                                    rset = stt.executeQuery();
                                    while(rset.next())
                                    {
                                        out.println("<tr>");
                                        
                                        out.println("<td>"+ rset.getString(1)+"</td>");
                                        out.println("<td>"+ rset.getString(2)+"</td>");
                                        out.println("<td>"+ rset.getString(3)+"</td>");
                                        out.println("<td>"+ rset.getString(4)+"</td>");
                                        out.println("<td>"+ rset.getString(5)+"</td>");
                                        out.println("<td><input type='submit' value='Fid'/></td>");
                                        out.println("</tr>");
                                        FID=rset.getString(2);
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                
      out.write("\n");
      out.write("                                <td><input type=\"text\" name=\"FID\" value=\"");
      out.print(FID);
      out.write("\" hidden/></td>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\t\t</div>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <div class=\"content-footer\">\n");
      out.write("                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\t</div><!-- /container -->\n");
      out.write("\t\t<script src=\"js/classie.js\"></script>\n");
      out.write("\t\t<script src=\"js/gnmenu.js\"></script>\n");
      out.write("\t\t<script>\n");
      out.write("\t\t    new gnMenu(document.getElementById('gn-menu'));\n");
      out.write("\t\t</script>\n");
      out.write("        <script src=\"js/center-dashboard.js\"></script>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
