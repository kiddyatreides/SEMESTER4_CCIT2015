<%-- 
    Document   : Artikel
    Created on : Apr 6, 2015, 7:43:22 PM
    Author     : Badrus
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head id="Head1" runat="server">
    <title>News</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/navbar.css" />
    <link rel="stylesheet" type="text/css" href="css/general.css" />
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
    <link rel="stylesheet" type="text/css" href="css/home.css" />
    <link rel="stylesheet" type="text/css" href="css/eventify.css"/>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery-sectionsnap.js" type="text/javascript"></script>
    <script src="js/eventify.js" type="text/javascript"></script>
    <script src="js/moment.js" type="text/javascript"></script>
    	<script type="text/javascript">
    	    var mainheader, yPos, menu, a, b, c, d;
    	    function yScroll() {
    	        menu = document.getElementById('main-nav');
    	        navbar = document.getElementById('nav-bar');
    	        a = document.getElementById('1');
    	        b = document.getElementById('2');
    	        c = document.getElementById('3');
    	        d = document.getElementById('4');
    	        e = document.getElementById('5');
    	        yPos = window.pageYOffset;
    	        if (yPos < 10) {
    	            navbar.style.background = "";
    	            navbar.style.top = "auto";
    	            a.style.background = "";
    	            b.style.background = "";
    	            c.style.background = "";
    	            d.style.background = "";
    	            e.style.background = "";

    	        }
    	        else {
    	            navbar.style.top = "0px";
    	            navbar.style.background = "rgba(0,0,0,0.85)";
    	            a.style.background = "none";
    	            b.style.background = "none";
    	            c.style.background = "none";
    	            d.style.background = "none";
    	            e.style.background = "none";

    	        }
    	    }
    	    window.addEventListener("scroll", yScroll);
	</script>
</head>
<body>
    <div class="container-fluid">
        <div class="section">
            <header id="header">
                <div id="nav-bar">
                             <nav>
			        <ul id="main-nav" class="main-nav pagewidth">
                                    
                                <li id="1"><a href="Home.jsp">Beranda</a></li>
                                
                               
                                
                                <li id="5"><a href="Student-login.aspx">EFALEMA</a></li>
                            </ul> 
                        </nav>
			    </div>
                <div class="social-media"></div>
            </header>
        </div>
        <div class="section">
            <div class="row">
                <div class="news-col-1">
                    <%
                        Database koneksi = new Database();
                        ResultSet rs = null;
                        
                        String PostID = "";
                        String Title = "";
                        String Date = "";
                        String Photo = "";
                        String Texts = "";
                        
                        PostID = request.getQueryString();
                        try{
                            Connection con = koneksi.Open();
                            String str ="select Title, Dates, Photo, Texts From categories.post where PostID = ?";
                            
                            PreparedStatement pr = con.prepareStatement(str);
                            pr.setString(1, PostID);
                            rs = pr.executeQuery();
                            if(rs.next()){
                                //Title = rs.getString("Title");
                                //Date = rs.getString("Date");
                                //Photo = rs.getString("Photo");
                                //Texts = rs.getString("Texts");
                                
                                out.println("<div class='news-title'>");
                                out.println("<div class='news-title-content'>");
                                out.println("<p>"+rs.getString(1)+"</p>");
                                out.println("</div>");
                                out.println("<div class='sub-title'>");
                                out.println("<ul>");
                                out.println("<li class='icon-date'>");
                                out.println("<p>"+rs.getString(2)+"</p>");
                                out.println("</li>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("<div class='news-content'>");
                                out.println("<div class='news-words'>");
                                out.println("<p><a class='ripplelink'><img style='max-width: 380px; max-height: 230px; margin: 5px 15px 0px 0px;' src=Images/"+rs.getString("Photo")+" /></a>"+rs.getString(4)+"</p>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                            pr.close();
                            con.close();
                        }
                        catch(Exception ex){
                            out.println(ex.getMessage());
                        }
                        
                      %>
                    <%--<div class="news-title">
                        <div class='news-title-content'>
                        <p>Judulnya bro !</p>
                        </div>
                        <div class='sub-title'>
                        <ul>
                        <li class='icon-date'>
                        <p>Tanggalnya bro !</p>
                        </li>
                        <li class='icon-time'>
                        <p>Catergory : Waktunya bro !</p>
                        </li>
                        </ul>
                        </div>
                    </div>
                    <div class="news-content">
                        <div class='news-words'>
                        <p><a class='ripplelink'><img style='max-width: 380px; max-height: 230px; margin: 5px 15px 0px 0px;' src=img/CBR.jpg /></a>" + readHtml + "</p>
                        </div>
</div>--%>
                </div>
                <div class="column-2">
                <%--Eventify--%>
                    <div class="event-wrapper"><h2>Event</h2><hr /></div>
                    <div id='ei-events'>
                    <%
                            Database konek = new Database();
                            ResultSet RS = null;
                            try{
                                Connection connect = konek.Open();
                                String str3 = null;
                                str3 = "select top 4 PostID, Dates, CategoryID, SUBSTRING(Texts,0,250)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C02' ORDER BY dates DESC";
                                Statement P = connect.createStatement();
                                RS = P.executeQuery(str3);
                                while(RS.next()){
                                    out.println("<div class='ei-event' data-loc='Depok'>");
                                    out.println("<div class='ei-name'>" + RS.getString(5) + "</div>");
                                    out.println("<div class='ei-description'>"+ RS.getString(4)+"</div>");
                                    out.println("</div>");
                                }
                            }
                            catch(Exception ex){
                                out.println(ex.getMessage());
                            }
                            %>
                            </div>
                    <%--<div id="ei-events">
                        <div class='ei-event' data-loc='Depok'> 04-06-2015
                        <a>Hrefnya dan Post Id bro !
                        <div class='ei-name'>Namanya bro !</div>
                        <div class='ei-description'>Deskripsinya bro !</div>
                        </a>
</div>--%>
                    </div>
                </div>
                <div class="news-col-3">
                    <div class="news" style="margin-top:0px;"><h2>Artikel Lainnya</h2><hr /></div>
                    <%
                            Database kon = new Database();
                            ResultSet R = null;
                            try{
                                Connection C = kon.Open();
                                String stat = null;
                                stat = "select Top 3 PostID, Title, Dates, Photo, SUBSTRING(Texts,0,150)'Texts' From categories.post where CategoryID = 'C01' ORDER BY dates DESC";
                                Statement S = C.createStatement();
                                R = S.executeQuery(stat);
                                while(R.next()){
                                    out.println("<div class='news-article'>");
                                    out.println("<div class='img-article'>");
                                    out.println("<a class='ripplelink' href=Artikel.jsp?" + R.getString("PostID") + ">");
                                    out.println("<img class='hover' src=Images/"+R.getString("Photo")+" />");
                                    out.println("<h3>"+R.getString("Title")+"</h3>");
                                    out.println("</a>");
                                    out.println("</div>");
                                    out.println("</div>");
                                }
                            }
                            catch(Exception ex){
                                
                            }
%>
                    <%--<div class="news-article">
                        <div class="img-article">
                            <a class="ripplelink" href="#">
                                <img class="hover" src=img/CBR.jpg />
                                <h3>Another Article</h3>
                            </a>
                        </div>
                    </div>
                    <div class="news-article">
                        <div class="img-article">
                            <a class="ripplelink" href="#">
                                <img class="hover" src=img/CBR.jpg />
                                <h3>Another Article</h3>
                            </a>
                        </div>
                    </div>--%>
                </div>
	        </div>
            <div class="footer">
                <div class="content-footer">
                    <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
                </div>
            </div>
        </div>
     </div>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/rippleclick.js"></script>
    <script type="text/javascript">
        $("#ei-events").eventify({
            theme: "",
            locale: "en"
        });
    </script>
</body>
</html>
