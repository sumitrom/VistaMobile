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
                    <li><a href="connected.jsp">Run Another</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>
            </div>

            <div data-role="main" class="ui-content">

                <h3>How to pass LITERAL parameters:</h3>
                <p>Just type in as a # separated String. For example:<br>
                    For RPC SD APPOINTMENT MAKE, parameters are supplied thus:<br>
                    <font color="red">195#3130801.0900#ROUTINE#CHECKUP#30#URGENT</font>
                </p>

                <h3>How to pass LIST parameters:</h3>
                <p>For list parameters, use "^" as delimeters. For example:<br>
                    For RPC XYZ that accepts list parameters only, Parameters are supplied thus:<br>
                    <font color="red">12^abcd^edtf^hypo<br></font>
                    In the Above example, 12^abcd^edtf^hypo are list parameters.
                </p>
                <h3>How to pass ORDERED LIST parameters:</h3>
                <p>For ordered list parameters, use [] and #. For example:<br>
                    For RPC ORWORR GET4LST, Parameters are supplied thus:<br>
                    <font color="red">2#3130610.155123#[1,33249;1]#[2,33248;1]<br></font>
                    In the Above example, 2 and 3130610.155123 are literal parameters and the rest are ordered lists.
                </p>
            </div>

            <div data-role="footer" data-position="fixed">
                <h3><%=conninfo%></h3>
            </div>
        </div>
    </body>
</html>
