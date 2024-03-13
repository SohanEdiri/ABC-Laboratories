package dao.daoImpl;

import custom.DBOperation;
import model.Patient;
import dao.PatientDAO;

import java.sql.ResultSet;
import java.util.ArrayList;

public class PatientDAOImpl implements PatientDAO {
    @Override
    public boolean save(Patient entity) throws Exception {
        return DBOperation.executeUpdate("Insert Into patient Values(?,?,?,?,?,?,?,?,?)",
                0,
                entity.getName(),
                entity.getAddress(),
                entity.getEmail(),
                entity.getContact(),
                entity.getUsername(),
                entity.getNic(),
                entity.getAge(),
                entity.getGender()
        ) > 0;
    }

    @Override
    public boolean update(Patient entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(Integer integer) throws Exception {
        return false;
    }

    @Override
    public Patient search(Integer integer) throws Exception {
        return null;
    }

    @Override
    public ArrayList<Patient> getAll() throws Exception {
        return null;
    }

    @Override
    public Patient searchbyusername(String username) throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT * FROM patient WHERE username = '" + username + "'");
        Patient patient = new Patient();
        while (rs.next()){
            patient.setPatientId(rs.getInt("patientId"));
            patient.setName(rs.getString("name"));
            patient.setAddress(rs.getString("address"));
            patient.setEmail(rs.getString("email"));
            patient.setContact(rs.getString("contact"));
            patient.setUsername(rs.getString("username"));
            patient.setNic(rs.getString("nic"));
            patient.setAge(rs.getInt("age"));
        }
        return patient;
    }
}
