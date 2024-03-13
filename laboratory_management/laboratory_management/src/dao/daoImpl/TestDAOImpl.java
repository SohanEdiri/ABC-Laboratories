package dao.daoImpl;

import custom.DBOperation;
import model.TestResults;
import dao.TestDAO;

import java.sql.ResultSet;
import java.util.ArrayList;

public class TestDAOImpl implements TestDAO {
    @Override
    public boolean save(TestResults entity) throws Exception {
        return DBOperation.executeUpdate("Insert Into testResults Values(?,?,?,?,?,?,?)",
                0,
                entity.getAppointmentNumber(),
                entity.getUsername(),
                entity.getResultDate(),
                entity.getDoctor(),
                entity.getTechnician(),
                entity.getTestFee()
        ) > 0;
    }

    @Override
    public boolean update(TestResults entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(Integer integer) throws Exception {
        return false;
    }

    @Override
    public TestResults search(Integer integer) throws Exception {
        return null;
    }

    @Override
    public ArrayList<TestResults> getAll() throws Exception {
        return null;
    }

    @Override
    public int getNextAvailableId() throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT testResultsid FROM testResults order by testResultsid desc limit 1");
        int testId=1;
        while (rs.next()){
            testId=rs.getInt("testResultsid");
        }
        return testId;
    }
}
