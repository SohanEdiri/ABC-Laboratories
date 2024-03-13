package custom;

import connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBOperation {

    private static PreparedStatement getPreparedStatement(String sql, Object... params) throws Exception {

        int paramsCount = sql.split("[?]").length - 1;
        if (paramsCount != params.length){
            throw new RuntimeException("Parameters count is mismatched");
        }

        Connection connection= DBConnection.getInstacne().getConnection();
        PreparedStatement pstm = connection.prepareStatement(sql);

        for (int i = 0; i < params.length; i++) {
            pstm.setObject(i + 1, params[i]);
        }

        return pstm;
    }

    public static ResultSet executeQuery(String sql, Object... params) throws Exception {
        return getPreparedStatement(sql, params).executeQuery();
    }

    public static int executeUpdate(String sql, Object... params) throws Exception {
        return getPreparedStatement(sql, params).executeUpdate();
    }
}
