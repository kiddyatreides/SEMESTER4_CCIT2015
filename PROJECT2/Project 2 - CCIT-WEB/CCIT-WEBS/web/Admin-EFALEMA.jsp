<%-- 
    Document   : Admin-EFALEMA
    Created on : Apr 10, 2015, 1:24:57 AM
    Author     : Badrus
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<title>Article Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
	<script src="js/modernizr.custom.js"></script>
</head>
<body>
    <form id="form1" runat="server">
	<div class="container">
		<ul id="gn-menu" class="gn-menu-main">
			<li class="gn-trigger">
				<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav class="gn-menu-wrapper">
					<div class="gn-scroller">
						<ul class="gn-menu">
							<li><a class="gn-icon icon-dashboard hover-me" href="Admin-Dashboard.jsp">Dashboard</a></li>
                                                        <li><a class="gn-icon icon-category hover-me" href="Admin-Categories.jsp">Categories</a></li>
							<li><a class="gn-icon icon-diff hover-me" href="Admin-Articles.jsp">Articles</a></li>
							<li><a class="gn-icon icon-user hover-me" href="Admin-Accounts.jsp">Accounts</a></li>
                                                        <li><a class="gn-icon icon-comment hover-me" href="Admin-EFALEMA.jsp">EFALEMA</a></li>
                                                        <li><a class="gn-icon icon-setting hover-me" href="Admin-Setting.jsp">Setting</a></li>
						</ul>
					</div><!-- /gn-scroller -->
				</nav>
			</li>
                        <li class='welcome'><font style="text-transform:uppercase">
                            <%
                        String user = (String)session.getAttribute("uname");
                        if(user != null)
                        {
                            out.println("Hello " + user);
                        }
                        else
                        {
                            response.sendRedirect("Admin-Login.jsp");
                        }
                    %>
                            </font></li>
                        <li><a href=''><span>LOGOUT</span></a></li>
		</ul>
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / EFALEMA Manager</p></span></div>
        <div class="welcome-top">
            <p>EFALEMA Manager</p>
            <p>Welcome back Super Admin !</p>
            <nav id="crud-position" class="nav-article">
                <ul>
                    <li><a title="view EFALEMA" style="margin-left: 13px; margin-top: 5px;"><div class="icon-view-on-table icon-view"></div></a></li>
                    <li><a title="new EFALEMA" href="Admin-EFALEMA-add.jsp"><div class="icon-submenu-article icon-comment"></div></a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
                <div class="table-row">
                    <table>
                        <tr>
                            <td>NIM</td>
                            <td>ID Faculty EFALEMA</td>
                            <td>Question</td>
                            <td>Value</td>
                            <td>Criticism</td>
                            <td>Suggestion</td>
                            <td>Action</td>
                        </tr>
                        <%
                                Database Koneksi =  new Database();
                                ResultSet rs = null;
                                String id;
                                try{
                                    
                                    Connection kon = Koneksi.Open();
                                    String str = null;
                                    str = "select * from Categories.EFALEMA";
                                    Statement s = kon.createStatement();
                                    rs = s.executeQuery(str);
                                    while(rs.next())
                                    {
                                        id = rs.getString(1);
                                        out.println("<tr>");
                                        out.println("<td>"+ rs.getString(3)+"</td>");
                                        out.println("<td>"+ rs.getString(1)+"</td>");
                                        out.println("<td>"+ rs.getString(2)+"</td>");
                                        out.println("<td>"+ rs.getString(4)+"</td>");
                                        out.println("<td>"+ rs.getString(5)+"</td>");
                                        out.println("<td>"+ rs.getString(6)+"</td>");
                                        out.println("<td>"+ rs.getString(7)+"</td>");
                                        out.print("<td><a href=Delete_EFALEMA.jsp?"+id+">Delete Data</td>");
                                        out.println("</tr>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                %>
                    </table>
                </div>
		</div>
        <div class="footer">
            <div class="content-footer">
                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
            </div>
        </div>
	</div></form><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
        <script src="js/center-dashboard.js"></script>
	</body>
</html>
