<%@ page import="java.sql.*" %>
<%@ include file="vars.jsp" %>
<%@page import="java.sql.Connection"%>

<%
    if(request.getParameter("email")!=null){
    
        String email1 = request.getParameter("email");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
            try {
                PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM usertable WHERE emailid = ?");
                mystatement.setString(1, email1);
                ResultSet myresult = mystatement.executeQuery();

                if (myresult.next()) {
                   out.print("Email Id Already Exist");
                } else { 
                out.print("UserName is Available");

                }
            } catch (Exception e) {
                out.print("<label class='col-form-label'>" + "Error in query due to " + e.getMessage() + "</label>");
            }
        } catch (Exception e) {
            out.print("<label class='col-form-label'>" + "Error in Connection due to " + e.getMessage() + "</label>");
        }
    }
     else if(request.getParameter("sclass")!=null)
    {
            String sclass=request.getParameter("sclass");
    try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME,PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("select distinct(section) from student where sclass=? order by section");
                    mystatement.setString(1, sclass);


                    ResultSet myresult = mystatement.executeQuery();
                    if(myresult.next())
                    {
                       
                        out.print("<option>Choose section</option>");
                        do
                        {
                            out.print("<option>" + myresult.getString("section") + "</option>");
                        }
                        while(myresult.next());
                       
                        
                       
                    }
                    else
                    {
                        out.print("<option>No Students added in this class</option>");
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
    else if(request.getParameter("sclass2")!=null && request.getParameter("section")!=null)
    {
       try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myconnection = DriverManager.getConnection(PATH+PLACE, USERNAME,PASSWORD);

                try
                {
                    PreparedStatement mystatement = myconnection.prepareStatement("select * from student where sclass=? and section=?");
                    mystatement.setString(1, request.getParameter("sclass2"));
                    mystatement.setString(2, request.getParameter("section"));

                    ResultSet myresult = mystatement.executeQuery();
                    if(myresult.next())
                    {
                            out.print("<div class='col-md-12 contact-right'>");
                      out.print("<div class='input-grids'>"
                        + "<div class='table-responsive-sm'>"
                        + "<table class='table table-hover'> "
                        + "<tr>"
                        + "<td>Roll No</td>"
                        + "<td>Name</td>"
                        + "<td>Email ID</td>"
                        + "<td>Phone</td>"
                        + "<td>Gender</td>"
                        + "<td>Father's Name</td>"
                        + "<td>Mother's Name</td>"
                        + "<td>Date of Birth</td>"
                        + "<td>Class</td>"
                        + "<td>Section</td>"
                        + "<td>Update</td>"
                        + "<td>delete</td>"
                        + "</tr>");
                        do
                        {
                            out.print("<tr><td>" + myresult.getString("rollno") + "</td><td>" + myresult.getString("name") + "</td>"
                            + "<td>" + myresult.getString("emailid") + "</td><td>" + myresult.getString("phone") + "</td>"
                            + "<td>" + myresult.getString("gender") + "</td><td>" + myresult.getString("fname") + "</td>"
                            + "<td>" + myresult.getString("mname") + "</td><td>" + myresult.getString("dob") + "</td>"
                            + "<td>" + myresult.getString("sclass") + "</td><td>" + myresult.getString("section") + "</td>"
                            + "<td><a href=updatestudent.jsp?studentid=" + myresult.getString("studentid") + "><img src='assets/images/arrow.png'></a></td>"
                            + "<td><a href='#' class='student' stuid=" + myresult.getString("studentid") + "><img src='assets/images/delete.png'></a></td></tr>");
                        
                        
                        }
                        while(myresult.next());
                        out.print("</table>");
                       
                    }
                    else
                    {
                        out.print("No Records found");
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
     else if(request.getParameter("subject")!=null) {
    String selectedClass = request.getParameter("subject");
    if (selectedClass != null && !selectedClass.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

            PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM teacher WHERE subject=?");
              mystatement.setString(1,  request.getParameter("subject"));
                    session.setAttribute("subject", request.getParameter("subject"));
                    
   

            ResultSet myresult = mystatement.executeQuery();
            if (myresult.next()) {
                out.print("<div class='col-md-12 contact-right'>"
                        + "<div class='input-grids'>"
                        + "<div class='table-responsive'>"
                        + "<table class='table table-hover'>"
                        + "<tr>"
                        + "<td>tid</td>"
                        + "<td>Name</td>"
                        + "<td>Email</td>"
                        + "<td>Phone</td>"
                        + "<td>Gender</td>"
                        + "<td>Qualification</td>"
                        + "<td>subject</td>"
                        + "<td>salary</td>"
                        + "<td>sclass</td>"
                        + "<td>Section</td>"
                        + "<td>Update</td>"
                         + "<td>Delete</td>"
                        + "</tr>");

                do {
                    out.print("<tr><td>" + myresult.getString("tid") + "</td><td>"
                            + myresult.getString("name") + "</td>"
                            + "<td>" + myresult.getString("emailid") + "</td><td>"
                            + myresult.getString("phone") + "</td>"
                            + "<td>" + myresult.getString("gender") + "</td><td>"
                            + myresult.getString("qualification") + "</td>"
                            + "<td>" + myresult.getString("subject") + "</td>"
                            + "<td>" + myresult.getString("salary") + "</td>"
                            + "<td>" + myresult.getString("sclass") + "</td>"
                            + "<td>" + myresult.getString("section") + "</td>"
                            + "<td><a href='updateteacher.jsp?tid= " + myresult.getString("tid") + "'><img src='assets/images/arrow.png'></a></td>"
                            + "<td><a href='#' class='teacher' tid=" + myresult.getString("tid") + "><img src='assets/images/delete.png'></a></td>"
                            + "</tr>");
                } while (myresult.next());
                out.print("</table>");
                
            } else {
                out.print("<div>No records found for subject " + selectedClass + "</div>");
            }
        } catch (Exception e) {
            out.print("Error in query or connection: " + e.getMessage());
        }
    } else {
        out.print("<div>Please select a valid subject and click 'Go' to view the data.</div>");
    }
}        
else if(request.getParameter("department") != null) {
    String selectedClass = request.getParameter("department");
    if (selectedClass != null && !selectedClass.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

            PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM nonteaching WHERE department=?");
              mystatement.setString(1,  request.getParameter("department"));
                    session.setAttribute("department", request.getParameter("department"));
                    
   

            ResultSet myresult = mystatement.executeQuery();
            if (myresult.next()) {
                out.print("<div class='col-md-12 contact-right'>"
                        + "<div class='input-grids'>"
                        + "<div class='table-responsive'>"
                        + "<table class='table table-hover'>"
                        + "<tr>"
                        
                        + "<td>Name</td>"
                      
                        + "<td>Email</td>"
                          + "<td>Phone</td>"
                        + "<td>Gender</td>"
                        + "<td>Address</td>"
                        + "<td>Joining date</td>"
                      
                        + "<td>department</td>"
                        + "<td>role</td>"
                        + "<td>Update</td>"
                        + "<td>Delete</td>"
                        + "</tr>");

                do {
                    out.print("<tr><td>" + myresult.getString("name") + "</td><td>"
                            + myresult.getString("email") + "</td>"
                            + "<td>" + myresult.getString("phone") + "</td><td>"
                            + myresult.getString("gender") + "</td>"
                            + "<td>" + myresult.getString("address") + "</td><td>"
                            + myresult.getString("joiningdate") + "</td>"
             
                
                            + "<td>" + myresult.getString("department") + "</td>"
                            + "<td>" + myresult.getString("role") + "</td>"
                            + "<td><a href='updatenonteaching.jsp?employeeid= " + myresult.getString("employeeid") + "'><img src='assets/images/arrow.png'></a></td>"
                            + "<td><a href='#' class='nonteaching' employeeid=" + myresult.getString("employeeid") + "><img src='assets/images/delete.png'></a></td>"
                            + "</tr>");
                } while (myresult.next());

                
            } else {
                out.print("<div>No records found for Department " + selectedClass + "</div>");
            }
        } catch (Exception e) {
            out.print("Error in query or connection: " + e.getMessage());
        }
    } else {
        out.print("<div>Please select a valid department and click 'Go' to view the data.</div>");
    }
}
else if (request.getParameter("studentid") != null) {
    String selectedid = request.getParameter("studentid");
    if (selectedid != null && !selectedid.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

            PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM fees1 WHERE studentid=?");
            mystatement.setString(1, selectedid);
            session.setAttribute("sid",selectedid);
            
 
            ResultSet myresult = mystatement.executeQuery();
            if (myresult.next()) {
                out.print("<div class='col-md-12 contact-right'>"
                        + "<div class='input-grids'>"
                        + "<div class='table-responsive'>"
                        + "<table class='table table-hover'>"
                        + "<tr>"
                       + "<td>Student Id</td>"
                       + "<td>Roll No</td>"
                         + "<td>Total Amount</td>"
                        + "<td>Installment1</td>"
                         + "<td>Installment1_Date</td>"
                         + "<td>Installment2</td>"
                         + "<td>Installment2_Date</td>"
                         + "<td>Installment3</td>"
                         + "<td>Installment3_Date</td>"
                         + "<td>Installment4</td>"
                         + "<td>Installment4_Date</td>"
                         + "<td>Transportation Charges</td>"
                        + "<td>Update</td>"
                         + "<td>Delete</td>"
                        + "</tr>");

                do {
                    out.print("<tr><td>" + myresult.getString("studentid") + "</td><td>"
                            + myresult.getString("Rollno") + "</td>"
                            + "<td>" + myresult.getString("total_amount") + "</td><td>"
                            + myresult.getString("installment1") + "</td>"
                            + "<td>" + myresult.getString("installment1_date") + "</td><td>"
                            + myresult.getString("installment2") + "</td>"
                            + "<td>" + myresult.getString("installment2_date") + "</td>"
                            + "<td>" + myresult.getString("installment3") + "</td>"
                            + "<td>" + myresult.getString("installment3_date") + "</td>"
                            + "<td>" + myresult.getString("installment4") + "</td>"
                             + "<td>" + myresult.getString("installment4_date") + "</td>"
                             + "<td>" + myresult.getString("tcharges") + "</td>"
                            + "<td><a href=updatefees.jsp?uniqueid=" + myresult.getString("uniqueid") + "><img src='assets/images/arrow.png'></a></td>"
                            + "<td><a href='#' class='studentid' uniqueid="+ myresult.getString("uniqueid") + "><img src='assets/images/delete.png'></a></td>"
                            + "</tr>");
                } while (myresult.next());

                 
            } else {
                out.print("<div>No records found for Student ID " + selectedid + "</div>");
            }
        } catch (Exception e) {
            out.print("Error in query or connection: " + e.getMessage());
        }
    } else {
        out.print("<div>Please select a valid class and click 'Go' to view the data.</div>");
    }
}
%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".student").click(function (e) {
            e.preventDefault();
            var answer = confirm("Do you really want to delete?");
            if (answer) {
                var parenttr = $(this).parent().parent();
                var studentid = $(this).attr("stuid");
                $.ajax({
                    method: "POST",
                    url: "ajax2.jsp",
                    data: {studentid: studentid}
                }).done(function (msg) {
                    if ($.trim(msg) === "1") {
                        $(parenttr).css("background-color", "red"); // Corrected line
                        $(parenttr).slideUp(500, function(){
                            $(parenttr).remove();
                        });
                    }
                });
            }
        });
         $(".teacher").click(function (e) {
            e.preventDefault();
            var answer = confirm("Do you really want to delete?");
            if (answer) {
                var parenttr = $(this).parent().parent();
                var teacherid = $(this).attr("tid");
                $.ajax({
                    method: "POST",
                    url: "ajax2.jsp",
                    data: {teacherid: teacherid}
                }).done(function (msg) {
                    if ($.trim(msg) === "1") {
                        $(parenttr).css("background-color", "red"); // Corrected line
                        $(parenttr).slideUp(500, function(){
                            $(parenttr).remove();
                        });
                    }
                });
            }
        });
         $(".nonteaching").click(function (e) {
            e.preventDefault();
            var answer = confirm("Do you really want to delete?");
            if (answer) {
                var parenttr = $(this).parent().parent();
                var employeeid = $(this).attr("employeeid");
                $.ajax({
                    method: "POST",
                    url: "ajax2.jsp",
                    data: {employeeid: employeeid}
                }).done(function (msg) {
                    if ($.trim(msg) === "1") {
                        $(parenttr).css("background-color", "red"); // Corrected line
                        $(parenttr).slideUp(500, function(){
                            $(parenttr).remove();
                        });
                    }
                });
            }
        });
         $(".studentid").click(function (e) {
            e.preventDefault();
            var answer = confirm("Do you really want to delete?");
            if (answer) {
                var parenttr = $(this).parent().parent();
                var uniqueid = $(this).attr("uniqueid");
                $.ajax({
                    method: "POST",
                    url: "ajax2.jsp",
                    data: {uniqueid: uniqueid}
                }).done(function (msg) {
                    if ($.trim(msg) === "1") {
                        $(parenttr).css("background-color", "red"); // Corrected line
                        $(parenttr).slideUp(500, function(){
                            $(parenttr).remove();
                        });
                    }
                });
            }
        });
    
    });
    
</script>