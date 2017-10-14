<%-- 
    Document   : Home
    Created on : Apr 6, 2015, 11:23:53 PM
    Author     : Badrus
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="css/home.css"/>
    <link rel="stylesheet" type="text/css" href="css/font-face.css" />
    <link rel="stylesheet" type="text/css" href="css/home-nav.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" type="text/css" href="css/navbar.css"/>
    <link rel="stylesheet" type="text/css" href="css/eventify.css"/>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/eventify.js" type="text/javascript"></script>
    <script src="js/moment.js" type="text/javascript"></script>
	<script src="js/jquery-sectionsnap.js" type="text/javascript"></script>
    	<script type="text/javascript">
    	    var mainheader, yPos, menu,a,b,c,d;
    	    function yScroll() {
    	        menu = document.getElementById('main-nav');
    	        navbar = document.getElementById('nav-bar');
    	        a = document.getElementById('1');
    	        b = document.getElementById('2');
    	        c = document.getElementById('3');
    	        d = document.getElementById('4');
    	        e = document.getElementById('5');
    	        yPos = window.pageYOffset;
    	        if (yPos < 300) {
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
    	            navbar.style.background = "rgba(0,0,0,0.7)";
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
<body style="overflow:auto;">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="section">
                <header id="header">
                    <div id="logo"></div>
                    <div id="background"><img src="img/ec.jpg"/></div>
                    <div class="button-readmore" data-content="content-1">
				        <div class="button-content">
                            <a>Scroll down to see more</a>
				        </div>
                    </div>
                    <div id="site-description">
                        <h2><a href="Admin-Login.jsp" style="color:white;cursor:default;text-decoration:none;">C</a>CIT-FTUI</h2>
                        <p> <i>"Preparing World Class IT Professional"</i></p>
                    </div>
                    <div id="nav-bar" class="clearfix">
				        <nav>
					        <ul id="main-nav" class="main-nav pagewidth">
                                                
                                                    <li id="1"><a href="Home.aspx">Beranda</a></li>
                                                    
                                 
                                
                                <li id="5"><a href="Student-Login.jsp">EFALEMA</a></li>
                            </ul> 
				        </nav>
			        </div>
                    <div class="social-media"></div>
                </header>
            </div>
            <div class="section">
                <div class="row">
                    <div class="column-1">
                        <div class="news"><h2>Berita</h2><hr/></div>
                    
                            <%
                            Database koneksi = new Database();
                            ResultSet rs = null;
                            String Postid;
                            try{
                                        Connection con = koneksi.Open();
                                        String str = null;
                                        str = "select top 1 PostID, Dates, CategoryID, SUBSTRING(Texts,0,250)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C01' ORDER BY dates DESC";
                                        Statement pr = con.createStatement();
                                        rs = pr.executeQuery(str);
                                        while(rs.next())
                                        {
                                            Postid = rs.getString("PostID");
                                            out.println("<div class='content-news'>");
                                            out.println("<a class='ripplelink' href='Artikel.jsp?"+ rs.getString("PostID")+"'>");
                                            out.println("<div class='image-news'><img src='Images/"+rs.getString("Photo")+"'/></div>");
                                            out.println("<div class='title-news'><h5>"+ rs.getString(4)+"</h5></div>");
                                            out.println("<div class='date-time-news'>"+ rs.getString("Dates")+"></div>");
                                            out.println("<div class='home-news-content'></div>");
                                            out.println("</a>");
                                            out.println("</div>");
                                        }
                                        pr.close();
                                        con.close();
                            }
                            catch(Exception ex){
                                out.println(ex.getMessage());
                            }
                            %>
                            <%--<a class='ripplelink' href=''>
                        <div class ='image-news'><img src=img/bg10.jpg />Isinya bro ! katanya lu ganteng Mas. Tapi katanya</div>
                        <div class ='title-news'><h3>Judulnya bro !</h3></div>
                        <div class='date-time-news'>Tanggalnya bro !</div>
                        <div class ='home-news-content'>
                        </div>
</a>
                            
                        </div>
                         <div class='content-news'>
                        <a class='ripplelink' href=''>
                        <div class ='image-news'><img src=img/bg17.jpg />Isinya bro ! katanya lu ganteng Mas. Tapi katanya</div>
                        <div class ='title-news'><h3>Judulnya bro !</h3></div>
                        <div class='date-time-news'>Tanggalnya bro !</div>
                        <div class ='home-news-content'>
                        </div>
                        </a>
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
                                <%--<div class='ei-event' data-loc='Depok'> 04-06-2015
                                <a>Hrefnya dan Post Id bro !
                                <div class='ei-name'>Namanya bro !</div>
                                <div class='ei-description'>Deskripsinya bro !</div>
                                </a>
</div>--%>
                            </div>
                    </div>
                    <div class="column-3">
                        <div class="content-col-3">
                            <div class="h2-back-col-3"><h2><a class="ripplelink" href="#">Klik Disini</a></h2></div>
                            <p>Informasi Penerimaan Mahasiswa Baru</p>
                        </div>
                    </div>
                    <div class="column-4">
                        <div class="announce"><h2>Pengumuman</h2><hr/></div>
                            <div class="main clearfix content-center">
                                <nav id="menu" class="nav-article">
                                    <%
                                        Database kon = new Database();
                                        ResultSet R = null;
                                        String PostId;
                                        try{
                                            Connection con = kon.Open();
                                            String str1 = null;
                                            str1 = "select top 4 PostID, Dates, CategoryID, SUBSTRING(Texts,0,320)'Texts', Title, AdminID, Photo from Categories.Post where CategoryID = 'C03' ORDER BY dates DESC";
                                            Statement pr1 = con.createStatement();
                                            R = pr1.executeQuery(str1);
                                            while(R.next()){
                                                PostId = R.getString("PostId");
                                                out.println("<ul>");
                                                out.println("<li>");
                                                out.println("<label style='font-family: Lato; font-size: 20px; color: white;'>"+ R.getString(5) +"</label><br /><br/>");
                                                out.println("<a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;' href=Artikel.jsp?" + R.getString("PostID") + ">");
                                                out.println("<span class='span-announce'>"+ R.getString(4) +"</span>");
                                                out.println("</a>");
                                                out.println("</li>");
                                                out.println("</ul>");
                                            }
                                        }
                                        catch(Exception ex){
                                            out.println(ex.getMessage());
                                        }
                                    %>
                                    <%--<ul>
                                        <li>
                                        <label style='font-family: Lato; font-size: 20px; color: white;'>Judulnya bro !</label>
                                        <a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;'> Hrefnya bro !
                                        <span class='span-announce'>"+readHtml.Substring(0,320)+"</span>
                                        </a>
                                        </li>       
                                    </ul>
                                    <ul>
                                        <li>
                                        <label style='font-family: Lato; font-size: 20px; color: white;'>Judulnya bro !</label>
                                        <a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;'> Hrefnya bro !
                                        <span class='span-announce'>"+readHtml.Substring(0,320)+"</span>
                                        </a>
                                        </li>       
                                    </ul>
                                    <ul>
                                        <li>
                                        <label style='font-family: Lato; font-size: 20px; color: white;'>Judulnya bro !</label>
                                        <a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;'> Hrefnya bro !
                                        <span class='span-announce'>"+readHtml.Substring(0,320)+"</span>
                                        </a>
                                        </li>       
                                    </ul>
                                    <ul>
                                        <li>
                                        <label style='font-family: Lato; font-size: 20px; color: white;'>Judulnya bro !</label>
                                        <a style='font-family: Lato; font-size: 18px; text-align: justify; margin-top: -15px; padding-left: 10px; padding-right: 10px;'> Hrefnya bro !
                                        <span class='span-announce'>"+readHtml.Substring(0,320)+"</span>
                                        </a>
                                        </li>       
</ul>--%>
                                </nav>
                            </div>
                    </div>
	            </div>
                <div class="footer">
                    <div class="content-footer">
                        <p>Hak Cipta @ Badrus Ridho Kurniawan & Muhammad Bima Dwi Septian</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/scroll.js"></script>
    <script src="js/rippleclick.js"></script>
    <script type="text/javascript">
        $("#ei-events").eventify({
            theme: "",
            locale: "en"
        });
    </script>

</body>
</html>
