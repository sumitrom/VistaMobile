/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sumi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.sumi.rpc.RPCClient;
import org.sumi.rpc.procedures.RemoteProcedure;
import org.sumi.rpc.rpc.exceptions.LoginException;

/**
 *
 * @author longview
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String vistaip = request.getParameter("vistaip");
        String port = request.getParameter("vistaport");
        int vistaport = Integer.parseInt(request.getParameter("vistaport"));
        //      String vport = request.getParameter("vistaport");

        String accesscode = request.getParameter("accesscode");
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();

        RPCClient c = new RPCClient(vistaip, vistaport);
        try {
            c.login(accesscode, verifycode);
            RemoteProcedure r = new RemoteProcedure("XUS GET USER INFO");
            c.call(r);
            String resp = r.getResponse();
            String token[] = resp.split("\r\n");
            String username = token[1];
            String conninfo = (username + "@" + vistaip + ":" + vistaport);
            session.setAttribute("cxn", c);
            session.setAttribute("uname", username);
            session.setAttribute("vistaip", vistaip);
            session.setAttribute("vistaport", vistaport);
            session.setAttribute("conninfo", conninfo);
            session.setAttribute("accesscode", accesscode);
            session.setAttribute("verifycode", verifycode);
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("connected.jsp");
            requestDispatcher.forward(request, response);
        } catch (LoginException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            c.disconnect();
            session.setAttribute("err_msg", ex.getMessage());
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("WEB-INF/error.jsp");
            requestDispatcher.forward(request, response);
            c.disconnect();
        }
    }
}
