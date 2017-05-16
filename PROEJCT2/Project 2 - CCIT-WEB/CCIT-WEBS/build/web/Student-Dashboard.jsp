<%-- 
    Document   : Student-Dashboard
    Created on : Apr 14, 2015, 3:26:52 PM
    Author     : Badrus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard Student</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
	<script src="js/modernizr.custom.js"></script>
    </head>
    <body style="overflow:hidden;">
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Dashboard</p></span></div>
        <div class="welcome-top">
            <p>Dashboard</p>
            <p>Welcome back !</p>
        </div>
        <div class="main clearfix content-center">
			<nav id="menu" class="nav">					
				<ul>
					<li>
                                            <div class="back-image"></div>
                                            <div class="content">
                                                <%
                                Database Ko =  new Database();
                                ResultSet rset = null;
                                String id = (String)session.getAttribute("stud");
                                try{
                                    Connection kon = Ko.Open();
                                    String str4 = null;
                                    str4 = "select * from Accounts.Users a join Students.Student b on a.NIM = b.NIM where a.NIM = ?";
                                    PreparedStatement stt = kon.prepareStatement(str4);
                                    
                                    stt.setString(1, id);
                                    
                                    rset = stt.executeQuery();
                                    while(rset.next())
                                    {
                                        out.println("<div class='match-image'><img src='Images/"+rset.getString("Photo")+"'/></div>");
                                        out.println("<div class='name' >"+rset.getString(6)+"</div>");
                                        out.println("<p>please check your EFALEMA</p>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                %>
                                                <%--<div class="match-image"><img src="img/618.jpg"/></div>
                                                <div class="name">Badrus Ridho Kurniawan</div>
<p>Welcome back Badrus Ridho Kurniawan,<br /> please check your EFALEMA<br />(Evaluasi Faculty Oleh Mahasiswa).<br/>--%>
                                            </div>
					</li>
					<li>
						<a href="Student-EFALEMA.jsp">
							<div class="icon">
								<div aria-hidden="true" class="icon-article"></div>
							</div>
							<span>EFALEMA</span>
						</a>
					</li>
					<li>
						<a href="Student-Setting.jsp">
							<div class="icon">
								<div aria-hidden="true" class="icon-user"></div>
							</div>
							<span>Edit Biodata</span>
						</a>
					</li>
                    <li>
						<a href="Student-Setting.jsp">
							<div class="icon">
								<div aria-hidden="true" class="icon-comment"></div>
							</div>
							<span>Edit Password</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
        <div class="statistic">
            <div class="main clearfix content-center">
			    <nav id="submenu" class="nav">					
				    <ul>
					    <li><a><div class="icon-submenu">C</div></a></li>
                        <li><a><div class="icon-submenu">C</div></a></li>
                        <li><a><div class="icon-submenu">I</div></a></li>
                        <li><a><div class="icon-submenu">T</div></a></li>
                        <li><a><div class="icon-submenu"></div></a></li>
                        <li><a><div class="icon-submenu"></div></a></li>
                        <li><a><div class="icon-submenu">F</div></a></li>
                        <li><a><div class="icon-submenu">T</div></a></li>
                        <li><a><div class="icon-submenu">U</div></a></li>
                        <li><a><div class="icon-submenu">I</div></a></li>
				    </ul>
			    </nav>
                <nav id="submenu-right" class="nav">
                    <ul>
                        <li>
                            <a title="Setting" href="Student-Setting.jsp">
				<div class="icon-submenu">
                                    <div aria-hidden="true" class="icon-setting"></div>
				</div>
                            </a>
                        </li>
                    </ul>
                </nav>
		</div>
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
