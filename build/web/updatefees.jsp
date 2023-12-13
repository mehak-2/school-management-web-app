<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>Update Fees: Welcome to School Management System</title>
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
    <%@page import="java.sql.*" %>
    <%@include file="vars.jsp" %>
</head>

<body>
    <%@include file="headeradmin.jsp" %>
    
     <section class="inner-banner py-5">
        <div class="w3l-breadcrumb py-lg-5">
            <div class="container pt-4 pb-sm-4">
                <h4 class="inner-text-title pt-5">Update Fees</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>Student's fees</li>
                </ul>
            </div>
        </div>
    </section>
     <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Fees Section</p>
                <h3 class="title-style"> Update Student Fees Details</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-7 contact-right">
                    <form action="" method="post">
                        <div class="input-grids">
                            <div class="row">
   
                 <%
                 
        String studentid="", rollno="", tamount="", installment1="", installment1_date="", installment2="", installment2_date="", installment3="", installment3_date="", installment4="", installment4_date="", transportation_charges="";
       String uid=request.getParameter("uniqueid");
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
            try{
            PreparedStatement mystatement = myConnection.prepareStatement("select * from fees1 where uniqueid=?");
            mystatement.setString(1, uid);
            ResultSet myresult=mystatement.executeQuery();

            if(myresult.next()){
                studentid=myresult.getString("studentid");
                rollno=myresult.getString("rollno");
                tamount=myresult.getString("total_amount");
                installment1=myresult.getString("installment1");
                installment1_date=myresult.getString("installment1_date");
                installment2=myresult.getString("installment2");
                installment2_date=myresult.getString("installment2_date");
                installment3=myresult.getString("installment3");
                installment3_date=myresult.getString("installment3_date");
                installment4=myresult.getString("installment4");
                installment4_date=myresult.getString("installment4_date");;
                transportation_charges=myresult.getString("tcharges");;
         }
         else{
         out.print("Wrong unique id");
        }
        }catch(Exception e){
            out.print("<label class='col-form-label'>"+"Error in query due to"+e.getMessage()+"</label>");
        }
        }catch(Exception e){
        out.print("<label class='col-form-label'>"+"Error in Connection due to"+e.getMessage()+"</label>");
        } 
    %>
               
                
    
     <%
            if(request.getParameter("update")!=null){
                studentid=request.getParameter("sid");
                rollno=request.getParameter("Rollno");
                tamount=request.getParameter("Tamount");
                installment1=request.getParameter("Installment1");
                installment1_date=request.getParameter("Installment1_date");
                installment2=request.getParameter("Installment2");
                installment2_date=request.getParameter("Installment2_date");
                installment3=request.getParameter("Installment3");
                installment3_date=request.getParameter("Installment3_date");
                installment4=request.getParameter("Installment4");
                installment4_date=request.getParameter("Installment4_date");
                transportation_charges=request.getParameter("tcharges");
              
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                        try{
                            PreparedStatement mystatement = myConnection.prepareStatement("update fees1 set studentid=?, rollno=?, total_amount=?, installment1=?, installment1_date=?, installment2=?, installment2_date=?, installment3=?, installment3_date=?, installment4=?, installment4_date=?,tcharges=? where uniqueid=?");
                            mystatement.setString(1, studentid);
                            mystatement.setString(2, rollno);
                            mystatement.setString(3, tamount);
                            mystatement.setString(4, installment1);
                            mystatement.setString(5, installment1_date);
                            mystatement.setString(6, installment2);
                            mystatement.setString(7, installment2_date);
                            mystatement.setString(8, installment3);
                            mystatement.setString(9, installment3_date);
                            mystatement.setString(10, installment4);
                            mystatement.setString(11, installment4_date);
                            mystatement.setString(12, transportation_charges);
                            mystatement.setString(13, uid);
                            if(mystatement.executeUpdate()>0){
                                out.print("<label class='col-form-label'>Fees updated Succesfully.</label>");
                            }
                            
                        }catch(Exception e){
                            out.print("<label class='col-form-label'>"+"Error in query due to"+e.getMessage()+"</label>");
                        }
                    }catch(Exception e){
                        out.print("<label class='col-form-label'>"+"Error in Connection due to  "+e.getMessage()+"</label>");
                    }   
            }
        %>
                
                       
                   
                <label class="col-form-label">Student ID</label>
                <input type="number" class="form-control" placeholder="Student ID" name="sid" required="" value="<%=studentid%>">
                
                <label class="col-form-label">Roll Number</label>
                <input type="number" class="form-control" placeholder="Roll Number" name="Rollno" required="" value="<%=rollno%>">
                
                <label class="col-form-label">Total Amount</label>
                <input type="number" class="form-control" placeholder="Total Amount" name="Tamount" required="" value="<%=tamount%>">
                
                <label class="col-form-label">Installment 1</label>
                <input type="number" class="form-control" placeholder="Installment 1" name="Installment1" required="" value="<%=installment1%>">
                
                <label class="col-form-label">Installment 1 Date</label>
                <input type="date" class="form-control" placeholder="Installment 1 Date" name="Installment1_date" required="" value="<%=installment1_date%>">
                
                <label class="col-form-label">Installment 2</label>
                <input type="number" class="form-control" placeholder="Installment 2" name="Installment2" required="" value="<%=installment2%>">
                
                <label class="col-form-label">Installment 2 Date</label>
                <input type="date" class="form-control" placeholder="Installment 2 Date" name="Installment2_date" required="" value="<%=installment2_date%>">
                
                <label class="col-form-label">Installment 3</label>
                <input type="number" class="form-control" placeholder="Installment 3" name="Installment3" required="" value="<%=installment3%>">
                
                <label class="col-form-label">Installment 3 Date</label>
                <input type="date" class="form-control" placeholder="Installment 3 Date" name="Installment3_date" required="" value="<%=installment3_date%>">
                
                <label class="col-form-label">Installment 4</label>
                <input type="number" class="form-control" placeholder="Installment 4" name="Installment4" required="" value="<%=installment4%>">
                
                <label class="col-form-label">Installment 4 Date</label>
                <input type="date" class="form-control" placeholder="Installment 4 Date" name="Installment4_date" required="" value="<%=installment4_date%>">
                
                <label class="col-form-label">Transportation Charges</label>
                <input type="number" class="form-control" placeholder="Transportation Charges" name="tcharges" required="" value="<%=transportation_charges%>">
            </div>
    
                    </div>
                    
                    <div class="text-start">
                    <button name="update" class="btn btn-style btn-style-3" >Update Fees</button>
                   </div>
                   
                </form>
       
            </div>
            <!-- //student section -->
        </div>
    </div>
            </section>
    <!-- //inner banner -->

    <%@include file="footer.jsp" %>
  
</body>

</html>