<%@page import="java.net.URLEncoder"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login : Welcome to School Management System</title>
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <%@include file="vars.jsp"%>
 
    <%@page import="java.sql.*" %>
</head>

<body>
    <%@include file="header.jsp" %>
    <!-- inner banner -->
    <section class="inner-banner py-5">
        <div class="w3l-breadcrumb py-lg-5">
            <div class="container pt-4 pb-sm-4">
                
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>login</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Become a Member</p>
                <h3 class="title-style">Login</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row" align="center">
                 <%
        
        if(request.getParameter("loginbtn")!=null)
        {
            
            String email1,password1;
           
            email1=request.getParameter("email");            
            password1=request.getParameter("password1");
           
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME,PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("select * from usertable where emailid=? and password=SHA(?)");
                    mystatement.setString(1, email1);
                    mystatement.setString(2, password1 + SALT);

                    ResultSet myresult = mystatement.executeQuery();
                    if(myresult.next())
                    {
                        if(myresult.getString("usertype").equals("admin"))
                        {
                             if(request.getParameter("rememberme")!=null)    
                            {
                                    Cookie mycookie = new Cookie("adminname", myresult.getString("name"));
                                    mycookie.setMaxAge(60*60*24*7);
                                    response.addCookie(mycookie);
    
                            }
                            session.setAttribute("adminname", myresult.getString("name"));
                            response.sendRedirect("adminpanel.jsp");
                        }
                        else
                        {
                            if(request.getParameter("rememberme")!=null)    
                            {
                                    Cookie mycookie = new Cookie("uname1", myresult.getString("name"));
                                    mycookie.setMaxAge(60*60*24*7);
                                    response.addCookie(mycookie);
                                    
                                    Cookie mycookie2 = new Cookie("emailid", email1);
                                    mycookie2.setMaxAge(60*60*24*7);
                                    response.addCookie(mycookie2);
    
                            }
      
                            session.setAttribute("name", myresult.getString("name"));
                            session.setAttribute("emailid", email1);
                            response.sendRedirect("welcome.jsp");
                        }
                        
                       
                    }
                    else
                    {
                        out.print("Incorrect username/password");
                    }

                }
                catch(Exception e)
                {
                    out.print("Error in Query due to " + e.getMessage());
                }
            }
            catch(Exception e)
            {
                out.print("Error in Connection due to " + e.getMessage());
            }
                
           
        
        }
        
        
    %>
   
                                  



                                <input type="email" name="email" id="w3lSender" placeholder="Your Email"
                                    class="contact-input" required="" />

                                <input type="password" name="password1" id="w3lSubect" placeholder="password"
                                       class="contact-input" required="" /><br><!-- comment -->
                                <input type="checkbox" class="contact-input" name="rememberme">Stay Signed in
                            </div>
                            </div>
                            <div class="text-start">
                                <button class="btn btn-style btn-style-3" name="loginbtn">Login</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- //contact block -->
  <!-- Js scripts -->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fas fa-level-up-alt" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- //move top -->

    <!-- common jquery plugin -->
    <script src="assets/js/jquery-3.7.0.min.js"></script>
    <!-- //common jquery plugin -->

    <!-- /counter-->
    <script src="assets/js/counter.js"></script>
    <!-- //counter-->

    <!-- theme switch js (light and dark)-->
    <script src="assets/js/theme-change.js"></script>
    <!-- //theme switch js (light and dark)-->

    <!-- MENU-JS -->
    <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!-- //MENU-JS -->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!-- bootstrap -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap -->
    <!-- //Js scripts -->

     <%@include file="footer.jsp" %>
</body>
</html>
    

