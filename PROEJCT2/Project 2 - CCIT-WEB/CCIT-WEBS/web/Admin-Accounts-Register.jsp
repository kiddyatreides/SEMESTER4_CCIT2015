<%-- 
    Document   : Admin-Accounts-Register
    Created on : Apr 16, 2015, 10:38:56 AM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New Student</title>
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
        <link rel="stylesheet" type="text/css" href="css/admin.css" />
    </head>
    <body style="overflow:scroll;">
	<div class="container">
		<ul id="gn-menu" class="gn-menu-main">
			<li class="gn-trigger">
				<a class="gn-icon gn-icon-menu hover-me"><span>Menu</span></a>
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Accounts</p></span></div>
        <div class="welcome-top">
            <p>Add New Student
            <%
                                    String result = (String)request.getAttribute("status");
                                    if(result != null)
                                    {
                                        out.println(result);
                                    }
                                %>
            </p>
            <p>Welcome back Super Admin !</p>
        </div>
        <div class="formcontent">
            <form Method="POST" action="Admin_Accounts_Register">
                <div class="title-of-biodata"><label>Biodata</label><br /><hr /><br /></div>
                <div class="biodata">
                    <label>Name</label><br />
                    <input type="text" name="Name" ID="TextBox8" class="form-control" placeholder="Name" /><br /><br />
                    <label>Phone Number</label><br />
                    <input type="text" name="PhoneNumber" ID="TextBox9" class="form-control" placeholder="Phone Number" /><br /><br />
                    <label>Semester</label><br />
                    <input type="text" name="Semester" ID="TextBox12" class="form-control" placeholder="Semester" /><br /><br />
                    <label>Date of Birth</label><br />
                    <input type="text" name="DateOfBirth" ID="TextBox13" class="form-control" placeholder="Date of Birth" /><br /><br />
                    <label>Gender</label><br /><br />
                    <input type="radio" name="Gender" value="Male">Male
                    <input type="radio" name="Gender" value="Female">Female<br /><br />
                    <label>Address</label><br />
                    <input type="text" name="Address" ID="TextBox10" class="form-control" placeholder="New Address" TextMode="MultiLine" /><br /><br />
                    <label>Academic Year</label><br />
                    <input type="text" name="AcademicYear" ID="TextBox11" class="form-control" placeholder="Academic Year" /><br /><br />
                    <input type="submit"  ID="Button2" class="btn btn-primary btn-lg btn-block position-button2" Text="Submit" Value="Submit"/>
                </div>
            </form>
		</div>
        <div class="footer">
            <div class="content-footer">
                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian   </p>
            </div>
        </div>
	</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
	</body>
</html>
