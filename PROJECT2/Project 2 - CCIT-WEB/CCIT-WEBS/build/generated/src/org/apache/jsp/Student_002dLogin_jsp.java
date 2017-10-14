package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Student_002dLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head id=\"Head1\" runat=\"server\">\n");
      out.write("    <title>Login Student</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/login.css\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/font-face.css\" />\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <form action=\"User_Login\" method=\"POST\" >\n");
      out.write("    <div class=\"login\">\n");
      out.write("        <img src=\"img/bg-login.png\"/>\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <p>JUST LOGIN</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"login-bro\">\n");
      out.write("            \n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <table>\n");
      out.write("                <td>\n");
      out.write("                    ");

                                                String result = (String)request.getAttribute("return");
                                                if(result != null){
                                                    out.println(result);
                                                }
                                            
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </table>\n");
      out.write("                <input type=\"text\" ID=\"TextBox20\" name=\"Username\" class=\"form-bro login-field\" placeholder=\"NIM\" /> \n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <input type=\"password\" name=\"Password\" ID=\"TextBox21\" class=\"form-bro login-field\" placeholder=\"Password\" />\n");
      out.write("            </div>\n");
      out.write("                <div class=\"button\">\n");
      out.write("                    <input type=\"submit\" ID=\"Button1\" class=\"btn btn-primary btn-lg btn-block\" Text=\"Log in\" value=\"Submit\"/>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"button\">\n");
      out.write("                    <a href=\"Student-Register.jsp\"><input:Button ID=\"Button1\" class=\"btn btn-primary btn-lg btn-block\" runat=\"server\" Text=\"Register\" OnClick=\"Button1_Click\">REGISTER</input:Button></a>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("        <a href=\"home.aspx\"><div class=\"back\"><p>Back</p></div></a>\n");
      out.write("    </div>  \n");
      out.write("    </form>\n");
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
