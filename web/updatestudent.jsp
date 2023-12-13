<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Student : Welcome to School Management System</title>
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
                    <li class="active"><i class="fas fa-angle-right"></i>Update Student</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- //inner banner -->

    
                                  <%
        
                                      
            String sid;
            String name1="",email1="",gender1="",fname="",mname="",phone="",rollno="",dob="",sclass="",s_section="";
            sid=request.getParameter("studentid");            
          
           
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME,PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("select * from student where studentid=?");
                    mystatement.setString(1, sid);
                    

                    ResultSet myresult = mystatement.executeQuery();
                    if(myresult.next())                   
                    {                    
                        name1=myresult.getString("name");        
                        email1=myresult.getString("emailid");
                        rollno=myresult.getString("rollno");
                        gender1=myresult.getString("gender");
                        phone = myresult.getString("phone");
                        dob=myresult.getString("dob");
                        mname=myresult.getString("mname");
                        fname=myresult.getString("fname");
                        sclass=myresult.getString("sclass");
                        s_section=myresult.getString("section");

                    }
                    else
                    {
                        out.print("Wrong student id");
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
                
           
        
        
        
        
    %>
    <!-- contact block -->
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Student Section</p>
                <h3 class="title-style">Update Student</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-6 contact-right">
                    <form method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                
                                  <%
        
        if(request.getParameter("updatebtn")!=null)
        {
            
           
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
                    PreparedStatement mystatement = myconnection.prepareStatement("update student set rollno=?, name=?, "
                    + "emailid=?, phone=?, gender=?, fname=?, mname=?, dob=?, sclass=?, section=? where studentid=?");
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
                    mystatement.setString(11, sid);
                    if(mystatement.executeUpdate()>0)
                    {
                        out.print("Student Updated successfully");
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
                                   <label class="col-form-label">Name</label>
                <input type="text" name="name" id="w3lName" placeholder="Name" class="contact-input" required="" value="<%=name1%>" />
<label class="col-form-label">Roll no</label>
                <input type="number" name="rollno" id="w3lName" placeholder="Rollno" class="contact-input" required="" value="<%=rollno%>" />
                <label class="col-form-label">Phone</label>
                <input type="number" name="phone" id="w3lName" placeholder="Phone" class="contact-input" required="" value="<%=phone%>" />

                <label class="col-form-label">Email</label>
                <input type="email" name="email" id="w3lSender" placeholder="Email" class="contact-input" required="" value="<%=email1%>" />

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
                                  
                <label class="col-form-label">Father's Name</label>
                <input type="text" name="fname" id="w3lSender" placeholder="Father's Name" class="contact-input" required="" value="<%=fname%>" />

                <label class="col-form-label">Mother's Name</label>
                <input type="text" name="mname" id="w3lSender" placeholder="Mother's Name" class="contact-input" required="" value="<%=mname%>" />

                <label class="col-form-label">Date of Birth</label>
                <input type="date" name="dob" id="w3lSender" placeholder="Date of Birth" class="contact-input" required="" value="<%=dob%>" />

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
                            <button class="btn btn-style btn-style-3" name="updatebtn">Update Student</button>
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