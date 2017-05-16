package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admin_002dAccounts_002dAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("\t<meta charset=\"UTF-8\" />\n");
      out.write("\t<title>Setting Super Admin</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/admin.css\" />\n");
      out.write("</head>\n");
      out.write("<body style=\"overflow:scroll;\">\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<ul id=\"gn-menu\" class=\"gn-menu-main\">\n");
      out.write("\t\t\t<li class=\"gn-trigger\">\n");
      out.write("\t\t\t\t<a class=\"gn-icon gn-icon-menu hover-me\"><span>Menu</span></a>\n");
      out.write("\t\t\t\t<nav class=\"gn-menu-wrapper\">\n");
      out.write("\t\t\t\t\t<div class=\"gn-scroller\">\n");
      out.write("\t\t\t\t\t\t<ul class=\"gn-menu\">\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"gn-icon icon-dashboard hover-me\" href=\"Admin-Dashboard.jsp\">Dashboard</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-category hover-me\" href=\"Admin-Categories.jsp\">Categories</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"gn-icon icon-diff hover-me\" href=\"Admin-Articles.jsp\">Articles</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"gn-icon icon-user hover-me\" href=\"Admin-Accounts.jsp\">Accounts</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-comment hover-me\" href=\"Admin-EFALEMA.jsp\">EFALEMA</a></li>\n");
      out.write("                                                        <li><a class=\"gn-icon icon-setting hover-me\" href=\"Admin-Setting.jsp\">Setting</a></li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div><!-- /gn-scroller -->\n");
      out.write("\t\t\t\t</nav>\n");
      out.write("\t\t\t</li>\n");
      out.write("                         <li class='welcome'><font style=\"text-transform:uppercase\">Hello Admin</font></li>\n");
      out.write("                         <li><a href=''><span>LOGOUT</span></a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("        <div class=\"path\"><span class=\"place-path\"><img src=\"icon/home.png\" /><p>Home / Account / Add Admin</p></span></div>\n");
      out.write("        <div class=\"welcome-top\">\n");
      out.write("            <p>Setting</p>\n");
      out.write("            <p>Welcome back Super Admin !</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"formcontent-add\">\n");
      out.write("\t\t\t<form id=\"form1\" runat=\"server\">\n");
      out.write("                <div class=\"title-of-biodata\"><label>Biodata</label><br /><hr /><br /></div>\n");
      out.write("                <div class=\"biodata-add\">\n");
      out.write("                    <label>Staff</label><br />\n");
      out.write("                    <select name=\"category\" class=\"form-control\" style=\"height:38px; width:300px;\">\n");
      out.write("                        <option value=\"\">Staff</option>\n");
      out.write("                        <option value=\"C01\">Berita</option>\n");
      out.write("                        <option value=\"C01\">Event</option>\n");
      out.write("                        <option value=\"C01\">Pengumuman</option>\n");
      out.write("                    </select><br />\n");
      out.write("                    <label>Password</label><br />\n");
      out.write("                    <input type=\"TextBox\" ID=\"TextBox12\" runat=\"server\" class=\"form-control\" placeholder=\"Password\" type=\"password\"></input:TextBox><br />\n");
      out.write("                    <label>Confirm Password</label><br />\n");
      out.write("                    <input type=\"TextBox\" ID=\"TextBox13\" runat=\"server\" class=\"form-control\" placeholder=\"Confirm Password\" type=\"password\"></input:TextBox><br /><br />\n");
      out.write("                    <button ID=\"Button2\" class=\"btn btn-primary btn-lg btn-block position-button2\" runat=\"server\" Text=\"Submit\">SUBMIT</button>                    \n");
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
      out.write("        \n");
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
