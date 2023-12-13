<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>Student's List: Welcome to School Management System</title>
    
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

    <div class="row contact-block">
        <div class='col-md-3 contact-right'>
            <div class='input-grids'>
                <div class="row">
                    <form>
                        <select name='sclass' id="sclass">
                            <option value=''>Choose Class</option>
                            <option>1</option>
                            <option>2</option>
                              <option>3</option>
                            <option>4</option>
                              <option>5</option>
                            <option>6</option>
                              <option>7</option>
                            <option>8</option>
                              <option>9</option>
                            <option>10</option>
                        </select>
                        <select name='sectionbox' id='sectionbox'>
                            <option>Choose Class first</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
        <div id='resultbox'></div>
    </div>

    <%@include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script>
       $(document).ready(function(){
        $("#sclass").change(function(){
          $("#resultbox").html("");
          var sclass1 = $("#sclass").val();
          $.ajax({
          method: "POST",
          url: "ajax.jsp",
          data: { sclass : sclass1 }
            })
          .done(function( msg ) {
            $("#sectionbox").html(msg);
          });
        });
        $("#sectionbox").change(function(){
          var sclass1 = $("#sclass").val();
          var section = $("#sectionbox").val();
          $.ajax({
          method: "POST",
          url: "ajax.jsp",
          data: { sclass2 : sclass1, section : section }
            })
          .done(function( msg ) {
            $("#resultbox").html(msg);
          });
        });
    });
    </script>
</body>

</html>
