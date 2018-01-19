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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.catalina.Session;

/**
 * Servlet implementation class AltaPeticionTutoria
 */
@WebServlet("/AltaPeticionTutoria")
public class AltaPeticionTutoria extends HttpServlet {
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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		Connection conexion = null;
		synchronized (fuente_datos) {
			try {
				Console console = System.console();
				conexion = fuente_datos.getConnection();
				HttpSession session = request.getSession();
				int idalumno = (int) (session.getAttribute("id_usuario"));
				int idtutoria = Integer.parseInt(request.getParameter("idtutoria"));
				int idprofesor = Integer.parseInt(request.getParameter("idprofesor"));
				String observaciones = request.getParameter("observaciones");
				System.out.println(idalumno);
				System.out.println(idtutoria);
				System.out.println(idprofesor);
				Tutorias datostutoria = Tutorias.getTutoria(idtutoria);
				String dia = datostutoria.getDia();
				String hora = datostutoria.getHora();

				String qry = "INSERT INTO peticionestutorias (idprofesor, idalumno, dia, hora, estado, observaciones) VALUES (?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setInt(1, idprofesor);
				pstmt.setInt(2, idalumno);
				pstmt.setString(3, dia);
				pstmt.setString(4, hora);
				pstmt.setString(5, "pendiente");
				pstmt.setString(6, observaciones);
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
