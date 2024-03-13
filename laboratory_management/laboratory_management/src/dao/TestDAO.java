package dao;

import custom.CrudOperation;
import model.TestResults;

public interface TestDAO extends CrudOperation<TestResults,Integer> {

    public int getNextAvailableId() throws Exception;

}
