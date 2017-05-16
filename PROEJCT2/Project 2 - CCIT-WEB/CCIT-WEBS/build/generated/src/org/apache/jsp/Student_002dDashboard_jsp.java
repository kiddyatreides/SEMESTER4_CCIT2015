package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Student_002dDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Dashboard Student</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/admin.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("\t<script src=\"js/modernizr.custom.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"overflow:hidden;\">\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<ul id=\"gn-menu\" class=\"gn-menu-main\">\n");
      out.write("\t\t\t<li class=\"gn-trigger\">\n");
      out.write("\t\t\t\t<a class=\"gn-icon gn-icon-menu\"><span>Menu</span></a>\n");
      out.write("\t\t\t\t<nav class=\"gn-menu-wrapper\">\n");
      out.write("\t\t\t\t\t<div class=\"gn-scroller\">\n");
      out.write("\t\t\t\t\t\t<ul class=\"gn-menu\">\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"gn-icon icon-dashboard\" href=\"Student-Dashboard.jsp\">Dashboard</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-category\" href=\"Student-EFALEMA.jsp\">EFALEMA</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-setting\" href=\"Student-Setting.jsp\">Setting</a></li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div><!-- /gn-scroller -->\n");
      out.write("\t\t\t\t</nav>\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li class=\"welcome\">\n");
      out.write("                        ");

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
      out.write("        <div class=\"path\"><span class=\"place-path\"><img src=\"icon/home.png\" /><p>Home / Dashboard</p></span></div>\n");
      out.write("        <div class=\"welcome-top\">\n");
      out.write("            <p>Dashboard</p>\n");
      out.write("            <p>Welcome back !</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main clearfix content-center\">\n");
      out.write("\t\t\t<nav id=\"menu\" class=\"nav\">\t\t\t\t\t\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("                                            <div class=\"back-image\"></div>\n");
      out.write("                                            <div class=\"content\">\n");
      out.write("                                                <div class=\"match-image\"><img src=\"img/618.jpg\"/></div>\n");
      out.write("                                                <div class=\"name\">Badrus Ridho Kurniawan</div>\n");
      out.write("                                                <p>Welcome back Badrus Ridho Kurniawan,<br /> please check your EFALEMA<br />(Evaluasi Faculty Oleh Mahasiswa).<br/>\n");
      out.write("                                            </div>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t<a href=\"Student-EFALEMA.jsp\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"icon\">\n");
      out.write("\t\t\t\t\t\t\t\t<div aria-hidden=\"true\" class=\"icon-article\"></div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<span>EFALEMA</span>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t<a href=\"Student-Setting.jsp\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"icon\">\n");
      out.write("\t\t\t\t\t\t\t\t<div aria-hidden=\"true\" class=\"icon-user\"></div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<span>Edit Biodata</span>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("                    <li>\n");
      out.write("\t\t\t\t\t\t<a href=\"Student-Setting.jsp\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"icon\">\n");
      out.write("\t\t\t\t\t\t\t\t<div aria-hidden=\"true\" class=\"icon-comment\"></div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<span>Edit Password</span>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</nav>\n");
      out.write("\t\t</div>\n");
      out.write("        <div class=\"statistic\">\n");
      out.write("            <div class=\"main clearfix content-center\">\n");
      out.write("\t\t\t    <nav id=\"submenu\" class=\"nav\">\t\t\t\t\t\n");
      out.write("\t\t\t\t    <ul>\n");
      out.write("\t\t\t\t\t    <li><a><div class=\"icon-submenu\">C</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">C</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">I</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">T</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\"></div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\"></div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">F</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">T</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">U</div></a></li>\n");
      out.write("                        <li><a><div class=\"icon-submenu\">I</div></a></li>\n");
      out.write("\t\t\t\t    </ul>\n");
      out.write("\t\t\t    </nav>\n");
      out.write("                <nav id=\"submenu-right\" class=\"nav\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li>\n");
      out.write("                            <a title=\"Setting\" href=\"Student-Setting.jsp\">\n");
      out.write("\t\t\t\t<div class=\"icon-submenu\">\n");
      out.write("                                    <div aria-hidden=\"true\" class=\"icon-setting\"></div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("\t\t</div>\n");
      out.write("        </div>\n");
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
