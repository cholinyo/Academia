package asignaturas;

import java.io.Console;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

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

import com.mysql.jdbc.Statement;

public class Tutorias {
	int idtutoria;
	int idprofesor;
	String dia; /* Array con horario */
	String hora;

	public int getIdtutoria() {
		return idtutoria;
	}

	public void setIdtutoria(int idtutoria) {
		this.idtutoria = idtutoria;
	}

	public int idprofesor() {
		return idprofesor;
	}

	public void setIdprofesor(int idprofesor) {
		this.idprofesor = idprofesor;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public static LinkedList<Tutorias> getTutorias(int idusuario) { // Devuelve las tutorias de un profesor

		LinkedList<Tutorias> listatutorias = new LinkedList<Tutorias>();
		try {

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			PreparedStatement ps = conexion.prepareStatement("select * from tutorias where idprofesor=?");
			ps.setInt(1, idusuario);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Tutorias tutoria = new Tutorias();

				tutoria.setIdtutoria(rs.getInt("idtutorias"));
				tutoria.setIdprofesor(rs.getInt("idprofesor"));
				tutoria.setDia(rs.getString("dia"));
				tutoria.setHora(rs.getString("hora"));

				listatutorias.add(tutoria);
			}
			rs.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listatutorias; // lista con todas las asignaturas en las que un usuario está matriculado
	}
	
	public static Tutorias getTutoria(int idtutoria) { // Devuelve los datos de una tutoria
		Tutorias tutoria = new Tutorias();
		try {

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			PreparedStatement ps = conexion.prepareStatement("select * from tutorias where idtutorias=?");
			ps.setInt(1, idtutoria);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				tutoria.setIdtutoria(rs.getInt("idtutorias"));
				tutoria.setIdprofesor(rs.getInt("idprofesor"));
				tutoria.setDia(rs.getString("dia"));
				tutoria.setHora(rs.getString("hora")) ;				
			}
			rs.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tutoria; // lista con todas las asignaturas en las que un usuario está matriculado
	}

}
