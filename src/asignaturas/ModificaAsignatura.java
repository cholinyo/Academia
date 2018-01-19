package asignaturas;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ModificaAsignatura
 */
@WebServlet("/ModificaAsignatura")
public class ModificaAsignatura extends HttpServlet {
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
     * @see HttpServlet#HttpServlet()
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
		response.setContentType("text/plain");
		Connection conexion=null;
		synchronized (fuente_datos) {
			try {
				conexion = fuente_datos.getConnection();
				//Comprobaci�n si el usuario existe en bbdd y el password coincide//
				
				int id=Integer.parseInt(request.getParameter("idasignatura") );
				String nombre=request.getParameter("nombre");
				String horario=request.getParameter("horario");
				int profesor=Integer.parseInt(request.getParameter("profesor"));
				String estado=request.getParameter("estado");
				
				
				System.out.println(id);
				System.out.println(nombre);
				System.out.println(horario);
				System.out.println(profesor);
				System.out.println(estado);
				
				
			
				String qry="UPDATE asignaturas SET nombre=?, horario=?, profesor=?, estado=? WHERE idasignatura=?"; 
				PreparedStatement pstmt = conexion.prepareStatement(qry);	
				pstmt.setString(1,nombre); 
				pstmt.setString(2,horario);
				pstmt.setInt(3,profesor); 
				pstmt.setString(4,estado);
				pstmt.setInt(5,id);
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
}
