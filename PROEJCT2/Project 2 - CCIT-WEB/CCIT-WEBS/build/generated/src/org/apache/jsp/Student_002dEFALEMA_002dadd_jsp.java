package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Student_002dEFALEMA_002dadd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" class=\"no-js\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("       \t<title>Account Super Admin</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/admin.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("        <script src=\"js/modernizr.custom.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"overflow:auto;\">\n");
      out.write("        ");

            String FID = request.getParameter("FID");
            
      out.write("\n");
      out.write("            <form method=\"POST\" action=\"User_EFALEMA\">\n");
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
      out.write("        <div class=\"path\"><span class=\"place-path\"><img src=\"icon/home.png\" /><p>Home / EFALEMA Manager / New EFALEMA</p></span></div>\n");
      out.write("        <div class=\"welcome-top\">\n");
      out.write("            <p>Evaluasi Faculty Oleh Mahasiswa(EFALEMA)</p>\n");
      out.write("            <p>Welcome back!</p>\n");
      out.write("            <nav id=\"crud-position\" class=\"nav-article\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a title=\"Cancel\" href=\"Student-EFALEMA.jsp\"><div class=\"icon-submenu-article icon-cancel\"></div></a></li>\n");
      out.write("                    <li>\n");
      out.write("                        <a title=\"Add EFALEMA\">\n");
      out.write("                            <div class=\"icon-publish\">\n");
      out.write("                                <input type=\"button\" ID=\"Button2\" class=\"btn btn-primary btn-lg btn-block\" runat=\"server\" style=\"height: 50px;padding-left: 19px;background-color: rgb(0, 177, 106);\" />\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("                <div class=\"a\">\n");
      out.write("                    <div class=\"question\" style=\"margin-left: 55px; margin-top: 20px; margin-bottom: 15px;\">\n");
      out.write("                        <p>Question</p>\n");
      out.write("                        <input type=\"text\" value=\"");
      out.print(FID);
      out.write("\" name=\"FID\" />\n");
      out.write("                        <input type=\"Text\" name=\"Question\" ID=\"TextBox1\" class=\"form-control\" placeholder=\"Your Question here\" style=\"width:300px;height:80px;margin-left: 55px; margin-top: 20px;\" /><br />\n");
      out.write("                        <p>Value :</p>\n");
      out.write("                            <input type=\"radio\" name=\"pertanyaan\" value=\"Excellent\">Excellent\n");
      out.write("                            <input type=\"radio\" name=\"pertanyaan\" value=\"Very Good\">Very Good\n");
      out.write("                            <input type=\"radio\" name=\"pertanyaan\" value=\"Good\">Good\n");
      out.write("                            <input type=\"radio\" name=\"pertanyaan\" value=\"Fair\">Fair\n");
      out.write("                            <input type=\"radio\" name=\"pertanyaan\" value=\"Bad\">Bad<br /><br />\n");
      out.write("                        <label>Kritik</label><br />\n");
      out.write("                        <input type=\"Text\" name=\"Critism\" ID=\"TextBox1\" class=\"form-control\" placeholder=\"Your criticism here\" style=\"width:300px;height:80px;margin-left: 55px; margin-top: 20px;\" /><br />\n");
      out.write("                        <label>Saran</label><br />\n");
      out.write("                        <input type=\"Text\" name=\"Suggestion\" ID=\"TextBox2\" class=\"form-control\" placeholder=\"Your suggestion here\" style=\"width:300px; height:80px;margin-left: 55px; margin-top: 20px;\" /><br /><br />\n");
      out.write("                        <input type=\"submit\" ID=\"Button1\" class=\"btn btn-primary btn-lg btn-block\" Text=\"Submit\" />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\t\t</div>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <div class=\"content-footer\">\n");
      out.write("                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\t</div></form><!-- /container -->\n");
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
