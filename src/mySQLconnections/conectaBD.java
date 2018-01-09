package mySQLconnections;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

public class conectaBD {
	 @SuppressWarnings("finally")
	public static Connection conecta()
	    {
	            Connection conecta=null; 

	           try 
	              {
	                Class.forName("com.mysql.jdbc.Driver"); 
	                String servidor="jdbc:mysql://localhost/dbacademia";
	                String usuario="root";
	                String contrasenia="root";
	                conecta=(Connection)DriverManager.getConnection(servidor, usuario, contrasenia);
	              }
	              catch(ClassNotFoundException ex)
	              {
	                System.out.println(ex.getMessage());
	              }
	             catch(Exception ex)
	             {
	                System.out.println(ex.getMessage());                
	             }
	            finally
	            {
	               return conecta;
	            }
	     }
}
