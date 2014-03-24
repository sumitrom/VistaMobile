<%-- 
    Document   : queries
    Created on : Mar 20, 2014, 5:23:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
    </head>
    <%
        String conninfo = (String) session.getAttribute("conninfo");
        session.setAttribute("output", "");
        String inputstring = (String) session.getAttribute("output");
        
    %>
    <body>
        <div data-role="page">
            <div data-role="header" data-position="fixed">
                <h1>
                    Patient Portal 
                </h1>
            </div>
            <div data-role="navbar">
                <ul>
                    <li><a href="connected.jsp">Run Another</a></li>
                    <li><a href="results_JSON.jsp">JSON</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>
                <form method="post" action="MatchPatient">
                    <div class="ui-field-contain">
                        <input type="search" name="RPCparameters" id="search" placeholder="Patient Search">
                    </div>
                    <input type="submit" data-inline="true" value="Submit">
                </form>
            </div>

            <div data-role="main" class="ui-content">
                <%=inputstring%>                
            </div>
            <div data-role="footer" data-position="fixed">
                <h3><%=conninfo%></h3>
            </div>
        </div>

    </body>

</html>
