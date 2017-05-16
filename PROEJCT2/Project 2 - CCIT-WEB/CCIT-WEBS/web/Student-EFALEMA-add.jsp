<%-- 
    Document   : Student-EFALEMA-add
    Created on : Apr 14, 2015, 3:43:58 PM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       	<title>Account Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
        <script src="js/modernizr.custom.js"></script>
    </head>
    <body style="overflow:auto;">
        <%
            String FID = request.getParameter("FID");
            %>
            <form method="POST" action="User_EFALEMA">
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / EFALEMA Manager / New EFALEMA</p></span></div>
        <div class="welcome-top">
            <p>Evaluasi Faculty Oleh Mahasiswa(EFALEMA)</p>
            <p>Welcome back!</p>
            <nav id="crud-position" class="nav-article">
                <ul>
                    <li><a title="Cancel" href="Student-EFALEMA.jsp"><div class="icon-submenu-article icon-cancel"></div></a></li>
                    <li>
                        <a title="Add EFALEMA">
                            <div class="icon-publish">
                                <input type="button" ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" style="height: 50px;padding-left: 19px;background-color: rgb(0, 177, 106);" />
                            </div>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row">
                <div class="a">
                    <div class="question" style="margin-left: 55px; margin-top: 20px; margin-bottom: 15px;">
                        <p>Question</p>
                        <input type="text" value="<%=user%>" name="NIM" />
                        <input type="text" value="<%=FID%>" name="FID" />
                        <input type="Text" name="Question" ID="TextBox1" class="form-control" placeholder="Your Question here" style="width:300px;height:80px;margin-left: 55px; margin-top: 20px;" /><br />
                        <p>Value :</p>
                            <input type="radio" name="pertanyaan" value="Excellent">Excellent
                            <input type="radio" name="pertanyaan" value="Very Good">Very Good
                            <input type="radio" name="pertanyaan" value="Good">Good
                            <input type="radio" name="pertanyaan" value="Fair">Fair
                            <input type="radio" name="pertanyaan" value="Bad">Bad<br /><br />
                        <label>Kritik</label><br />
                        <input type="Text" name="Critism" ID="TextBox1" class="form-control" placeholder="Your criticism here" style="width:300px;height:80px;margin-left: 55px; margin-top: 20px;" /><br />
                        <label>Saran</label><br />
                        <input type="Text" name="Suggestion" ID="TextBox2" class="form-control" placeholder="Your suggestion here" style="width:300px; height:80px;margin-left: 55px; margin-top: 20px;" /><br /><br />
                        <input type="submit" ID="Button1" class="btn btn-primary btn-lg btn-block" Text="Submit" />
                    </div>
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
