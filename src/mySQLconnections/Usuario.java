package mySQLconnections;

public class Usuario {
	
		int idusuario;
		String login;
		String password;
		String nombre;
		String apellidos;
		String rol;
		public int getIdusuario() {
			return idusuario;
		}
		public void setIdusuario(int idusuario) {
			this.idusuario = idusuario;
		}
		public String getLogin() {
			return login;
		}
		public void setLogin(String login) {
			this.login = login;
		}
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getApellido() {
			return apellidos;
		}
		public void setApellido(String apellido) {
			this.apellidos = apellido;
		}
		public String getPassword() {
			return password;
		}
		public void setPaswword(String nombre) {
			this.password = password;
		}
		public String getRol() {
			return rol;
		}
		public void setRol(String rol) {
			this.rol = rol;
		}
}
