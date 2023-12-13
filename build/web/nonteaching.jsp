<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Non-Teaching Staff : Welcome to School Management System</title>
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
                    <li class="active"><i class="fas fa-angle-right"></i>Add Non-Teaching Staff</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Staff Section</p>
                <h3 class="title-style">Add Non-Teaching Staff</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                <%
                                    if(request.getParameter("savebtn")!=null)
                                    {
                                        String name1,email1,phone,gender1,address,joiningdate,role,department;
                                        name1=request.getParameter("name");
                                        email1=request.getParameter("email");
                                        phone=request.getParameter("phone");
                                        gender1=request.getParameter("gender");
                                        address=request.getParameter("address");
                                     
                                        joiningdate=request.getParameter("joiningdate"); // Corrected variable name
                                        
                                      
                                        department=request.getParameter("department");
                                         role=request.getParameter("role");
                                        String path,place,username,password;
            
                                        try
                                        {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);

                                            try
                                            {
                                                PreparedStatement mystatement = myconnection.prepareStatement("insert into nonteaching(name,email,phone,gender,address,joiningdate,department,role) values(?,?,?,?,?,?,?,?)");
                                                mystatement.setString(1, name1);
                                                mystatement.setString(2, email1);
                                                mystatement.setString(3, phone);
                                                mystatement.setString(4, gender1);
                                                mystatement.setString(5, address); 
                                                mystatement.setString(6, joiningdate); 
                                                
                                                mystatement.setString(7, department); 
                                                  mystatement.setString(8, role);
                                                
                                                if(mystatement.executeUpdate()>0)
                                                {
                                                    out.print("Staff Member Added successfully");
                                                }
                                                else
                                                {
                                                    out.print("Error Occurred. Try again later");
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
                              
            <input type="text" name="name" id="w3lName" placeholder="Name" class="contact-input" required="" />
             <input type="email" name="email" id="w3lEmail" placeholder="Email" class="contact-input" required="" />
            
            <input type="number" name="phone" id="w3lPhone" placeholder="Phone" class="contact-input" required="" />
            
            
           
            
            
            <select name="gender" id="w3lGender" class="contact-input" required="">
                <option value="">Choose Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            
            
            <input type="text" name="address" id="w3lAddress" placeholder="Address" class="contact-input" required="" />
            
            <label for="w3lJoiningDate">Joining Date</label>
            <input type="date" name="joiningdate" id="w3lJoiningDate" class="contact-input" required="" />
            
            
           
            <select name="department" id="w3lDepartment" class="contact-input" required="">
                <option value="">Choose Department</option>
                <option value="Administration">Administration</option>
                <option value="Facilities">Facilities</option>
                <option value="Welfare">Welfare</option>
                <option value="Faculty">Faculty</option>
            </select>
            
           
            <select name="role" id="w3lRole" class="contact-input" required="">
                <option>Choose Role</option>
                <option>Receptionist</option>
                <option>Security Guard</option>
                <option>Clerk</option>
            </select>
        </div>
    </div>
    <div class="text-start">
        <button class="btn btn-style btn-style-3" name="savebtn">Add Staff Member</button>
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
