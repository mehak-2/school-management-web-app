<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>Fees : Welcome to School Management System</title>
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
                
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>student's fees</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- inner banner -->
    
    <section class="w3l-contact py-5" id="contact">
        <div class="container py-md-5 py-4">
            <div class="title-main text-center mx-auto mb-md-5 mb-4" style="max-width:500px;">
                <p class="text-uppercase">Fees Section</p>
                <h3 class="title-style">student Fees Details</h3>
            </div>
            <div class="row contact-block">
                <div class="col-md-7 contact-right">
                    <form action="" method="post" class="signin-form">
                        <div class="input-grids">
                            <div class="row">
                                 <%
            if(request.getParameter("submit")!=null || request.getParameter("rollno")!=null){
                String studentid, rollno, tamount, installment1, installment1_date, installment2, installment2_date, installment3, installment3_date, installment4, installment4_date, transportation_charges;
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
                            PreparedStatement mystatement = myConnection.prepareStatement("insert into fees1 (`studentid`, `rollno`, `total_amount`, `installment1`, `installment1_date`, `installment2`, `installment2_date`, `installment3`, `installment3_date`, `installment4`, `installment4_date`, `tcharges`, `remaining_amt`) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
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
                            mystatement.setString(12,transportation_charges);
                            mystatement.setString(13, tamount); 
                            
                            if(mystatement.executeUpdate()>0){
                                out.print("Fees added Succesfully.");
                            }
                            
                        }catch(Exception e){
                            out.print("Error in query due to"+e.getMessage());
                        }
                    }catch(Exception e){
                        out.print("Error in Connection due to  "+e.getMessage());
                    }   
            }
        %>
        <form>
                        
                        <select name="sid">
                            <option>Choose Student Id</option>
                        <%
                                try{
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                                    try{
                                    PreparedStatement mystatement = myConnection.prepareStatement("select studentid from student");
                          
                                    ResultSet myresult=mystatement.executeQuery();

                                    if(myresult.next()){
                                    do{
                                        out.print("<option>" + myresult.getString("studentid")+ "</option>");
                                    }while(myresult.next());
                                 }
                                 else{
                                 out.print("<option>No Student Available</option>");
                                }
                                }catch(Exception e){
                                    out.print("Error in query due to"+e.getMessage());
                                }
                                }catch(Exception e){
                                out.print("Error in Connection due to"+e.getMessage());
                                } 
                            %>
                            </select>
                 
                        
                        
                        <input type="number" class="form-control" placeholder="roll number" name="Rollno" required="">
                 
                       
                        <input type="number" class="form-control" placeholder="total amount" name="Tamount" required="">
                    
                       
                        <input type="number" class="form-control" placeholder="installment 1" name="Installment1" required="">
                  
                        
                        <input type="date" class="form-control" placeholder="installment 1 date" name="Installment1_date" required="">
                   
                       
                        <input type="number" class="form-control" placeholder="installment 2" name="Installment2" required="">
                    
                        
                        <input type="date" class="form-control" placeholder="installment 2 date" name="Installment2_date" required="">
                
                 
                        <input type="number" class="form-control" placeholder="installment 3" name="Installment3" required="">
                  
                        <input type="date" class="form-control" placeholder="installment 3 date" name="Installment3_date" required="">
                    
                        
                        <input type="number" class="form-control" placeholder="installment 4" name="Installment4" required="">
                    
                      
                        <input type="date" class="form-control" placeholder="installment 4 date" name="Installment4_date" required="">
                    
                       
                        <input type="number" class="form-control" placeholder="transportation charges" name="tcharges" required="">
                  
                            
                   <div class="text-start">
                    <button name="submit" class="btn btn-style btn-style-3" >Add fees </button>
                   </div>
                </form>
                            
</div>
            <!-- //fees -->
        </div>
    </div>
</section>
    <!-- //inner banner -->

      <%@include file="footer.jsp" %>
      
</body>

</html>