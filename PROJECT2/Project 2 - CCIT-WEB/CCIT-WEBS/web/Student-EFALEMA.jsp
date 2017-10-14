<%-- 
    Document   : Student-EFALEMA
    Created on : Apr 14, 2015, 3:33:18 PM
    Author     : Badrus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
	<script src="js/modernizr.custom.js"></script>
    </head>
    <body>
	<div class="container">
		<ul id="gn-menu" class="gn-menu-main">
			<li class="gn-trigger">
				<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav class="gn-menu-wrapper">
					<div class="gn-scroller">
						<ul class="gn-menu">
							<li><a class="gn-icon icon-dashboard" href="Student-Dashboard.jsp">Dashboard</a></li>
                                                        <li><a class="gn-icon icon-category" href="Student-EFALEMA.jsp">EFALEMA</a></li>
                                                        
						</ul>
					</div><!-- /gn-scroller -->
				</nav>
			</li>
                        <li class="welcome">
                            <%
                        String user = (String)session.getAttribute("stud");
                        if(user != null)
                        {
                            out.println("Welcome " + user);
                        }
                        else
                        {
                            response.sendRedirect("Student-Login.jsp");
                        }
                    %>
                        </li>
			<li><a href="#"><span>LOGOUT</span></a></li>
		</ul>
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / EFALEMA Manager</p></span></div>
        <div class="welcome-top">
            <p>Evaluasi Faculty Oleh Mahasiswa(EFALEMA)</p>
            <p>Welcome back !</p>
            <nav id="crud-position" class="nav-article">
               <ul>
                    <a title="delete category">
                        <div class="delete-categories" style="position: relative;float:right; margin-top: 60px; margin-right: 300px;">
                        </div>
                    </a>    
                    <li style="margin-top: -45px;  margin-left: 1100px;"><a title="Add EFALEMA" href="Student-EFALEMA-add.jsp"><div class="icon-submenu-article icon-add"></div></a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <form id="form1" action="Student-EFALEMA-add.jsp">
                <div class="table-row">
                    <table>
                        <tr>
                            <td>ID EFALEMA</td>
                            <td>ID Faculty</td>
                            <td>ID Kelas</td>
                            <td>ID Course</td>
                            <td>Action</td>
                            
                        </tr>
                        <%
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
                                        out.println("<td><input type='submit' value='Fid'/></td>");
                                        out.println("</tr>");
                                        FID=rset.getString(1);
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                %>
                                <td><input type="text" name="FID" value="<%=FID%>" hidden/></td>
                    </table>
                </div>
            </form>
		</div>
        <div class="footer">
            <div class="content-footer">
                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
            </div>
        </div>
	</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
        <script src="js/center-dashboard.js"></script>
	</body>
</html>
