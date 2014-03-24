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

        <div data-role="page">
            <div data-role="header" data-position="fixed">
                <h1>Vista RPC Runner</h1>
            </div>
            <br>

            <div data-role="main" class="ui-content">
                Please Login using VistA credentials. If you do not have access to a VistA system, please contact your VistA System Administrator.
                <form method="POST" action="LoginServlet">
                    <input type="text" tabindex="1" placeholder="VistA Servername or IP Address" name="vistaip" required><br>
                    <input type="text" tabindex="2" placeholder="VistA Port" name="vistaport" required><br>
                    <input type="text" tabindex="3" placeholder="Access Code" name="accesscode" required><br>
                    <input type="password" tabindex="4" placeholder="Verify Code" name="verifycode" required><br>                        
                    <input type="submit" value="Login">
                </form>
            </div>

            <div data-role="footer" data-position="fixed">
                <h3>Copyright © Sumitro Majumdar, 2014</h3>
            </div>
        </div>
    </body>
</html>
