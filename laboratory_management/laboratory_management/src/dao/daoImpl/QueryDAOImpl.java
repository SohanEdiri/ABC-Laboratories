package dao.daoImpl;

import custom.DBOperation;
import dao.QueryDAO;
import model.ApointmentTestResults;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QueryDAOImpl implements QueryDAO{

    @Override
    public ArrayList<ApointmentTestResults> getAll() throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT p.name, p.username, p.contact, p.email, a.appointmentNumber, a.appointmentFee, a.serviceType, a.appointmentDate, a.doctor, t.testResultsid, t.resultDate, t.technician, t.testFee  FROM patient p inner join appointment a on p.username=a.username inner join testresults t on a.appointmentNumber = t.appointmentNumber");
        ArrayList<ApointmentTestResults>appointments=new ArrayList<ApointmentTestResults>();
        while (rs.next()){
            ApointmentTestResults properties = new ApointmentTestResults();
            properties.setAppointmentNumber(rs.getInt("appointmentNumber"));
            properties.setTestResultId(rs.getInt("testResultsid"));
            properties.setServiceType(rs.getString("serviceType"));
            properties.setAppointmentDate(rs.getString("appointmentDate"));
            properties.setTechnician(rs.getString("technician"));
            properties.setResultDate(rs.getString("resultDate"));
            properties.setAppointmentFee(rs.getDouble("appointmentFee"));
            properties.setDoctor(rs.getString("doctor"));
            properties.setUsername(rs.getString("username"));
            appointments.add(properties);
        }

        return appointments;
    }

    @Override
    public ArrayList<ApointmentTestResults> getAllPendingAppointments() throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT p.name, p.contact, p.email, p.username, a.appointmentNumber, a.appointmentTime, a.serviceType, a.appointmentDate, a.appointmentFee, a.doctor  FROM patient p inner join appointment a on p.username=a.username and a.status=1");
        ArrayList<ApointmentTestResults>appointments=new ArrayList<ApointmentTestResults>();
        while (rs.next()){
            ApointmentTestResults properties = new ApointmentTestResults();
            properties.setAppointmentNumber(rs.getInt("appointmentNumber"));
            properties.setServiceType(rs.getString("serviceType"));
            properties.setAppointmentDate(rs.getString("appointmentDate"));
            properties.setAppointmentTime(rs.getString("appointmentTime"));
            properties.setAppointmentFee(rs.getDouble("appointmentFee"));
            properties.setDoctor(rs.getString("doctor"));
            properties.setUsername(rs.getString("username"));
            properties.setPatientName(rs.getString("name"));
            properties.setPatientContact(rs.getString("contact"));
            properties.setPatientEmail(rs.getString("email"));
            appointments.add(properties);
        }

        return appointments;
    }

    @Override
    public ArrayList<ApointmentTestResults> getUserWiseResults(String username) throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT t.*,a.serviceType, a.appointmentDate  FROM testResults t inner join appointment a on t.appointmentNumber = a.appointmentNumber where t.user_name = '" + username + "'");
        ArrayList<ApointmentTestResults>appointments=new ArrayList<ApointmentTestResults>();
        while (rs.next()){
            ApointmentTestResults properties = new ApointmentTestResults();
            properties.setTestResultId(rs.getInt("testResultsid"));
            properties.setAppointmentNumber(rs.getInt("appointmentNumber"));
            properties.setAppointmentDate(rs.getString("appointmentDate"));
            properties.setUsername(rs.getString("user_name"));
            properties.setResultDate(rs.getString("resultDate"));
            properties.setDoctor(rs.getString("doctor"));
            properties.setTechnician(rs.getString("technician"));
            properties.setServiceType(rs.getString("serviceType"));
            appointments.add(properties);
        }

        return appointments;
    }
}
