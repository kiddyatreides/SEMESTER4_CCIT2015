<%-- 
    Document   : Student-Register
    Created on : Apr 16, 2015, 10:48:18 AM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Add New User</title>
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
        <link rel="stylesheet" type="text/css" href="css/admin.css" />
    </head>
    <body style="overflow:scroll;">
	<div class="container">
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Setting</p></span></div>
        <div class="welcome-top">
            <p>Register</p>
            <p>Register First !</p>
        </div>
        <div class="formcontent">
		<form id="form1" method="POST" action="User_Register" enctype="multipart/form-data">
                <div class="title-of-biodata"><label>Biodata</label><br /><hr /><br /></div>
                <div class="biodata">
                    <label>NIM</label><br />
                    <input type="text" name="NIM" ID="TextBox7" class="form-control" placeholder="NIM" /><br />
                    <label>Password</label><br />
                    <input type="password" name="Password" ID="TextBox8" class="form-control" placeholder="Password" /><br />
                    <label>Photo</label><br />
                    <input type="file" name="Photo"/><br /><br />
                    <input type="Submit"  ID="Button2" class="btn btn-primary btn-lg btn-block position-button2" />
                    <a href="Student-Login.jsp"><input:button type="button"  ID="Button3" class="btn btn-primary btn-lg btn-block position-button3" runat="server" Text="Submit" OnClick="Button2_Click">CANCEL</input:button></a>
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
