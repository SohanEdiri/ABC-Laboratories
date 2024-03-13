package dao.daoImpl;

import custom.DBOperation;
import model.Appointment;
import dao.AppointmentDAO;

import java.sql.ResultSet;
import java.util.ArrayList;

public class AppointmentDAOImpl implements AppointmentDAO {
    @Override
    public boolean save(Appointment entity) throws Exception {
        return DBOperation.executeUpdate("Insert Into appointment Values(?,?,?,?,?,?,?,?,?)",
                0,
                entity.getServiceType(),
                entity.getAppointmentDate(),
                entity.getAppointmentTime(),
                entity.getAppointmentFee(),
                entity.getDoctor(),
                entity.getUsername(),
                1,
                entity.getMessage()
        ) > 0;
    }

    @Override
    public boolean update(Appointment entity) throws Exception {
        return DBOperation.executeUpdate("UPDATE appointment set status = 0 " +
                "where appointmentNumber='"+entity.getAppointmentNumber()+"'"
        ) > 0;
    }

    @Override
    public boolean delete(Integer integer) throws Exception {
        return false;
    }

    @Override
    public Appointment search(Integer integer) throws Exception {
        return null;
    }

    @Override
    public ArrayList<Appointment> getAll() throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT * FROM appointment where status='1'");
        ArrayList<Appointment>appointments=new ArrayList<Appointment>();
        while (rs.next()){
            Appointment properties = new Appointment();
            properties.setAppointmentNumber(rs.getInt("appointmentNumber"));
            properties.setServiceType(rs.getString("serviceType"));
            properties.setAppointmentDate(rs.getString("appointmentDate"));
            properties.setAppointmentTime(rs.getString("appointmentTime"));
            properties.setAppointmentFee(rs.getDouble("appointmentFee"));
            properties.setDoctor(rs.getString("doctor"));
            properties.setUsername(rs.getString("username"));
            properties.setStatus(rs.getInt("status"));
            properties.setMessage(rs.getString("message"));
            appointments.add(properties);
        }

        return appointments;
    }

    @Override
    public ArrayList<Appointment> getUserWiseList(String username) throws Exception {
        ResultSet rs = DBOperation.executeQuery("SELECT * FROM appointment where status='1' and username = '" + username + "'");
        ArrayList<Appointment>appointments=new ArrayList<Appointment>();
        while (rs.next()){
            Appointment properties = new Appointment();
            properties.setAppointmentNumber(rs.getInt("appointmentNumber"));
            properties.setServiceType(rs.getString("serviceType"));
            properties.setAppointmentDate(rs.getString("appointmentDate"));
            properties.setAppointmentTime(rs.getString("appointmentTime"));
            properties.setAppointmentFee(rs.getDouble("appointmentFee"));
            properties.setDoctor(rs.getString("doctor"));
            properties.setUsername(rs.getString("username"));
            properties.setStatus(rs.getInt("status"));
            properties.setMessage(rs.getString("message"));
            appointments.add(properties);
        }

        return appointments;
    }

    @Override
    public ArrayList<Appointment> getDateWiseList(String date) throws Exception {
        return null;
    }

    @Override
    public boolean updateTime(Appointment entity) throws Exception {
        return DBOperation.executeUpdate("UPDATE appointment set appointmentTime = '"+entity.getAppointmentTime()+"'"+
                "where appointmentNumber='"+entity.getAppointmentNumber()+"'"
        ) > 0;
    }
}
