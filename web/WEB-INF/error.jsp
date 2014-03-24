<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
        <title>VistA RPC</title>
    </head>
    <body>

        <br><br>

        <% String error_string = (String) session.getAttribute("err_msg");
            session.invalidate();
        %>

        <div data-role="page">
            <div data-role="header" data-position="fixed">
                <h1>
                    VistA RPC Runner 
                </h1>
            </div>
            <div data-role="main" class="ui-content">

                <form method="LINK" action="login.jsp">
                    <h3><%=error_string%></h3>
                    <input type="submit" value="Back to Login">  
                </form>
            </div>

            <div data-role="footer" data-position="fixed">
                <h3>Copyright © Sumitro Majumdar, 2014</h3>
            </div>
        </div>
    </body>
</html>