/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.sumi.services;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.sumi.rpc.RPCClient;
import org.sumi.rpc.Utilities;
import org.sumi.rpc.procedures.RemoteProcedure;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MatchPatient", urlPatterns = {"/MatchPatient"})
public class MatchPatient extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        RPCClient cxn = (RPCClient) session.getAttribute("cxn");
        String rpctorun = "ORWPT LAST5";
        String parameters = request.getParameter("RPCparameters");

        RemoteProcedure r = Utilities.rpc_literal_param(rpctorun, parameters);
        cxn.call(r);
        String resp = r.getResponse();

        session.setAttribute("output", resp);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("WEB-INF/results.jsp");
        requestDispatcher.forward(request, response);
    }

}
