package dao.daoImpl;

import custom.DBOperation;
import model.Login;
import dao.LoginDAO;

import java.sql.ResultSet;
import java.util.ArrayList;

public class LoginDAOImpl implements LoginDAO {
    @Override
    public boolean save(Login entity) throws Exception {
        return DBOperation.executeUpdate("Insert Into login Value(?,?,?)",
                entity.getUsername(),
                entity.getUserType(),
                entity.getPassword()
        ) > 0;
    }

    @Override
    public boolean update(Login entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String s) throws Exception {
        return false;
    }

    @Override
    public Login search(String s) throws Exception {
        return null;
    }

    @Override
    public ArrayList<Login> getAll() throws Exception {
        return null;
    }

    @Override
    public Login checkUserLogin(String userNAme, String Password) throws Exception {
        Login user = new Login();
        ResultSet resultSet = DBOperation.executeQuery("select * from login where username='" + userNAme + "' and password='" + Password + "'");
        if (resultSet.next()) {
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            user.setUserType(resultSet.getInt("userType"));
        }
        return user;
    }
}
