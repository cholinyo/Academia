package asignaturas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class PeticionTutoria {
	int idpeticion;
	int idprofesor;
	int idalumno;
	String dia;
	int hora;
	String estado;
	String obsservaciones;

	public int getIdpeticion() {
		return idpeticion;
	}

	public void setIdpeticion(int idpeticion) {
		this.idpeticion = idpeticion;
	}

	public int getIdprofesor() {
		return idprofesor;
	}

	public void setIdprofesor(int idprofesor) {
		this.idprofesor = idprofesor;
	}

	public int getIdalumno() {
		return idalumno;
	}

	public void setIdalumno(int idalumno) {
		this.idalumno = idalumno;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public int getHora() {
		return hora;
	}

	public void setHora(int hora) {
		this.hora = hora;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getObsservaciones() {
		return obsservaciones;
	}

	public void setObsservaciones(String obsservaciones) {
		this.obsservaciones = obsservaciones;
	}

	public static LinkedList<PeticionTutoria> getPeticionesAlumno(int idalumno) { // Devuelve las asignaturar
																					// matriculadas por
		// un usuario

		LinkedList<PeticionTutoria> listapeticiones = new LinkedList<PeticionTutoria>();

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from peticionestutorias where idalumno=?");
			ps.setInt(1, idalumno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				PeticionTutoria peticion = new PeticionTutoria();

				peticion.setIdpeticion(rs.getInt("idpeticion"));
				peticion.setIdprofesor(rs.getInt("idprofesor"));
				peticion.setIdalumno(rs.getInt("idalumno"));
				peticion.setDia(rs.getString("dia"));
				peticion.setHora(rs.getInt("hora"));
				peticion.setEstado(rs.getString("estado"));

				listapeticiones.add(peticion);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listapeticiones; // lista con todas peticiones de un alumno de tutorias.
	}

	public static LinkedList<PeticionTutoria> getPeticionesProfesor(int idprofesor) { // Devuelve las asignaturar
		// matriculadas por
		// un usuario

		LinkedList<PeticionTutoria> listapeticiones = new LinkedList<PeticionTutoria>();

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/dbacademia", "root", "root");
			Statement st = conexion.createStatement();
			PreparedStatement ps = conexion.prepareStatement("select * from peticionestutorias where idprofesor=?");
			ps.setInt(1, idprofesor);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				PeticionTutoria peticion = new PeticionTutoria();

				peticion.setIdpeticion(rs.getInt("idpeticion"));
				peticion.setIdprofesor(rs.getInt("idprofesor"));
				peticion.setIdalumno(rs.getInt("idalumno"));
				peticion.setDia(rs.getString("dia"));
				peticion.setHora(rs.getInt("hora"));
				peticion.setEstado(rs.getString("estado"));
				peticion.setObsservaciones("obsservaciones");

				listapeticiones.add(peticion);
			}
			rs.close();
			st.close();
			conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listapeticiones; // lista con todas peticiones de un alumno de tutorias.
	}

}
