<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Student : Welcome to School Management System</title>
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <%@include file="vars.jsp" %>
    <%@page import="java.sql.*" %>
</head>


<body>
    <%@include file="headeradmin.jsp" %>
    <!-- inner banner -->
    <section class="inner-banner py-5">
        <div class="w3l-breadcrumb py-lg-5">
            <div class="container pt-4 pb-sm-4">
                
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>Add Student</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Student Section</p>
                <h3 class="title-style">Add Student</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                
                                  <%
        if(request.getParameter("savebtn")!=null)
        {
            
            String name1,email1,gender1,fname,mname,phone,rollno,dob,sclass,s_section;
            name1=request.getParameter("name");
            email1=request.getParameter("email");
            rollno=request.getParameter("rollno");
            gender1=request.getParameter("gender");
            phone = request.getParameter("phone");
            dob=request.getParameter("dob");
            mname=request.getParameter("mname");
            fname=request.getParameter("fname");
            sclass=request.getParameter("sclass");
            s_section=request.getParameter("s_section");
            String path,place,username,password;
            
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("insert into student(rollno,name,emailid,phone,gender,fname,mname,dob,sclass,section) values(?,?,?,?,?,?,?,?,?,?)");
                    mystatement.setString(1, rollno);
                    mystatement.setString(2, name1);
                    mystatement.setString(3, email1);
                    mystatement.setString(4, phone);
                    mystatement.setString(5, gender1);
                    mystatement.setString(6, fname);
                    mystatement.setString(7, mname);
                    mystatement.setString(8, dob);
                    mystatement.setString(9, sclass);
                    mystatement.setString(10, s_section);
                    if(mystatement.executeUpdate()>0)
                    {
                        out.print("Student Added successfully");
                    }
                    else
                    {
                        out.print("Error Occured. Try again later");
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
   
                        <input type="number" name="rollno" id="w3lName" placeholder="Roll No"
                                        class="contact-input" required="" />
    
                                    <input type="text" name="name" id="w3lName" placeholder="Name"
                                        class="contact-input" required="" />
                                
                               <input type="number" name="phone" id="w3lName" placeholder="Phone"
                                        class="contact-input" required="" />
                               
                                    <input type="email" name="email" id="w3lSender" placeholder="Email"
                                        class="contact-input" required="" />
                                    
                                    <select name="gender" class="contact-input" required="">
                                        <option>Choose Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                    <input type="text" name="fname" id="w3lSender" placeholder="Father's Name"
                                        class="contact-input" required="" />
                                    <input type="text" name="mname" id="w3lSender" placeholder="Mother's Name"
                                        class="contact-input" required="" />
                                    <input type="date" name="dob" id="w3lSender" placeholder="Date of Birth"
                                        class="contact-input" required="" />
                                    <select name="sclass" class="contact-input" required="">
                                        <option>Choose Class</option>
                                        <option value="1">1st</option>

               <option value="2">2nd</option>
                                         <option value="3">3rd</option>
                                          <option value="4">4th</option>
                                           <option value="5">5th</option>
                                           <option value="6">6th</option>
                                             <option value="7">7th</option>
                                              <option value="8">8th</option>
                                               <option value="9">9th</option>
                                                <option value="10">10th</option>
                                             
                                    </select>
                                       <div id="#answerbox"></div>
                                    <select name="s_section" class="contact-input" required="">
                                        <option>Choose Section</option>
                                        <option>A</option>
                                        <option>B</option>
                                         <option>C</option>
                                          <option>D</option>    
                                    </select>
                           </div>
                        </div>
                       
                        <div class="text-start">
                            <button class="btn btn-style btn-style-3" name="savebtn">Add Student</button>
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
   