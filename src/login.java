import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import javax.sql.*;


import com.sun.xml.internal.bind.CycleRecoverable.Context;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource fuente_datos = null;
       

    public void init(ServletConfig conf) throws ServletException
    {
    	super.init(conf);
    	InitialContext ctx;
    	try {
    		ctx = new InitialContext();
    		fuente_datos = (DataSource)ctx.lookup("java:comp/env/jdbc/DBAcademia");
    		
    	}
    	catch (NamingException e ) {
    		e.printStackTrace();
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Connection conexion=null;
		synchronized (fuente_datos) {
			try {
				conexion = fuente_datos.getConnection();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (request.getParameter("login").compareTo("admin")==0 && (request.getParameter("password").compareTo("admin")==0)) {
			HttpSession session = request.getSession();
			session.setAttribute("conexion", "ok");
			session.setAttribute("login", "admin");
			session.setAttribute("rol", "admin");
			response.sendRedirect("acceso_portal.jsp");
			
		}
		else {
			response.sendRedirect("index.html");
		}			
		
	}

}
