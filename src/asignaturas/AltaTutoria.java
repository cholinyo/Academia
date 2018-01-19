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

import org.apache.catalina.Session;

import com.sun.javafx.binding.SetExpressionHelper;

/**
 * Servlet implementation class AltaTutoria
 */
@WebServlet("/AltaTutoria")
public class AltaTutoria extends HttpServlet {
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
		// TODO Auto-generated method stub
		// doGet(request, response);
		response.setContentType("text/plain");
		Connection conexion = null;
		synchronized (fuente_datos) {
			try {
				Console console = System.console();
				conexion = fuente_datos.getConnection();
				int idprofesor = Integer.parseInt(request.getParameter("idprofesor"));
				String dia = request.getParameter("dia");
				int hora = Integer.parseInt(request.getParameter("hora"));
				/* PrintWriter out=response.getWriter(); */
				System.out.println(request.getParameter("idprofesor"));
				System.out.println(request.getParameter("dia"));
				System.out.println(request.getParameter("hora"));
				// Falta comprobar que la tutoria ya existe ya en la base de datos
				String qry = "INSERT INTO tutorias (idprofesor, dia, hora) VALUES (?, ?, ?)";
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setInt(1, idprofesor);
				pstmt.setString(2, dia);
				pstmt.setInt(3, hora);
				int rs = pstmt.executeUpdate();
				pstmt.close();
				conexion.close();
				response.sendRedirect("zona_privada.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
