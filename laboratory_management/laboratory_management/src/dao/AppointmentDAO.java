package dao;

import custom.CrudOperation;
import model.Appointment;

import java.util.ArrayList;

public interface AppointmentDAO extends CrudOperation<Appointment,Integer>{

    public ArrayList<Appointment> getUserWiseList(String username) throws Exception;

    public ArrayList<Appointment> getDateWiseList(String date) throws Exception;

    public boolean updateTime(Appointment entity) throws Exception ;

}
