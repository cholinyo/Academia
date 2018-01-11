package mySQLconnections;

import java.sql.*;
import java.util.LinkedList;

public class ConsultaUsuarios {

	public static LinkedList<Usuario> getUsuarios()
	   {
	      LinkedList<Usuario> listaUsuarios=new LinkedList<Usuario>();
	      try
	      {
	    	  	Class.forName("org.gjt.mm.mysql.Driver");
	    	  	Connection conexion = DriverManager.getConnection ("jdbc:mysql://localhost/dbacademia","root", "root");
	        Statement st = conexion.createStatement();
	        ResultSet rs = st.executeQuery("select * from usuarios" );
	         while (rs.next())
	         {
	            Usuario usuario = new Usuario();
	            usuario.setIdusuario(rs.getInt("idusuario"));
	            usuario.setLogin(rs.getString("login"));
	            usuario.setNombre(rs.getString("nombre"));
	            usuario.setApellido(rs.getString("apellidos"));
	            usuario.setRol(rs.getString("rol"));
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
	public static LinkedList<Usuario> getUltimosUsuarios()
	   {
	      LinkedList<Usuario> listaUsuarios=new LinkedList<Usuario>();
	      try
	      {
	    	  	Class.forName("org.gjt.mm.mysql.Driver");
	    	  	Connection conexion = DriverManager.getConnection ("jdbc:mysql://localhost/dbacademia","root", "root");
	        Statement st = conexion.createStatement();
	        ResultSet rs = st.executeQuery("select * from usuarios ORDER by idusuario desc LIMIT 8" );
	         while (rs.next())
	         {
	            Usuario usuario = new Usuario();
	            usuario.setIdusuario(rs.getInt("idusuario"));
	            usuario.setLogin(rs.getString("login"));
	            usuario.setNombre(rs.getString("nombre"));
	            usuario.setApellido(rs.getString("apellidos"));
	            usuario.setRol(rs.getString("rol"));
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
	public static LinkedList<Usuario> getUsuariostipo(String tipo)
	   {
	      LinkedList<Usuario> listaUsuarios=new LinkedList<Usuario>();
	      try
	      {
	    	  	Class.forName("org.gjt.mm.mysql.Driver");
	    	  	Connection conexion = DriverManager.getConnection ("jdbc:mysql://localhost/dbacademia","root", "root");
	        Statement st = conexion.createStatement();
	        ResultSet rs = st.executeQuery("select * from usuarios where rol='" + tipo + "'");
	         while (rs.next())
	         {
	            Usuario usuario = new Usuario();
	            usuario.setIdusuario(rs.getInt("idusuario"));
	            usuario.setLogin(rs.getString("login"));
	            usuario.setNombre(rs.getString("nombre"));
	            usuario.setApellido(rs.getString("apellidos"));
	            usuario.setRol(rs.getString("rol"));
	            listaUsuarios.add(usuario);
	         }
	         rs.close();
	         st.close();
	         conexion.close();
	      }
	      catch (Exception e)
	      {
	         e.printStackTrace();
	      }
	      return listaUsuarios;
	   }
}