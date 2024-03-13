package dao;

import model.ApointmentTestResults;


import java.util.ArrayList;

public interface QueryDAO {
    public ArrayList<ApointmentTestResults> getAll() throws Exception;

    public ArrayList<ApointmentTestResults> getAllPendingAppointments() throws Exception;

    public ArrayList<ApointmentTestResults> getUserWiseResults(String username) throws Exception;

}
