package usuarios;
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
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource fuente_datos = null;
       

    public void init(ServletConfig conf) throws ServletException
    {
    	super.init(conf);
    	InitialContext ctx;
    	try {
    		ctx = new InitialContext();
    		fuente_datos = (DataSource)ctx.lookup("java:comp/env/jdbc/dbacademia");
    		
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
				//Comprobaci�n si el usuario existe en bbdd y el password coincide//
				String usuario=request.getParameter("login");
				String qry="SELECT * FROM usuarios WHERE login=?";
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1, usuario);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) { //El usuario est� en la base de datos
					String pass = rs.getString(2);
					if (request.getParameter("login").compareTo(rs.getString(2))==0 && (request.getParameter("password").compareTo(rs.getString(3))==0)) {
						HttpSession session = request.getSession();
						session.setAttribute("conexion", "ok");
						session.setAttribute("login",rs.getString(2));
						String nombreUsuario = rs.getString(4) + " " + rs.getString(5);
						session.setAttribute("nombre", nombreUsuario);
						session.setAttribute("rol", rs.getString(6));
						response.sendRedirect("zona_privada.jsp");
					}
				
				}
				else { // El usuario no est� en la base de datos
					
					response.sendRedirect("index.html");
				}
				
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}

}
