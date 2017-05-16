<%-- 
    Document   : Admin-Articles-add
    Created on : Apr 10, 2015, 1:18:43 AM
    Author     : Badrus
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Admin"%>
<%@page import="Model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<title>Article Super Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css" />
        <link rel="stylesheet" type="text/css" href="css/login.css" />
        <link rel="stylesheet" type="text/css" href="css/font-face.css" />
        <link rel="stylesheet" type="text/css" href="css/textboxarticle.css" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/froala_editor.min.css" rel="stylesheet" type="text/css">
	<script src="js/modernizr.custom.js"></script>
</head>
<body>
    <form method="POST" action="Admin_Articles_add" enctype="multipart/form-data">
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
        <div class="path"><span class="place-path"><img src="icon/home.png" /><p>Home / Article Manager / New Article</p></span></div>
        <div class="welcome-top">
            <p>New Article
            <%
                                    String result = (String)request.getAttribute("status");
                                    if(result != null)
                                    {
                                        out.println(result);
                                    }
                                %>
            </p>
            <p>Publish your article!</p>
            <nav id="crud-position" class="nav-article">
                <ul>
                    <li><a title="Cancel" href="Admin-Articles.jsp"><div class="icon-submenu-article icon-cancel"></div></a></li>
                    <li>
                        <a title="Publish Article">
                            <div class="icon-publish">
                                <input type="Submit" class="btn btn-primary btn-lg btn-block" style="height: 50px;padding-left: 19px;background-color: rgb(0, 177, 106);" />
                            </div>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="formcontent" style="overflow:auto">
            <div class="title-of-article">
                <input ID="TextBox1" class="form-control" type="text" placeholder="Judul" tabindex="1"  name="Title"/>
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
                                        out.println("<input type='Hidden' name='AdminID' value='"+rset.getString(1)+"'>");
                                    }
                                }
                                catch(Exception ex){
                                    out.println(ex.getMessage());
                                }
            %>
                
            </div>
            <section id="editor" style="margin: 30px;outline: 0px none; width: 850px; background-color: white;">
                <textarea name="Texts" id='edit' tabindex="2" class="form-control" style="margin-top: 30px;">
                </textarea>
            </section>
            <div class="category">
                <td runat="server" style="margin-left: 215px;position: absolute;margin-top: -64px;">
                    <select id='CategoryID' name='CategoryID'>
                        <% 
                        Admin n = new Admin();
                            String CategoryID = "";
                            String Category = "";
                            try
                            {
                                 ArrayList data_client = n.getCategoryIDCombo();
                                 for(int i = 0; i < data_client.size(); i+=2)
                                 {
                                     CategoryID = (String)data_client.get(i);
                                    Category = (String)data_client.get(i+1);
                        %>
                        <option value="<%=CategoryID%>"><%=Category%></option>
                        <%
                                 }

                            }
                            catch(Exception ex){
                                out.println(ex.getMessage());            
                            }

                        %>
                    </select>
                </td>
            </div>
            <br /><br /><div class="add-image" style="margin-left: 913px;"><input name="Photo" type="file" ID="FileUpload" tabindex="4" /></div>
		</div>
        <div class="footer">
            <div class="content-footer">
                <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
            </div>
        </div>
	</div><!-- /container --></form>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/froala_editor.min.js"></script>
        <!--[if lt IE 9]>
        <script src="../js/froala_editor_ie8.min.js"></script>
        <![endif]-->
        <script src="js/plugins/tables.min.js"></script>
        <script src="js/plugins/lists.min.js"></script>
        <script src="js/plugins/colors.min.js"></script>
        <script src="js/plugins/media_manager.min.js"></script>
        <script src="js/plugins/font_family.min.js"></script>
        <script src="js/plugins/font_size.min.js"></script>
        <script src="js/plugins/block_styles.min.js"></script>
        <script src="js/plugins/video.min.js"></script>

        <script>
            $(function () {
                $('#edit')
                .editable({ inlineMode: false })
            });
        </script>
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
	</body>
</html>
