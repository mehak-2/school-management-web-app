<!doctype html>
<html lang="en">

<head>
     <title>Fees List: Welcome to School Management System</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="My School Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    
    <!-- //Meta tag Keywords -->

    <!-- Custom-Files -->
    <link href="assets/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Bootstrap-CSS -->
    <link href="assets/css/style.css" rel='stylesheet' type='text/css' />
    <!-- Style-CSS -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //Custom-Files -->
    
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="assets/css/style-starter.css">

    <!-- Web-Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext,vietnamese"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext" rel="stylesheet">
    <!-- //Web-Fonts -->
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
                    <li class="active"><i class="fas fa-angle-right"></i>Add teacher</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Teacher Section</p>
                <h3 class="title-style">Add Teacher</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                
                                  <%
        
        if(request.getParameter("savebtn")!=null)
        {
            
            String name1,email1,gender1,qualification,subject,phone,tid,salary,sclass,s_section;
            name1=request.getParameter("name");
            email1=request.getParameter("emailid");
            tid=request.getParameter("tid");
            gender1=request.getParameter("gender");
            phone = request.getParameter("phone");
            qualification=request.getParameter("qualification");
            subject=request.getParameter("subject");
            salary=request.getParameter("salary");
            sclass=request.getParameter("sclass");
            s_section=request.getParameter("s_section");
            String path,place,username,password;
            
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("insert into teacher(tid,name,emailid,phone,gender,qualification,subject,salary,sclass,section) values(?,?,?,?,?,?,?,?,?,?)");
                    mystatement.setString(1, tid);
                    mystatement.setString(2, name1);
                    mystatement.setString(3, email1);
                    mystatement.setString(4, phone);
                    mystatement.setString(5, gender1);
                    mystatement.setString(6, qualification);
                    mystatement.setString(7, subject);
                    mystatement.setString(8, salary);
                    mystatement.setString(9, sclass);
                    mystatement.setString(10, s_section);
                    if(mystatement.executeUpdate()>0)
                    {
                        out.print("teacher Added successfully");
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
   
                                <input type="number" name="tid" id="w3lName" placeholder="Id"
                                        class="contact-input" required="" />
    
                                    <input type="text" name="name" id="w3lName" placeholder="Name"
                                        class="contact-input" required="" />
                                
                               <input type="number" name="phone" id="w3lName" placeholder="Phone"
                                        class="contact-input" required="" />
                               
                                    <input type="email" name="emailid" id="w3lSender" placeholder="Email"
                                        class="contact-input" required="" />
                                    
                                    <select name="gender" class="contact-input" required="">
                                        <option>Choose Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                    <input type="text" name="qualification" id="w3lSender" placeholder="Qualification"
                                        class="contact-input" required="" />
                                    
                                     <select name="subject" class="contact-input" required="">
                                        <option>Choose subject</option>
                                        <option>science</option>
                                         <option>English</option>
                                           <option>Mathematics</option>
                                             <option>Punjabi</option>  
                                             <option>Hindi</option>
                                               <option>Social Science</option>
                                             
                                    </select>
                                    <input type="number" name="salary" id="w3lSender" placeholder="Salary"
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
                            <button class="btn btn-style btn-style-3" name="savebtn">Add Teacher</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </section>
  
    <!-- //contact block -->
    
    
    <%@include file="footer.jsp" %>
</body>
</html>