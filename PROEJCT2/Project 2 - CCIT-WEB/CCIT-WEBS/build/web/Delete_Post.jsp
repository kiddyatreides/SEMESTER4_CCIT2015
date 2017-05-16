<%-- 
    Document   : Delete_Post
    Created on : Apr 16, 2015, 6:13:53 PM
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
	<title>Category Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
	<script src="js/modernizr.custom.js"></script>
</head>
<body>
    <form method="post" action="Admin_Articles_del" >
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Articles Manager</p></span></div>
        <div class="welcome-top">
            <p>Articles Manager</p>
            <p>Welcome back Super Admin !</p>
            <nav id="crud-posisi" class="nav-article">
                <ul>
                    <a title="delete category">
                        <div class="delete-categories" style="position: relative;float:right; margin-top: 70px; margin-right: 300px;">
                        <div class="icon-delete-a">
                        <input type="Button" ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" style="height: 50px; padding-left: 19px; background-color: rgb(65, 131, 215); margin-top: -46px; position: absolute; margin-left: 220px;" OnClick="Button2_Click" />
                        </div>
                        </div>
                    </a> 
                    <li><a title="new category" href="Admin-Categories-add.jsp"><div class="icon-submenu-article icon-category"></div></a></li>
                </ul>
            </nav>
        </div>
        <div class="row">
                <div class="table-row">
                    <table>
                        <%
                                Database Koneksi =  new Database();
                                ResultSet rs = null;
                                String id ="";
                                id = request.getQueryString();
                                try{
                                    
                                    Connection kon = Koneksi.Open();
                                    String str = null;
                                    str = "select * from Categories.Post";
                                    Statement s = kon.createStatement();
                                    rs = s.executeQuery(str);
                                    while(rs.next())
                                    {
                                        id = rs.getString(1);
                                        
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
            %>
           
            <tr>
                <td colspan="2">Are You sure want to delete?</td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" name="id" value="<%=id%>"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Yes"/></td>
                <td><a href="Admin-Articles.jsp"><input type="submit" value="No"/></a></td>
            </tr>
                        <%--<tr>
                            <td><input type="checkbox" id="check1" runat="server" /></td>
                            <td>C01</td>
                            <td>Berita</td>
                            <td>Tentang Berita</td>
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
    <script>




        $(document).ready(function () {
            $('#rowclick3 tr')
              .filter(':has(:checkbox:checked)')
              .addClass('selected')
              .end()
            .click(function (event) {
                if (event.target.type !== 'checkbox') {
                    $(':checkbox', this).trigger('click');
                }
            })
              .find(':checkbox')
              .click(function (event) {
                  $(this).parents('tr:first').toggleClass('selected');
              });
        });




    </script>
	</body>
</html>
