package dao;

import custom.CrudOperation;
import model.Login;

public interface LoginDAO extends CrudOperation<Login,String> {
    public Login checkUserLogin(String userNAme,String Password)throws Exception;
}
