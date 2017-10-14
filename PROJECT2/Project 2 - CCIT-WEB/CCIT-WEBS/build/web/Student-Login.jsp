<%-- 
    Document   : Student-Login
    Created on : Apr 6, 2015, 11:50:55 PM
    Author     : Badrus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head id="Head1" runat="server">
    <title>Login Student</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
</head>
<body>
    <form action="User_Login" method="POST" >
    <div class="login">
        <img src="img/bg-login.png"/>
        <div class="content">
            <p>JUST LOGIN</p>
        </div>
        <div class="login-bro">
            
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
                <input type="text" ID="TextBox20" name="Username" class="form-bro login-field" placeholder="NIM" /> 
            </div>
            <div class="form-group">
                <input type="password" name="Password" ID="TextBox21" class="form-bro login-field" placeholder="Password" />
            </div>
                <div class="button">
                    <input type="submit" ID="Button1" class="btn btn-primary btn-lg btn-block" Text="Log in" value="Submit"/>
                </div>
                <div class="button">
                    <a href="Student-Register.jsp"><input:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" Text="Register" OnClick="Button1_Click">REGISTER</input:Button></a>
                </div>
        </div>
        <a href="home.aspx"><div class="back"><p>Back</p></div></a>
    </div>  
    </form>
</html>
