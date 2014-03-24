<%-- 
    Document   : results
    Created on : Mar 9, 2014, 12:04:12 PM
    Author     : Sumitro
--%>

<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
        <title>VistA RPC</title>
    </head>
    <%
        String uname = (String) session.getAttribute("uname");
        if (session.getAttribute("uname") == null) {
            response.sendRedirect("login.jsp");
        }
        String conninfo = (String) session.getAttribute("conninfo");
        String rpctorun = (String) session.getAttribute("rpctorun");
        String parameters = (String) session.getAttribute("parameters");
        String inputstring = (String) session.getAttribute("output");
        String token[] = inputstring.split("\n");%>

    <body>
        <div data-role="page">
            <div data-role="header" data-position="fixed">
                <h1>
                    VistA RPC Runner 
                </h1>
            </div>

            <div data-role="navbar">
                <ul>
                    <li><a href="ReloginServlet">Run Another</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>
            </div>
            <div data-role="main" class="ui-content">
                <h2>
                    Remote Procedure Name: <%=rpctorun%><br>
                    Parameter(s) Passed: <%=parameters%><br>
                </h2>
                <h3>
                    Results
                </h3>
                <p>
                    <%
                        for (int i = 0; i < token.length; i++) {
                            out.print(token[i] + "<br>");
                        }
                    %>
                </p>
            </div>
            <div data-role="footer" data-position="fixed">
                <h3><%=conninfo%></h3>
            </div>
        </div>

    </body>
</html>
