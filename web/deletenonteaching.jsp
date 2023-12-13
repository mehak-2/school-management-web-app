<%@page import="java.sql.*"%>
    <%@include file="vars.jsp" %>

<%
    if(request.getParameter("employeeid")!=null)
        {


            String employeeid=request.getParameter("employeeid");

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
               Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                try
                {
                    PreparedStatement mystatement = myConnection.prepareStatement("delete from nonteaching where employeeid=?");
                    mystatement.setString(1, employeeid);
                    if(mystatement.executeUpdate()>0)
                    {
                        response.sendRedirect("teachinglist.jsp?department=" + session.getAttribute("department").toString());
                    }
                    else
                    {
                        out.print("Error Occured. Try again later");
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
%>