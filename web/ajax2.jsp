<%@ page import="java.sql.*" %>
<%@ include file="vars.jsp" %>
<%
    if(request.getParameter("studentid")!=null){
    String studentid = request.getParameter("studentid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

        try {
            PreparedStatement mystatement = myconnection.prepareStatement("DELETE FROM student WHERE studentid=?");
            mystatement.setString(1, studentid);

            int rowsAffected = mystatement.executeUpdate();
            if (rowsAffected > 0) {
                out.print("1"); 
            } else {
                out.print("0"); 
            }
        } catch (Exception e) {
            out.print("Error in Query due to " + e.getMessage());
        } finally {
            if (myconnection != null) {
                myconnection.close(); 
            }
        }
    } catch (Exception e) {
        out.print("Error in Connection due to " + e.getMessage());
    }
    }
     else if(request.getParameter("stuid")!=null){
    
        String studentid = request.getParameter("stuid");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
            try {
                PreparedStatement mystatement = myConnection.prepareStatement("SELECT total_amount FROM fees1 WHERE studentid = ?");
                mystatement.setString(1, studentid);
                ResultSet myresult = mystatement.executeQuery();

                if (myresult.next()) {
                   out.print(myresult.getString("total_amount"));
                } else { 
                out.print("0");

                }
            } catch (Exception e) {
                out.print("<label class='col-form-label'>" + "Error in query due to " + e.getMessage() + "</label>");
            }
        } catch (Exception e) {
            out.print("<label class='col-form-label'>" + "Error in Connection due to " + e.getMessage() + "</label>");
        }
    }
   else if(request.getParameter("teacherid")!=null){
    String teacherid = request.getParameter("teacherid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

        try {
            PreparedStatement mystatement = myconnection.prepareStatement("DELETE FROM teacher WHERE tid=?");
            mystatement.setString(1, teacherid);

            int rowsAffected = mystatement.executeUpdate();
            if (rowsAffected > 0) {
                out.print("1"); 
            } else {
                out.print("0"); 
            }
        } catch (Exception e) {
            out.print("Error in Query due to " + e.getMessage());
        } finally {
            if (myconnection != null) {
                myconnection.close(); 
            }
        }
    } catch (Exception e) {
        out.print("Error in Connection due to " + e.getMessage());
    }
    }
     else if(request.getParameter("employeeid")!=null){
    String employeeid = request.getParameter("employeeid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

        try {
            PreparedStatement mystatement = myconnection.prepareStatement("DELETE FROM nonteaching WHERE employeeid=?");
            mystatement.setString(1, employeeid);

            int rowsAffected = mystatement.executeUpdate();
            if (rowsAffected > 0) {
                out.print("1"); 
            } else {
                out.print("0"); 
            }
        } catch (Exception e) {
            out.print("Error in Query due to " + e.getMessage());
        } finally {
            if (myconnection != null) {
                myconnection.close(); 
            }
        }
    } catch (Exception e) {
        out.print("Error in Connection due to " + e.getMessage());
    }
    }
     else if(request.getParameter("uniqueid")!=null){
    String uniqueid = request.getParameter("uniqueid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myconnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);

        try {
            PreparedStatement mystatement = myconnection.prepareStatement("DELETE FROM fees1 WHERE uniqueid=?");
            mystatement.setString(1, uniqueid);

            int rowsAffected = mystatement.executeUpdate();
            if (rowsAffected > 0) {
                out.print("1"); 
            } else {
                out.print("0"); 
            }
        } catch (Exception e) {
            out.print("Error in Query due to " + e.getMessage());
        } finally {
            if (myconnection != null) {
                myconnection.close(); 
            }
        }
    } catch (Exception e) {
        out.print("Error in Connection due to " + e.getMessage());
    }
    }

%>
