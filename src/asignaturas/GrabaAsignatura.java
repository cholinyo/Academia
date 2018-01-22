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

/**
 * Servlet implementation class GrabaAsignatura
 */
@WebServlet("/GrabaAsignatura")
public class GrabaAsignatura extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource fuente_datos = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			fuente_datos = (DataSource) ctx.lookup("java:comp/env/jdbc/dbacademia");

		} catch (NamingException e) {
			e.printStackTrace();
		}

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		// doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		Connection conexion = null;
		synchronized (fuente_datos) {
			try {
				Console console = System.console();
				conexion = fuente_datos.getConnection();
				String nombre = request.getParameter("nombre");
				String horario = request.getParameter("horario");
				String profesor = request.getParameter("profesor");
				/* PrintWriter out=response.getWriter(); */
				System.out.println(request.getParameter("nombre"));
				System.out.println(request.getParameter("horario"));
				System.out.println(request.getParameter("profesor"));
				// Falta comprobar que la asignatura yaexiste ya en la base de datos
				// Seria interesante que esto lo hiciera una clase
				String qry = "INSERT INTO asignaturas (nombre, horario, profesor, estado) VALUES (?, ?, ?, ?)";
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1, nombre);
				pstmt.setString(2, horario);
				pstmt.setString(3, profesor);
				pstmt.setString(4, "alta");
				int rs = pstmt.executeUpdate();
				
				pstmt.close();
				conexion.close();
				/* out.println(rs); */
				response.sendRedirect("zona_privada.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
