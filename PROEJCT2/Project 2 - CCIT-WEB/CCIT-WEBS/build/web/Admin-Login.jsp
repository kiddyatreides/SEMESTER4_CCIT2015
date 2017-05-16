<%-- 
    Document   : Admin-Login
    Created on : Apr 7, 2015, 12:30:49 AM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head runat="server">
    <title>Login Admin</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
</head>
<body>
    <form action="Admin_Login" method="POST">
    <div class="login">
        <img src="img/bg-login.png"/>
        <div class="content">
            <p>JUST LOGIN</p>
        </div>
        <div class="login-form">
            <div class="form-group">
                <table>
                    <td>
                        <%
                                                String result = (String)request.getAttribute("return");
                                                if(result != null){
                                                    out.println(result);
                                                }
                                            %>
                    </td>
                </table>
                <input type="Text" name="Username" ID="TextBox20" class="form-bro login-field" placeholder="Username" />
            </div>
            <div class="form-group">
                <input type="password" name="Password" ID="TextBox21" class="form-bro login-field" placeholder="Password" />
            </div>
                <div class="button">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" Text="Log in" value="LOGIN"/>
                </div>
        </div>
        <a href="Home.jsp"><div class="back"><p>Back</p></div></a>
    </div>
    </form>
</body>
</html>
