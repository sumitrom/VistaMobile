<%-- 
    Document   : connected
    Created on : Feb 24, 2014, 5:55:54 PM
    Author     : longview
--%>

<%@page import="org.sumi.rpc.procedures.RemoteProcedure"%>
<%@page import="org.sumi.rpc.RPCClient"%>
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

        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        if (session.getAttribute("uname") == null) {
            response.sendRedirect("login.jsp");
        }

        String uname = (String) session.getAttribute("uname");
        RPCClient cxn = (RPCClient) session.getAttribute("cxn");
        String vistaip = (String) session.getAttribute("vistaip");
        Integer vistaport = (Integer) session.getAttribute("vistaport");
        String conninfo = (String) session.getAttribute("conninfo");
    %>

    <body>
        <div data-role="page">
            <div data-role="header" data-position="fixed">
                <h1>
                    VistA RPC Runner 
                </h1>
            </div>
            <div data-role="navbar">
                <ul>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="LogoutServlet">Logout</a></li> 
                    <li><a href="queries.jsp">Patient Search</a></li> 
                </ul>
            </div>

            <h2 style="text-align: center">Provide RPC name and parameters</h2>

            <div data-role="main" class="ui-content">

                <form method="POST" action="RunRpcServlet">
                    <input type="text" tabindex="1" placeholder="Remote Procedure" name="RPCname" required><br>
                    <input type="text" tabindex="2" placeholder="Parameters" name="RPCparameters"><br>
                    <input type="submit" value="Run RPC">  
                </form>
            </div>


            <div data-role="footer" data-position="fixed">
                <h3><%=conninfo%></h3>
            </div>
        </div>
    </body>
</html>
