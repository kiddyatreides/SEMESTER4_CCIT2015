package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import Config.Database;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("   <head runat=\"server\">\n");
      out.write("    <title>Home Page</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/home.css\"/>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/home-nav.css\"/>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/navbar.css\"/>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/eventify.css\"/>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-awesome.min.css\"/>\n");
      out.write("    <script src=\"js/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/eventify.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/moment.js\" type=\"text/javascript\"></script>\n");
      out.write("\t<script src=\"js/jquery-sectionsnap.js\" type=\"text/javascript\"></script>\n");
      out.write("    \t<script type=\"text/javascript\">\n");
      out.write("    \t    var mainheader, yPos, menu,a,b,c,d;\n");
      out.write("    \t    function yScroll() {\n");
      out.write("    \t        menu = document.getElementById('main-nav');\n");
      out.write("    \t        navbar = document.getElementById('nav-bar');\n");
      out.write("    \t        a = document.getElementById('1');\n");
      out.write("    \t        b = document.getElementById('2');\n");
      out.write("    \t        c = document.getElementById('3');\n");
      out.write("    \t        d = document.getElementById('4');\n");
      out.write("    \t        e = document.getElementById('5');\n");
      out.write("    \t        yPos = window.pageYOffset;\n");
      out.write("    \t        if (yPos < 300) {\n");
      out.write("    \t            navbar.style.background = \"\";\n");
      out.write("    \t            navbar.style.top = \"auto\";\n");
      out.write("    \t            a.style.background = \"\";\n");
      out.write("    \t            b.style.background = \"\";\n");
      out.write("    \t            c.style.background = \"\";\n");
      out.write("    \t            d.style.background = \"\";\n");
      out.write("    \t            e.style.background = \"\";\n");
      out.write("\n");
      out.write("    \t        }\n");
      out.write("    \t        else {\n");
      out.write("    \t            navbar.style.top = \"0px\";\n");
      out.write("    \t            navbar.style.background = \"rgba(0,0,0,0.7)\";\n");
      out.write("    \t            a.style.background = \"none\";\n");
      out.write("    \t            b.style.background = \"none\";\n");
      out.write("    \t            c.style.background = \"none\";\n");
      out.write("    \t            d.style.background = \"none\";\n");
      out.write("    \t            e.style.background = \"none\";\n");
      out.write("\n");
      out.write("    \t        }\n");
      out.write("    \t    }\n");
      out.write("    \t    window.addEventListener(\"scroll\", yScroll);\n");
      out.write("\t</script>\n");
      out.write("</head>\n");
      out.write("<body style=\"overflow:auto;\">\n");
      out.write("    <form id=\"form1\" runat=\"server\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"section\">\n");
      out.write("                <header id=\"header\">\n");
      out.write("                    <div id=\"logo\"></div>\n");
      out.write("                    <div id=\"background\"><img src=\"img/ec.jpg\"/></div>\n");
      out.write("                    <div class=\"button-readmore\" data-content=\"content-1\">\n");
      out.write("\t\t\t\t        <div class=\"button-content\">\n");
      out.write("                            <a>Scroll down to see more</a>\n");
      out.write("\t\t\t\t        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"site-description\">\n");
      out.write("                        <h2><a href=\"Admin-Login.jsp\" style=\"color:white;cursor:default;text-decoration:none;\">C</a>CIT-FTUI</h2>\n");
      out.write("                        <p> <i>\"Preparing World Class IT Professional\"</i></p>\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"nav-bar\" class=\"clearfix\">\n");
      out.write("\t\t\t\t        <nav>\n");
      out.write("\t\t\t\t\t        <ul id=\"main-nav\" class=\"main-nav pagewidth\">\n");
      out.write("                                                \n");
      out.write("                                                    <li id=\"1\"><a href=\"Home.aspx\">Beranda</a></li>\n");
      out.write("                                                    \n");
      out.write("                                 \n");
      out.write("                                \n");
      out.write("                                <li id=\"5\"><a href=\"Student-Login.jsp\">EFALEMA</a></li>\n");
      out.write("                            </ul> \n");
      out.write("\t\t\t\t        </nav>\n");
      out.write("\t\t\t        </div>\n");
      out.write("                    <div class=\"social-media\"></div>\n");
      out.write("                </header>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"section\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"column-1\">\n");
      out.write("                        <div class=\"news\"><h2>Berita</h2><hr/></div>\n");
      out.write("                    \n");
      out.write("                            ");

                            Database koneksi = new Database();
                            ResultSet rs = null;
                            String Postid;
                            try{
                                        Connection con = koneksi.Open();
                                        String str = null;
                                        str = "select top 1 PostID, Dates, CategoryID, SUBSTRING(Texts,0,250)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C01' ORDER BY dates DESC";
                                        Statement pr = con.createStatement();
                                        rs = pr.executeQuery(str);
                                        while(rs.next())
                                        {
                                            Postid = rs.getString("PostID");
                                            out.println("<div class='content-news'>");
                                            out.println("<a class='ripplelink' href='Artikel.jsp?"+ rs.getString("PostID")+"'>");
                                            out.println("<div class='image-news'><img src='Images/"+rs.getString("Photo")+"'/></div>");
                                            out.println("<div class='title-news'><h5>"+ rs.getString(4)+"</h5></div>");
                                            out.println("<div class='date-time-news'>"+ rs.getString("Dates")+"></div>");
                                            out.println("<div class='home-news-content'></div>");
                                            out.println("</a>");
                                            out.println("</div>");
                                        }
                                        pr.close();
                                        con.close();
                            }
                            catch(Exception ex){
                                out.println(ex.getMessage());
                            }
                            
      out.write("\n");
      out.write("                            ");
      out.write("\n");
      out.write("                  \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"column-2\">\n");
      out.write("                        ");
      out.write("\n");
      out.write("                        <div class=\"event-wrapper\"><h2>Event</h2><hr /></div>\n");
      out.write("                            <div id='ei-events'>\n");
      out.write("                                ");

                            Database konek = new Database();
                            ResultSet RS = null;
                            try{
                                Connection connect = konek.Open();
                                String str3 = null;
                                str3 = "select top 4 PostID, Dates, CategoryID, SUBSTRING(Texts,0,250)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C02' ORDER BY dates DESC";
                                Statement P = connect.createStatement();
                                RS = P.executeQuery(str3);
                                while(RS.next()){
                                    out.println("<div class='ei-event' data-loc='Depok'>");
                                    out.println("<div class='ei-name'>" + RS.getString(5) + "</div>");
                                    out.println("<div class='ei-description'>"+ RS.getString(4)+"</div>");
                                    out.println("</div>");
                                }
                            }
                            catch(Exception ex){
                                out.println(ex.getMessage());
                            }
                            
      out.write("\n");
      out.write("                                ");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"column-3\">\n");
      out.write("                        <div class=\"content-col-3\">\n");
      out.write("                            <div class=\"h2-back-col-3\"><h2><a class=\"ripplelink\" href=\"#\">Klik Disini</a></h2></div>\n");
      out.write("                            <p>Informasi Penerimaan Mahasiswa Baru</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"column-4\">\n");
      out.write("                        <div class=\"announce\"><h2>Pengumuman</h2><hr/></div>\n");
      out.write("                            <div class=\"main clearfix content-center\">\n");
      out.write("                                <nav id=\"menu\" class=\"nav-article\">\n");
      out.write("                                    ");

                                        Database kon = new Database();
                                        ResultSet R = null;
                                        String PostId;
                                        try{
                                            Connection con = kon.Open();
                                            String str1 = null;
                                            str1 = "select top 4 PostID, Dates, CategoryID, SUBSTRING(Texts,0,320)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C03' ORDER BY dates DESC";
                                            Statement pr1 = con.createStatement();
                                            R = pr1.executeQuery(str1);
                                            while(R.next()){
                                                PostId = R.getString("PostId");
                                                out.println("<ul>");
                                                out.println("<li>");
                                                out.println("<label style='font-family: Lato; font-size: 20px; color: white;'>"+ R.getString(5) +"</label><br /><br/>");
                                                out.println("<a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;' href=Artikel.jsp?" + R.getString("PostID") + ">");
                                                out.println("<span class='span-announce'>"+ R.getString(4) +"</span>");
                                                out.println("</a>");
                                                out.println("</li>");
                                                out.println("</ul>");
                                            }
                                        }
                                        catch(Exception ex){
                                            out.println(ex.getMessage());
                                        }
                                    
      out.write("\n");
      out.write("                                    ");
      out.write("\n");
      out.write("                                </nav>\n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("\t            </div>\n");
      out.write("                <div class=\"footer\">\n");
      out.write("                    <div class=\"content-footer\">\n");
      out.write("                        <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("    <script src=\"js/jquery-2.1.1.min.js\"></script>\n");
      out.write("    <script src=\"js/scroll.js\"></script>\n");
      out.write("    <script src=\"js/rippleclick.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        $(\"#ei-events\").eventify({\n");
      out.write("            theme: \"\",\n");
      out.write("            locale: \"en\"\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("</body>\n");
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
