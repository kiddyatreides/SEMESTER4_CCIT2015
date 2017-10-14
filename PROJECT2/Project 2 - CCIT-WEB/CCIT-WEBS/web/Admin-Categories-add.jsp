<%-- 
    Document   : Admin-Categories-add
    Created on : Apr 10, 2015, 1:21:52 AM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<title>Article Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
	<script src="js/modernizr.custom.js"></script>
</head>
<body style="overflow:auto;">
    <form method="POST" action="Admin_Categories_add">
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Category Manager / New Category</p></span></div>
        <div class="welcome-top">
            <p>New Category
            <%
                                    String result = (String)request.getAttribute("status");
                                    if(result != null)
                                    {
                                        out.println(result);
                                    }
                                %></p>
            <p>What's category?</p>
            <nav id="crud-position" class="nav-article">
                <ul>
                    <li><a title="Cancel" href="Admin-Categories.jsp"><div class="icon-submenu-article icon-cancel"></div></a></li>
                    <li>
                        <a title="Add Category">
                            <div class="icon-publish">
                                <input type="Submit" class="btn btn-primary btn-lg btn-block" style="height: 50px;padding-left: 19px;background-color: rgb(0, 177, 106);" />
                            </div>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="formcontent">
            <div class="title-of-article">
                    <input type="Text" name="Category" style="width: 400px;height: 40px;" class="form-control" placeholder="Category is right here" />
            </div>
            <div class="title-of-article">
                    <input type="Text" name="Descriptions" style="width: 400px;height: 200px;" TextMode="MultiLine" class="form-control" placeholder="What's description?" />
            </div>
		</div>
        <div class="footer">
            <div class="content-footer">
                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
            </div>
        </div>
	</div><!-- /container --></form>
        
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
	</body>
</html>
