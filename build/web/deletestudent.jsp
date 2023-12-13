<%@page import="java.sql.*"%>
    <%@include file="vars.jsp" %>

<%
    if(request.getParameter("studentid")!=null)
        {


            String studentid=request.getParameter("studentid");

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
               Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                try
                {
                    PreparedStatement mystatement = myConnection.prepareStatement("delete from student where studentid=?");
                    mystatement.setString(1, studentid);
                    if(mystatement.executeUpdate()>0)
                    {
                        response.sendRedirect("studentlist.jsp?sclass=" + session.getAttribute("sclass").toString());
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