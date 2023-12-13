<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Non-Teaching Staff : Welcome to School Management System</title>
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
                    <li class="active"><i class="fas fa-angle-right"></i>Update Teacher</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    
    <%
        String eid;
        String name1="", email1="", phone="", gender1="",   address="",joiningdate="",department="", role="";
        eid = request.getParameter("employeeid");            

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

            try {
                PreparedStatement mystatement = myconnection.prepareStatement("select * from nonteaching where employeeid=?");
                mystatement.setString(1, eid);
                ResultSet myresult = mystatement.executeQuery();

                if (myresult.next()) {                    
                    name1 = myresult.getString("name");
                    email1 = myresult.getString("email");
                    phone = myresult.getString("phone");
                    
                   
                    gender1 = myresult.getString("gender");
                    address = myresult.getString("address");
                   
                    joiningdate = myresult.getString("joiningdate");
                    department= myresult.getString("department");
                    role = myresult.getString("role");
                 
                } else {
                    out.print("Wrong teacher id");
                }

            } catch (Exception e) {
                out.print("Error in Query due to " + e.getMessage());
            }
        } catch (Exception e) {
            out.print("Error in Connection due to " + e.getMessage());
        }
    %>

    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Staff Section</p>
                <h3 class="title-style">Update non-Teaching Staff</h3>
            </div>
            <div class="row contact-block">
               <div class="col-md-6 contact-right">
    <form method="post" class="signin-form">
        <div class="input-grids">
            <div class="row">
                                <%
                                    if (request.getParameter("updatebtn") != null) {
                                        name1 = request.getParameter("name"); 
                                         email1 = request.getParameter("email");
                                         phone = request.getParameter("phone");
                                       
                                       
                                        gender1 = request.getParameter("gender");
                                        address = request.getParameter("address");
                                        
                                        joiningdate = request.getParameter("joiningdate");
                                        
                                        department = request.getParameter("department");
                                        role = request.getParameter("role");
                               
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

                                            try {
                                                PreparedStatement mystatement = myconnection.prepareStatement("update nonteaching set name=?, email=?, phone=?, gender=?, address=?, joiningdate=?, department=?, role=? where employeeid=?");
                                                mystatement.setString(1, name1);
                                               
                                                mystatement.setString(2, phone);
                                                mystatement.setString(3, email1);
                                                mystatement.setString(4, gender1);
                                                mystatement.setString(5, address);
                                                mystatement.setString(6, joiningdate);
                                                mystatement.setString(7, department);
                                                mystatement.setString(8, role);
                                                mystatement.setString(9, eid);

                                                if (mystatement.executeUpdate() > 0) {
                                                    out.print("Staff Member  Updated successfully");
                                                } else {
                                                    out.print("Error Occurred. Try again later");
                                                }
                                            } catch (Exception e) {
                                                out.print("Error in Query due to " + e.getMessage());
                                            }
                                        } catch (Exception e) {
                                            out.print("Error in Connection due to " + e.getMessage());
                                        }
                                    }
                                %>
                                         <label class="col-form-label">Name</label>
                <input type="text" name="name" id="w3lName" placeholder="Name" class="contact-input" required="" value="<%=name1%>" />

                <label class="col-form-label">Email</label>
                <input type="email" name="email" id="w3lSender" placeholder="Email" class="contact-input" required="" value="<%=email1%>" />

               <label class="col-form-label">Phone</label>
<input type="text" name="phone" id="w3lName" placeholder="Phone" class="contact-input" required="" value="<%=phone%>" />

                <label class="col-form-label">Gender</label>
                <select name="gender" class="contact-input" required="">                
                                        <% if(gender1.equals("male"))
                                        {                                         
                                        out.print("<option value='male' selected>Male</option>");
                                        out.print("<option value='female'>Female</option>");
                                        }
                                        else
                                        {
                                        out.print("<option value='male'>Male</option>");
                                        out.print("<option value='female' selected>Female</option>");
                                        }
                                        %>
                </select> 
                <input type="text" name="address" id="w3lSender"  class="contact-input" required="" value="<%=address%>" />

                <label class="col-form-label">department</label>
                <select name="department" required="">
    <option value="Administration" <%= department.equals("Administration") ? "selected" : "" %>>Administration</option>
    <option value="Facilities" <%= department.equals("Facilities") ? "selected" : "" %>>Facilities</option>
    <option value="Welfare" <%= department.equals("Welfare") ? "selected" : "" %>>Welfare</option>
    <option value="Faculty" <%= department.equals("Faculty") ? "selected" : "" %>>Faculty</option>
</select>
                                       
                                     
   <label class="col-form-label">Joining Date</label>
<input type="date" name="joiningdate" id="w3lSender" class="contact-input" required="" value="<%=joiningdate%>" />

                <label class="col-form-label">Role</label>
                <select name="role" class="contact-input" required="">                    
                          
                                       <% if(role.equals("Receptionist"))
                                       {
                                        out.print("<option selected>Receptionist</option>");
                                         out.print("<option>Security Guard</option>");
                                          out.print("<option>Clerk</option>");
                                   
                                       }
                                       else if(role.equals("Security Guard"))
                                       {
                                        out.print("<option>Receptionist</option>");
                                         out.print("<option selected>Security Guard</option>");
                                          out.print("<option>Clerk</option>");
                                          
                                       }
                                       else if(role.equals("Clerk"))
                                       {
                                        out.print("<option>Receptionist</option>");
                                         out.print("<option>Security Guard</option>");
                                          out.print("<option selected>Clerk</option>");
                                       
                                       }
                                       
                                       %>
                                      
                                    </select>
                                    
                      
                            </div>
                        </div>
                        <div class="text-start">
                            <button class="btn btn-style btn-style-3" name="updatebtn">Update Teacher</button>
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
