<%@ page import="java.sql.*" %>
<%@ include file="vars.jsp" %>
<%
    if(request.getParameter("stuid")!=null){
    String studentid = request.getParameter("stuid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
        try {
            PreparedStatement mystatement = myConnection.prepareStatement("SELECT remaining_amt FROM fees1 WHERE studentid = ?");
            mystatement.setString(1, studentid);
            ResultSet myresult = mystatement.executeQuery();

            if (myresult.next()) {
                out.print(myresult.getString("remaining_amt"));
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
%>