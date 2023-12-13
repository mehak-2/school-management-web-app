<%@page import="java.sql.*"%>
<%@include file="vars.jsp" %>

<%
    if (request.getParameter("uniqueid") != null) {
    
        String uid = request.getParameter("uniqueid");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD)) {
                try {
                    PreparedStatement mystatement = myConnection.prepareStatement("DELETE FROM fees1 WHERE uniqueid=?");
                    mystatement.setString(1, uid);
                    
                    if (mystatement.executeUpdate() > 0) {
                        response.sendRedirect("feeslist.jsp?sid=" + session.getAttribute("sid").toString());
                    } else {
                        out.print("Error occurred. Try again later.");
                    }
                } catch (Exception e) {
                   
                    out.print("<label class='col-form-label'>" + "Error in query due to " + e.getMessage() + "</label>");
                }
            }
        } catch (Exception e) {
            
            out.print("<label class='col-form-label'>" + "Error in Connection due to " + e.getMessage() + "</label>");
        }
    }
%>