package dao;

import custom.CrudOperation;
import model.Patient;

public interface PatientDAO extends CrudOperation<Patient,Integer> {

    public Patient searchbyusername(String username) throws Exception;
}
