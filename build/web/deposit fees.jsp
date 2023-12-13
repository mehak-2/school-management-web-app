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
            if(request.getParameter("submit")!=null){
                String studentid, remaining_amt, received_amount, balance_amount, date, installments ;
                studentid=request.getParameter("studentid");
               remaining_amt=request.getParameter("ramount");
               received_amount=request.getParameter("received_amount");
                balance_amount=request.getParameter("balance_amount");
                date=request.getParameter("date");
                installments=request.getParameter("installment");
                
                
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                        try{
                            PreparedStatement mystatement = myConnection.prepareStatement("insert into depositfee (`studentid`, `remaining_amt`, `received_amount`, `balance_amount`, `date`, `installments`) values(?, ?, ?, ?, ?, ?)");
                            mystatement.setString(1, studentid);
                             mystatement.setString(2, remaining_amt);
                              mystatement.setString(3, received_amount);
                               mystatement.setString(4, balance_amount);
                                mystatement.setString(5, date);
                              mystatement.setString(6, installments);
                       
                            if(mystatement.executeUpdate()>0){
                                out.print("Fees deposited Succesfully.");
                            }
                            
                        }catch(Exception e){
                            out.print("Error in query due to"+e.getMessage());
                        }
                    }catch(Exception e){
                        out.print("Error in Connection due to  "+e.getMessage());
                    }   
            }
        %>
        
     <%
if(request.getParameter("submit")!=null){
    String balance_amount = request.getParameter("balance_amount");
    String studentid = request.getParameter("studentid");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
        try {
            PreparedStatement mystatement = myConnection.prepareStatement("UPDATE fees1 SET remaining_amt = ? WHERE studentid = ?");
            mystatement.setString(1, balance_amount);
            mystatement.setString(2, studentid);

            if(mystatement.executeUpdate() > 0){
                out.print("Remaining amount updated successfully.");
            } else {
                out.print("Failed to update remaining amount.");
            }
        } catch(Exception e){
            out.print("Error in query due to: " + e.getMessage());
        }
    } catch(Exception e){
        out.print("Error in Connection due to: " + e.getMessage());
    }   
}
%>


        <form>
                        
            <input type="number" name="studentid" id="studentid" placeholder="Studentid" class="contact-input" required="" />
            <input type="number" name="ramount" id="ramount" placeholder="Remaining amount" class="contact-input" required="" /><!-- comment -->
            <input type="number" name="received_amount" id="received_amount" placeholder="Received_amount" class="contact-input" required="" />
            <input type="number" name="balance_amount" id="balance_amount" placeholder="Balance amount" class="contact-input" required="" /><!-- comment -->
            <input type="date" name="date" id="date" placeholder="Fees date" class="contact-input" required="" /><!-- comment --> 
            <select name="installment">
                <option>choose installment</option><!-- comment -->
                 <option> installment 1</option>
                  <option>installment 2</option>
                   <option>installment 3</option>
                    <option>installment 4</option>
            </select>
            <div class="text-start">
            <button name="submit" class="btn btn-style btn-style-3" >Deposit fees </button>
           </div>
        </form>
                            
</div>
            <!-- //fees -->
        </div>
    </div>
</section>
    <!-- //inner banner -->

      <%@include file="footer.jsp" %>
       <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function(){
        $("#studentid").blur(function(){
          $.ajax({
          method: "POST",
          url: "ajax3.jsp",
          data: { stuid : $(this).val() }
            })
          .done(function( msg ) {
            $("#ramount").val($.trim(msg))
          });
       
        });
        
     
        $("#received_amount").blur(function(){
            var ramount = parseInt($("#ramount").val());
            var paidamount = parseInt($(this).val());
            var balance = ramount - paidamount;
            $("#balance_amount").val(balance);
       
        });
    });
    </script>
      
</body>

</html>