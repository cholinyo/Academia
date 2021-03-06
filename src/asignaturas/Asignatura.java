package asignaturas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

import usuarios.Usuario;

public class Asignatura {

	int idasignatura;
	String nombre;
	String horario; /* Array con horario */
	int profesor;
	String estado;

	public int getIdasignatura() {
		return idasignatura;
	}

	public void setIdasignatura(int idasignatura) {
		this.idasignatura = idasignatura;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getProfesor() {
		return profesor;
	}

	public void setProfesor(int profesor) {
		this.profesor = profesor;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getHorario() {
		return horario;
	}

	public static LinkedList<Asignatura> getAsignaturas() {
		LinkedList<Asignatura> listaAsignaturas = new LinkedList<Asignatura>();
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from asignaturas");
			while (rs.next()) {
				Asignatura asignatura = new Asignatura();
				asignatura.setIdasignatura(rs.getInt("idasignatura"));
				asignatura.setNombre(rs.getString("nombre"));
				asignatura.setHorario(rs.getString("horario"));
				asignatura.setProfesor(rs.getInt("profesor"));
				asignatura.setEstado(rs.getString("estado"));

				listaAsignaturas.add(asignatura);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaAsignaturas;
	}
	public static LinkedList<Asignatura> getAsignaturasProfe(int idprofesor) { //
		LinkedList<Asignatura> listaAsignaturas = new LinkedList<Asignatura>();
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from asignaturas where Profesor=?");
	        ps.setInt(1,idprofesor);
	        ResultSet rs = ps.executeQuery(); 
			while (rs.next()) {
				Asignatura asignatura = new Asignatura();
				asignatura.setIdasignatura(rs.getInt("idasignatura"));
				asignatura.setNombre(rs.getString("nombre"));
				asignatura.setHorario(rs.getString("horario"));
				asignatura.setProfesor(rs.getInt("profesor"));
				asignatura.setEstado(rs.getString("estado"));

				listaAsignaturas.add(asignatura);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaAsignaturas;
	}
	
	public static Asignatura getAsignatura(int id) {  //Datos de una asignatura
		Asignatura asignatura = new Asignatura();
		try {
			
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from asignaturas where idasignatura=?");
	        ps.setInt(1,id);
	        ResultSet rs = ps.executeQuery(); 
			while (rs.next()) {
				;
				asignatura.setIdasignatura(rs.getInt("idasignatura"));
				asignatura.setNombre(rs.getString("nombre"));
				asignatura.setHorario(rs.getString("horario"));
				asignatura.setProfesor(rs.getInt("profesor"));
				asignatura.setEstado(rs.getString("estado"));	
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return asignatura;
	}
}
