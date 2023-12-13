<%
    session.invalidate();
   
    
    Cookie mycookie = new Cookie("uname1", "0");
    mycookie.setMaxAge(0);
    response.addCookie(mycookie);

    Cookie mycookie2 = new Cookie("emailid", "0");
    mycookie2.setMaxAge(0);
    response.addCookie(mycookie2);
    
    Cookie mycookie3 = new Cookie("adminname", "0");
    mycookie3.setMaxAge(0);
    response.addCookie(mycookie3);
                                    
    response.sendRedirect("index.jsp");

%>