package asignaturas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class Matricula {
	int idmatricula;
	int idusuario;
	int idasignarura;
	String activo;

	public int getIdmatricula() {
		return idmatricula;
	}

	public void setIdmatricula(int idmatricula) {
		this.idmatricula = idmatricula;
	}

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public int getIdasignarura() {
		return idasignarura;
	}

	public void setIdasignarura(int idasignarura) {
		this.idasignarura = idasignarura;
	}

	public void setActivo(String activo) {
		this.activo = activo;
	}

	public String getActivo() {
		return activo;
	}

	public static LinkedList<Matricula> getMatricula(int idusuario) { // Devuelve las asignaturar matriculadas por un
																		// usuario

		LinkedList<Matricula> listaasignusuario = new LinkedList<Matricula>();

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from matriculas where idusuario=?");
			ps.setInt(1, idusuario);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Matricula matricula = new Matricula();

				matricula.setIdmatricula(rs.getInt("idmatricula"));
				matricula.setIdusuario(rs.getInt("idusuario"));
				matricula.setIdasignarura(rs.getInt("idasignatura"));
				matricula.setActivo(rs.getString("activo"));

				listaasignusuario.add(matricula);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaasignusuario; // lista con todas las asignaturas en las que un usuario está matriculado
	}

	public static LinkedList<Matricula> getUsuMatAsig(int idasignatura) { // Devuelve los usuarios matriculadas en una asignatura

		LinkedList<Matricula> listaasignusuario = new LinkedList<Matricula>();

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from matriculas where idasignatura=?");
			ps.setInt(1, idasignatura);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Matricula matricula = new Matricula();

				matricula.setIdmatricula(rs.getInt("idmatricula"));
				matricula.setIdusuario(rs.getInt("idusuario"));
				matricula.setIdasignarura(rs.getInt("idasignatura"));
				matricula.setActivo(rs.getString("activo"));

				listaasignusuario.add(matricula);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaasignusuario; // lista de todas las matriculas para una asignatura
	}

	public static LinkedList<Matricula> getUserInAsigM(int idasignatura) { // Devuelve las asignaturar matriculadas por
																			// un usuario

		LinkedList<Matricula> listauserinasig = new LinkedList<Matricula>();

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from matriculas where idsuario=?");
			ps.setInt(1, idasignatura);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Matricula matricula = new Matricula();

				matricula.setIdmatricula(rs.getInt("idmatricula"));
				matricula.setIdusuario(rs.getInt("idusuario"));
				matricula.setIdasignarura(rs.getInt("idasignatura"));
				matricula.setActivo(rs.getString("activo"));

				listauserinasig.add(matricula);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listauserinasig; // lista con todas los alumnos matriculados en una asignatura
	}

	public static boolean compruebaMatricula(int idusuario, int idasignatura) {
		Asignatura asignatura = new Asignatura();
		try {

			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion
					.prepareStatement("select * from matriculas where idasignatura=? and idusuario=?");
			ps.setInt(1, idasignatura);
			ps.setInt(2, idusuario);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				rs.close();
				st.close();
				conexion.close();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}