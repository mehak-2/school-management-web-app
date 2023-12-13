<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>Non-Teaching List: Welcome to School Management System</title>
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
                <h4 class="inner-text-title pt-5">Student List</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><i class="fas fa-angle-right"></i>Students</li>
                </ul>
            </div>
        </div>
    </section>

   <!-- inner banner -->
    <div class="col-md-3 contact-right">
    <div class="input-grids">
        <div class="row">
            <form method="get">
                <label>Choose Department</label>
                <select name="department" id="department" class="form-control">
                    <option>Choose Department</option>
                    <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

                        PreparedStatement mystatement = myConnection.prepareStatement("SELECT DISTINCT department FROM nonteaching");
                        ResultSet myresult = mystatement.executeQuery();

                        while (myresult.next()) {
                            out.print("<option>" + myresult.getString("department") + "</option>");
                        }
                    } catch (Exception e) {
                        out.print("Error in query or connection: " + e.getMessage());
                    }
                    %>
                </select>
                
            </form>
        </div>
    </div>
</div>
 <div id='resultbox'></div>


    <!-- //inner banner -->

    <%@include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script>
       $(document).ready(function(){
        $("#department").change(function(){
          $("#resultbox").html("");
          var department1 = $("#department").val();
          $.ajax({
          method: "POST",
          url: "ajax.jsp",
          data: { department : department1 }
            })
          .done(function( msg ) {
            $("#resultbox").html(msg);
          });
        });
    });
    </script>
  
</body>

</html>