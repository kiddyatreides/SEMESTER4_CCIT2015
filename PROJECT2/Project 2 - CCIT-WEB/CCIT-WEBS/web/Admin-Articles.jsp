<%-- 
    Document   : Admin-Articles
    Created on : Apr 10, 2015, 1:17:28 AM
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
<body style="overflow:auto;">
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Article Manager</p></span></div>
        <div class="welcome-top">
            <p>Article Manager</p>
            <p>Welcome back Super Admin !</p>
            <nav id="crud-position" class="nav-article">
                <ul>
                    <a title="delete category">
                        <div class="delete-categories" style="position: relative;float:right; margin-top: 60px; margin-right: 300px;">
                        <div class="icon-delete">
                            <button  type="button" ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" style="height: 50px; padding-left: 19px; background-color: rgb(65, 131, 215); margin-top: -46px; position: absolute; margin-left: 190px;" OnClick="Button2_Click"></button>
                        </div>
                        </div>
                    </a>    
                    <li style="margin-top: -45px;  margin-left: 1100px;"><a title="new article" href="Admin-Articles-add.jsp"><div class="icon-submenu-article icon-add"></div></a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
            
                <div class="table-row">
                    <table>
                        <tr>
                            <td>Category</td>
                            <td>Title</td>
                            <td>Date</td>
                            <td>Writter</td>
                            <td>View</td>
                            <td>Photo</td>
                            <td>Action</td>
                        </tr>
                        <%
                                Database Koneksi =  new Database();
                                ResultSet rs = null;
                                String id;
                                try{
                                    Connection kon = Koneksi.Open();
                                    String str = null;
                                    str = "SELECT * FROM Categories.Post INNER JOIN Accounts.Admins ON Categories.Post.AdminID = Accounts.Admins.AdminID INNER JOIN Categories.Category On Categories.Post.CategoryID = Categories.Category.CategoryID";
                                    Statement s = kon.createStatement();
                                    rs = s.executeQuery(str);
                                    while(rs.next())
                                    {
                                        id = rs.getString(1);
                                        out.println("<tr>");
                                        out.println("<td>"+ rs.getString(13)+"</td>");
                                        out.println("<td>"+ rs.getString(5)+"</td>");
                                        out.println("<td>"+ rs.getString(2)+"</td>");
                                        out.println("<td>"+ rs.getString(9)+"</td>");
                                        out.println("<td>"+ rs.getString(4)+"</td>");
                                        out.println("<td>"+ rs.getString(7)+"</td>");
                                        out.print("<td><a href=Delete_Post.jsp?"+id+">Delete Data</td>");
                                        out.println("</tr>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
                                %>
                        <%--<tr>
                            <td><input type="CheckBox" ID="CheckBox2" runat="server" /></td>
                            <td>Berita</td>
                            <td>Cobacoba yuks</td>
                            <td>untuk kelas 3SC4 pada tanggal 31 Desember 2014 di Ruangan OCR1 untuk kelas 3SC4 pada ...</td>
                            <td>2014-12-23 23:50:02.433</td>
                            <td>Fityan Aula</td>
</tr>--%>
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
