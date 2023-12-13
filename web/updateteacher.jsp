<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Teacher : Welcome to School Management System</title>
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
        String tid;
        String name1="", email1="", gender1="", qualification="", salary="", phone="", subject="", sclass="", s_section="";
        tid = request.getParameter("tid");            

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

            try {
                PreparedStatement mystatement = myconnection.prepareStatement("select * from teacher where tid=?");
                mystatement.setString(1, tid);
                ResultSet myresult = mystatement.executeQuery();

                if (myresult.next()) {                    
                    name1 = myresult.getString("name");        
                    email1 = myresult.getString("emailid");
                    phone = myresult.getString("phone");
                    gender1 = myresult.getString("gender");
                    qualification = myresult.getString("qualification");
                    subject = myresult.getString("subject");
                    salary = myresult.getString("salary");
                    sclass = myresult.getString("sclass");
                    s_section = myresult.getString("section");
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
                <p class="text-uppercase">Teacher Section</p>
                <h3 class="title-style">Update Teacher</h3>
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
                                        qualification = request.getParameter("qualification");
                                        subject = request.getParameter("subject");
                                        salary = request.getParameter("salary");
                                        sclass = request.getParameter("sclass");
                                        s_section = request.getParameter("s_section");

                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

                                            try {
                                                PreparedStatement mystatement = myconnection.prepareStatement("update teacher set name=?, emailid=?, phone=?, gender=?, qualification=?, subject=?, salary=?, sclass=?, section=? where tid=?");
                                                mystatement.setString(1, name1);
                                                mystatement.setString(2, email1);
                                                mystatement.setString(3, phone);
                                                mystatement.setString(4, gender1);
                                                mystatement.setString(5, qualification);
                                                mystatement.setString(6, subject);
                                                mystatement.setString(7, salary);
                                                mystatement.setString(8, sclass);
                                                mystatement.setString(9, s_section);
                                                mystatement.setString(10, tid);

                                                if (mystatement.executeUpdate() > 0) {
                                                    out.print("Teacher Updated successfully");
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
                <input type="number" name="phone" id="w3lName" placeholder="Phone" class="contact-input" required="" value="<%=phone%>" />

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
                                     <label class="col-form-label">Qualification</label>
                <input type="text" name="qualification" id="w3lSender" placeholder="Qualification" class="contact-input" required="" value="<%=qualification%>" />

                <label class="col-form-label">Subject</label>
                <select name="subject" class="contact-input" required="">
                                       <%
                                        if(subject.equals("science"))
                                       {
                                        out.print("<option selected>science</option>");
                                         out.print("<option>English</option>");
                                          out.print("<option>Mathematics</option>");
                                           out.print("<option>Punjabi</option>");
                                           out.print("<option>Hindi</option>");
                                           out.print("<option>Social Science</option>");
                                              
                                                 
                                       }
                                       else if(subject.equals("English"))
                                       {
                                      
                                        out.print("<option>science</option>");
                                          out.print("<option selected>English</option>");
                                          out.print("<option>Mathematics</option>");
                                         out.print("<option>Punjabi</option>");
                                          out.print("<option>Hindi</option>");
                                           out.print("<option>Social Science</option>");
                                              
                                       }
                                       else if(subject.equals("Mathematics"))
                                       {
                                          out.print("<option>science</option>");
                                         out.print("<option>English</option>");
                                          out.print("<option selected>Mathematics</option>");
                                           out.print("<option>Punjabi</option>");
                                           out.print("<option>Hindi</option>");
                                           out.print("<option>Social Science</option>");
                                       }
                                       else if(subject.equals("Punjabi"))
                                       {
                                        out.print("<option>science</option>");
                                         out.print("<option>English</option>");
                                          out.print("<option>Mathematics</option>");
                                           out.print("<option selected>Punjabi</option>");
                                           out.print("<option>Hindi</option>");
                                           out.print("<option>Social Science</option>");
                                       }
                                        else if(subject.equals("Hindi"))
                                       {
                                     out.print("<option>science</option>");
                                         out.print("<option>English</option>");
                                          out.print("<option>Mathematics</option>");
                                           out.print("<option>Punjabi</option>");
                                           out.print("<option selected>Hindi</option>");
                                           out.print("<option>Social Science</option>");
                                       }
                                        else if(subject.equals("Social Science"))
                                       { 
                                       out.print("<option>science</option>");
                                         out.print("<option>English</option>");
                                          out.print("<option>Mathematics</option>");
                                           out.print("<option>Punjabi</option>");
                                           out.print("<option>Hindi</option>");
                                           out.print("<option selected>Social Science</option>");
                                       }
                                       %>
                                       </select>
                                       
                                      <label class="col-form-label">Salary</label>
                <input type="number" name="salary" id="w3lSender" placeholder="Salary" class="contact-input" required="" value="<%=salary%>" />

                <label class="col-form-label">Class</label>
                <select name="sclass" class="contact-input" required="">                    
                            <% if(sclass.equals("1"))
                                        {                                         
                                        out.print("<option value='1' selected>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5'>5th</option>");
                                        out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                        }
                                        else if(sclass.equals("2"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2' selected>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5'>5th</option>");
                                   out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                        }
                                         else if(sclass.equals("3"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3' selected>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5'>5th</option>");
                                       out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                        }
                                         else if(sclass.equals("4"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4' selected>4th</option>");
                                        out.print("<option value='5'>5th</option>");
                                       out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                        }
                                         else if(sclass.equals("5"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                       out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                        }
                                        
                                         else if(sclass.equals("6"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                        out.print("<option value='6' selected>6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                       
                                        }
                                        
                                         else if(sclass.equals("7"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                        out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7' selected>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                       
                                        }
                                        
                                         else if(sclass.equals("8"))
                                        {
                                         out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                        out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'selected>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                       
                                        }
                                        
                                        else if(sclass.equals("9"))
                                        {
                                        out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                        out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9' selected>9th</option>");
                                        out.print("<option value='10'>10th</option>");
                                       
                                        }
                                         else if(sclass.equals("10"))
                                         {
                                        out.print("<option value='1'>1st</option>");
                                        out.print("<option value='2'>2nd</option>");
                                        out.print("<option value='3'>3rd</option>");
                                        out.print("<option value='4'>4th</option>");
                                        out.print("<option value='5' selected>5th</option>");
                                        out.print("<option value='6' >6th</option>");
                                        out.print("<option value='7'>7th</option>");
                                        out.print("<option value='8'>8th</option>");
                                        out.print("<option value='9'>9th</option>");
                                        out.print("<option value='10' selected>10th</option>");
                                       
                                        }
                                        %>
                                        
                                    </select>
                                   
                <label class="col-form-label">Section</label>
                <select name="s_section" class="contact-input" required="">
                                       <% if(s_section.equals("A"))
                                       {
                                        out.print("<option selected>A</option>");
                                         out.print("<option>B</option>");
                                          out.print("<option>C</option>");
                                           out.print("<option>D</option>");
                                       }
                                       else if(s_section.equals("B"))
                                       {
                                        out.print("<option>A</option>");
                                         out.print("<option selected>B</option>");
                                          out.print("<option>C</option>");
                                           out.print("<option>D</option>");
                                       }
                                       else if(s_section.equals("C"))
                                       {
                                        out.print("<option>A</option>");
                                         out.print("<option>B</option>");
                                          out.print("<option selected>C</option>");
                                           out.print("<option>D</option>");
                                       }
                                       else if(s_section.equals("D"))
                                       {
                                        out.print("<option>A</option>");
                                         out.print("<option>B</option>");
                                          out.print("<option>C</option>");
                                           out.print("<option selected>D</option>");
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
