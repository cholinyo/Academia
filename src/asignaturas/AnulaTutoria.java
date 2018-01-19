package asignaturas;

import java.io.Console;
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

import org.apache.catalina.Session;

/**
 * Servlet implementation class AnulaTutoria
 */
@WebServlet("/AnulaTutoria")
public class AnulaTutoria extends HttpServlet {
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
		response.setContentType("text/plain");
		Connection conexion=null;
		synchronized (fuente_datos) {
			try {
				String idtutoria=request.getParameter("idtutoria");
				String idprofesor=request.getParameter("idprofesor");
				
				Console console = System.console();
				System.out.println(request.getParameter("idtutoria"));
				System.out.println(request.getParameter("idprofesor"));
				conexion = fuente_datos.getConnection();
				String qry="DELETE FROM tutorias WHERE (idtutorias=? )"; 
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1,idtutoria); 
				int rs = pstmt.executeUpdate();
				pstmt.close();
				conexion.close();
				String url = ("gestionartutorias.jsp?id="+idprofesor);
				response.sendRedirect(url);
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
