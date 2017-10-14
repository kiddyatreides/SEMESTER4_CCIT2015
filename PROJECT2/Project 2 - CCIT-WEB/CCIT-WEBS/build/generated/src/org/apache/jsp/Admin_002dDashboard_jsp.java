package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import Config.Database;

public final class Admin_002dDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("\t<meta charset=\"UTF-8\" />\n");
      out.write("\t<title>Dashboard Super Admin</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/admin.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("\t<script src=\"js/modernizr.custom.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body style=\"overflow:hidden;\">\n");
      out.write("\t<div class=\"container\">\n");
      out.write("\t\t<ul id=\"gn-menu\" class=\"gn-menu-main\">\n");
      out.write("\t\t\t<li class=\"gn-trigger\">\n");
      out.write("\t\t\t\t<a class=\"gn-icon gn-icon-menu\"><span>Menu</span></a>\n");
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
      out.write("                        <li class='welcome'><font style=\"text-transform:uppercase\">\n");
      out.write("                            ");

                        String user = (String)session.getAttribute("uname");
                        if(user != null)
                        {
                            out.println("Hello " + user);
                        }
                        else
                        {
                            response.sendRedirect("Admin-Login.jsp");
                        }
                    
      out.write("\n");
      out.write("                            </font></li>\n");
      out.write("                        <li><a href=''><span>LOGOUT</span></a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("        <div class=\"path\"><span class=\"place-path\"><img src=\"icon/home.png\" /><p>Home / Dashboard</p></span></div>\n");
      out.write("        <div class=\"welcome-top\">\n");
      out.write("            <p>Dashboard</p>\n");
      out.write("            <p>Welcome back Super Admin !</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main clearfix content-center\">\n");
      out.write("\t\t\t<nav id=\"menu\" class=\"nav\">\t\t\t\t\t\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("                        <div class=\"back-image\"></div>\n");
      out.write("                        <div class=\"content\">\n");
      out.write("                            ");

                                Database Ko =  new Database();
                                ResultSet rset = null;
                                String id = (String)session.getAttribute("uname");
                                try{
                                    Connection kon = Ko.Open();
                                    String str4 = null;
                                    str4 = "select * from Accounts.Admins where Username = ?";
                                    PreparedStatement stt = kon.prepareStatement(str4);
                                    
                                    stt.setString(1, id);
                                    
                                    rset = stt.executeQuery();
                                    while(rset.next())
                                    {
                                        out.println("<div class='match-image'><img src='img/"+rset.getString("Photo")+"'/></div>");
                                        out.println("<div class='name' ><font style='text-transform:uppercase'>Welcome back "+rset.getString(2)+"</font></div>");
                                        out.println("<p>please check commentary</p>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                                </li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("                                    <a href=\"Admin-Articles.jsp\">\n");
      out.write("\t\t\t\t\t<div class=\"icon\">\n");
      out.write("                                            <div aria-hidden=\"true\" class=\"icon-article\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                        ");

                                Database Koneksi =  new Database();
                                ResultSet rs = null;
                                try{
                                    Connection kon = Koneksi.Open();
                                    String str = null;
                                    str = "SELECT COUNT(*) FROM Categories.Post";
                                    Statement s = kon.createStatement();
                                    rs = s.executeQuery(str);
                                    while(rs.next())
                                    {
                                        out.println("<span>"+rs.getString(1)+"<br/>Articles</span>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                
      out.write("\n");
      out.write("                                        ");
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li>\n");
      out.write("                                    <a href=\"Admin-Accounts.jsp\">\n");
      out.write("\t\t\t\t\t<div class=\"icon\">\n");
      out.write("                                            <div aria-hidden=\"true\" class=\"icon-user\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                        ");

                                Database Kon =  new Database();
                                ResultSet r = null;
                                try{
                                    Connection kon = Kon.Open();
                                    String str2 = null;
                                    str2 = "SELECT COUNT(*) FROM Accounts.Users";
                                    Statement st = kon.createStatement();
                                    r = st.executeQuery(str2);
                                    while(r.next())
                                    {
                                        out.println("<span>"+r.getString(1)+"<br/>Registered Users</span>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                
      out.write("\n");
      out.write("                                        ");
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a href=\"Admin-EFALEMA.jsp\">\n");
      out.write("\t\t\t\t\t<div class=\"icon\">\n");
      out.write("                                            <div aria-hidden=\"true\" class=\"icon-comment\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                        ");

                                Database Koni =  new Database();
                                ResultSet ra = null;
                                try{
                                    Connection kon = Koni.Open();
                                    String str3 = null;
                                    str3 = "SELECT COUNT(*) FROM Categories.EFALEMA";
                                    Statement sta = kon.createStatement();
                                    ra = sta.executeQuery(str3);
                                    while(ra.next())
                                    {
                                        out.println("<span>"+ra.getString(1)+"<br/>need to confirm</span>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                
      out.write("\n");
      out.write("                                        ");
      out.write("\n");
      out.write("                                    </a>\n");
      out.write("                                </li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</nav>\n");
      out.write("\t\t</div>\n");
      out.write("        <div class=\"statistic\">\n");
      out.write("            <div class=\"main clearfix content-center\">\n");
      out.write("\t\t\t    <nav id=\"submenu\" class=\"nav\">\t\t\t\t\t\n");
      out.write("\t\t\t\t    <ul>\n");
      out.write("\t\t\t\t\t    <li><a title=\"New Category\" href=\"Admin-Categories-add.jsp\"><div class=\"icon-submenu\"><div aria-hidden=\"true\" class=\"icon-category\"></div></div></a></li>\n");
      out.write("\t\t\t\t\t    <li><a title=\"New Article\" href=\"Admin-Articles-add.jsp\"><div class=\"icon-submenu\"><div aria-hidden=\"true\" class=\"icon-diff\"></div></div></a></li>\n");
      out.write("                                            \n");
      out.write("\t\t\t\t    </ul>\n");
      out.write("\t\t\t    </nav>\n");
      out.write("                <nav id=\"submenu-right\" class=\"nav\">\n");
      out.write("                    <ul>\n");
      out.write("                            <li>\n");
      out.write("                                    <a title=\"Setting\" href=\"Admin-Setting.jsp\">\n");
      out.write("\t\t\t\t\t<div class=\"icon-submenu\">\n");
      out.write("                                            <div aria-hidden=\"true\" class=\"icon-setting\"></div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                    </a>\n");
      out.write("                            </li>\n");
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
