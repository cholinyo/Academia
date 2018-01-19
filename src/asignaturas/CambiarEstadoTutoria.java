package asignaturas;

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
 * Servlet implementation class CambiarEstadoTutoria
 */
@WebServlet("/CambiarEstadoTutoria")
public class CambiarEstadoTutoria extends HttpServlet {
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
      
      // TODO Auto-generated constructor stub
  }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		Connection conexion = null;
		synchronized (fuente_datos) {
			try {
				conexion = fuente_datos.getConnection();
				String idpeticion = request.getParameter("id");
				String estado = request.getParameter("estado");
				String qry = "UPDATE peticionestutorias SET estado=? WHERE idpeticion=?";
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(2, idpeticion);
				switch (estado) {
				case "aceptado":
				pstmt.setString(1, "aceptada");
					break;
				case "rechazado":
					pstmt.setString(1, "rechazada");
						break;
				default:
					break;
				}
				int rs = pstmt.executeUpdate();
				pstmt.close();
				conexion.close();
				response.sendRedirect("zona_privada.jsp"); 		
			}
			catch (SQLException e){
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
