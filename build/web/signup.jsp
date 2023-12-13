<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup : Welcome to School Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <%@page import="java.sql.*" %>
    <%@include file="vars.jsp"%>
</head>

<body>
    <%@include file="header.jsp" %>
    <section class="inner-banner py-5">
    
        <div class="w3l-breadcrumb py-lg-5">
            <div class="container pt-4 pb-sm-4">
                
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>signup</li>
                </ul>
            </div>
        </div>
 
    </section>

    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Become a Member</p>
                <h3 class="title-style">Signup</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                       
                        <%
                        if(request.getParameter("savebtn")!=null){
                            String name1, email1, gender1, password1, password2;
                            name1=request.getParameter("name");
                            email1=request.getParameter("email");
                            gender1=request.getParameter("gender");
                            password1=request.getParameter("password1");
                            password2=request.getParameter("password2");
                            
                         
                          
                            
                            if(password1.equals(password2)){
                                try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                                    try{
                                        PreparedStatement mystatement = myConnection.prepareStatement("insert into usertable values(?,?,?,SHA(?), ?)");
                                        mystatement.setString(1, name1);
                                        mystatement.setString(2, email1);
                                        mystatement.setString(3, gender1);
                                        mystatement.setString(4, password1 + SALT);
                                        mystatement.setString(5, "user");
                                        if(mystatement.executeUpdate()>0){
                                            out.print("Signup Successfully. Now you can login");
                                        }
                                    } catch(Exception e){
                                        out.print("Error in query due to " + e.getMessage());
                                    } finally {
                                        myConnection.close();
                                    }
                                } catch(Exception e){
                                    out.print("Error in Connection due to " + e.getMessage());
                                }
                            } else {
                                out.print("Password does not match.");
                            }
                        }
                        %>
                      <input type="text" name="name" id="w3lName" placeholder="Your Name"
                                        class="contact-input" required="" />
                                    
                                    <input type="email" name="email" id="email" placeholder="Your Email"
                                        class="contact-input" required="" />
                                    <div id="answerbox"></div>

                                    <select name="gender" class="contact-input">
                                        <option>Choose Gender</option><!-- comment -->
                                        <option value="male">Male</option>
                                           <option value="female">Female</option>
                                        <!-- comment -->
                                    </select>
                             
                                <input type="password" name="password1" id="w3lSubect" placeholder="password"
                                class="contact-input" required="" />
                                
                                  <input type="password" name="password2" id="w3lSubect" placeholder="Confirm password"
                                class="contact-input" required="" />
                                    <div class="text-start">
                            <button class="btn btn-style btn-style-3" name="savebtn">Sign Up</button>
                        </div>
                 
                    </form>
                </div>
            </div>
        </div>
    </section>

    <%@include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#email").blur(function(){
                var email1 = $("#email").val();
                $.ajax({
                    method: "POST",
                    url: "ajax.jsp",  // TODO: Provide the correct URL for the AJAX request
                    data: { email: email1 },
                    success: function(msg){
                        $("#answerbox").html(msg);
                    }
                });
            });
        });
    </script>
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

</body>
</html>
    


