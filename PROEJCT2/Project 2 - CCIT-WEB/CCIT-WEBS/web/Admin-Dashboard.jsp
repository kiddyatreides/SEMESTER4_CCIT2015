<%-- 
    Document   : Admin-Dashboard
    Created on : Apr 10, 2015, 1:24:02 AM
    Author     : Badrus
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<title>Dashboard Super Admin</title>
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Dashboard</p></span></div>
        <div class="welcome-top">
            <p>Dashboard</p>
            <p>Welcome back Super Admin !</p>
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
                                %>
                            <%--<div class="match-image"><img src="img/618.jpg"/></div>
                            <div class="name">BADRUS RIDHO KURNIAWAN</div>
<p>Welcome back BADRUS RIDHO KURNIAWAN,<br /> please check commentary</p>--%>
                        </div>
                                </li>
				<li>
                                    <a href="Admin-Articles.jsp">
					<div class="icon">
                                            <div aria-hidden="true" class="icon-article"></div>
					</div>
                                        <%
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
                                %>
                                        <%--<span>1200<br />Articles</span>--%>
                                    </a>
				</li>
				<li>
                                    <a href="Admin-Accounts.jsp">
					<div class="icon">
                                            <div aria-hidden="true" class="icon-user"></div>
					</div>
                                        <%
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
                                %>
                                        <%--<span>80000<br /> Registered Users</span>--%>
                                    </a>
				</li>
                                <li>
                                    <a href="Admin-EFALEMA.jsp">
					<div class="icon">
                                            <div aria-hidden="true" class="icon-comment"></div>
					</div>
                                        <%
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
                                %>
                                        <%--<span>30<br /> Comments<br />need to confirm</span>--%>
                                    </a>
                                </li>
				</ul>
			</nav>
		</div>
        <div class="statistic">
            <div class="main clearfix content-center">
			    <nav id="submenu" class="nav">					
				    <ul>
					    <li><a title="New Category" href="Admin-Categories-add.jsp"><div class="icon-submenu"><div aria-hidden="true" class="icon-category"></div></div></a></li>
					    <li><a title="New Article" href="Admin-Articles-add.jsp"><div class="icon-submenu"><div aria-hidden="true" class="icon-diff"></div></div></a></li>
                                            
				    </ul>
			    </nav>
                <nav id="submenu-right" class="nav">
                    <ul>
                            <li>
                                    <a title="Setting" href="Admin-Setting.jsp">
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
