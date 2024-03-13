package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Object getInstance() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    private Connection connection;
    private static DBConnection dBConnection;

    private DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost/hospital_management", "root", "root");
    }

    public Connection getConnection(){
        return  connection;
    }
    public static DBConnection getInstacne() throws Exception{
        if (dBConnection==null) {
            dBConnection = new DBConnection();

        }
        return  dBConnection;
    }

}
