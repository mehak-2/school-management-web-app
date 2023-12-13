<%@page import="java.sql.*" %>
<%@include file="vars.jsp" %>
<%
     if(request.getParameter("tid")!=null){
         String tid=request.getParameter("tid");

             try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                 try{
                     PreparedStatement mystatement = myConnection.prepareStatement("delete from teacher where tid=?");
                     mystatement.setString(1, tid);
                     if(mystatement.executeUpdate()>0){
                         response.sendRedirect("teacherlist.jsp?subject=" + session.getAttribute("subject").toString());
                     }
                     else{
                     out.print("Error occured. Try again letter");
    }

                 }catch(Exception e){
                     out.print("<label class='col-form-label'>"+"Error in query due to"+e.getMessage()+"</label>");
                 }
             }catch(Exception e){
                 out.print("<label class='col-form-label'>"+"Error in Connection due to  "+e.getMessage()+"</label>");
             }   
     }
 %>