package asignaturas;

import java.io.Console;
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
 * Servlet implementation class MatriculaAlumno
 */
@WebServlet("/MatriculaAlumno")
public class MatriculaAlumno extends HttpServlet {
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
				Console console = System.console();
				conexion = fuente_datos.getConnection();
				String idasignatura=request.getParameter("idasignatura");
				String idusuario=request.getParameter("idusuario");
				String activo="si";
				/*PrintWriter out=response.getWriter();*/
				System.out.println(request.getParameter("idasignatura"));
				System.out.println(request.getParameter("idusuario"));
				//*System.out.println(request.getParameter("activo"));
				String qry="INSERT INTO matriculas (idusuario, idasignatura) VALUES (?, ?)"; 
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1,idusuario); 
				pstmt.setString(2,idasignatura);
				//*pstmt.setString(3, activo);
				int rs = pstmt.executeUpdate();
				/*out.println(rs);*/
				response.sendRedirect("zona_privada.jsp");
			}
			catch (SQLException e) {
				e.printStackTrace();
		}
			response.sendRedirect("asignaralumnos.jsp?id=19");
		}
	}
}
