package usuarios;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class baja_usuario
 */
@WebServlet("/baja_usuario")
public class BajaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource fuente_datos = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
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
		Connection conexion=null;
		
		synchronized (fuente_datos) {
			try {
				conexion = fuente_datos.getConnection();
				String idusuario=request.getParameter("id");
				String qry="UPDATE usuarios SET baja='si' WHERE idusuario=?"; 
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1,idusuario);
				int rs = pstmt.executeUpdate();
				pstmt.close();
				conexion.close();
				response.sendRedirect("zona_privada.jsp");
				
				
			}
			catch (SQLException e) {
				e.printStackTrace();
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
