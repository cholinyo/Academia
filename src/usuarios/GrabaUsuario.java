package usuarios;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

/**
 * Servlet implementation class graba_usuario
 */
@WebServlet("/graba_usuario")
public class GrabaUsuario extends HttpServlet {
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
		//doGet(request, response);
		response.setContentType("text/plain");
		Connection conexion=null;
		synchronized (fuente_datos) {
			try {
				conexion = fuente_datos.getConnection();
				//Comprobaci�n si el usuario existe en bbdd y el password coincide//
				String usuario=request.getParameter("login");
				String password=request.getParameter("password");
				String nombre=request.getParameter("nombre");
				String apellidos=request.getParameter("apellidos");
				String rol=request.getParameter("rol");
				PrintWriter out=response.getWriter();
				/*out.println(usuario);
				out.println(password);
				out.println(nombre);
				out.println(apellidos);
				out.println(rol); */
				String qry="INSERT INTO usuarios (login, password, nombre, apellidos, rol, baja) VALUES (?, ?, ?, ?, ? ,?)"; 
				PreparedStatement pstmt = conexion.prepareStatement(qry);
				pstmt.setString(1,usuario);
				pstmt.setString(2,password); 
				pstmt.setString(3,nombre);
				pstmt.setString(4,apellidos); 
				pstmt.setString(5,rol); 
				pstmt.setString(6,"no"); 
				int rs = pstmt.executeUpdate();
				out.println(rs);
				response.sendRedirect("zona_privada.jsp");
				//Falta comprobar que el usuario no existe ya en la base de datos
				//Seria interesante que esto lo hiciera una clase
				//Comprueba_Usuario
				//Graba_usuario
				
				
/*				if(rs.next()) { //El usuario est� en la base de datos
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
				else { 
					
					response.sendRedirect("index.html");
				} */
				
			}
			catch (SQLException e) {
				e.printStackTrace();
		}
		}
	}

}
