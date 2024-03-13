package model;

public class Appointment {

    private int appointmentNumber;
    private String serviceType;
    private String appointmentDate;
    private String appointmentTime;
    private double appointmentFee;
    private String doctor;
    private String username;
    private int status;
    private String message;

    public Appointment() {
    }

    public Appointment(int appointmentNumber, String serviceType, String appointmentDate, String appointmentTime, double appointmentFee, String doctor, String username, int status, String message) {
        this.appointmentNumber = appointmentNumber;
        this.serviceType = serviceType;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.appointmentFee = appointmentFee;
        this.doctor = doctor;
        this.username = username;
        this.status = status;
        this.message = message;
    }

    public int getAppointmentNumber() {
        return appointmentNumber;
    }

    public void setAppointmentNumber(int appointmentNumber) {
        this.appointmentNumber = appointmentNumber;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public double getAppointmentFee() {
        return appointmentFee;
    }

    public void setAppointmentFee(double appointmentFee) {
        this.appointmentFee = appointmentFee;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "appointmentNumber=" + appointmentNumber +
                ", serviceType='" + serviceType + '\'' +
                ", appointmentDate='" + appointmentDate + '\'' +
                ", appointmentFee=" + appointmentFee +
                ", doctor='" + doctor + '\'' +
                ", username='" + username + '\'' +
                ", message='" + message + '\'' +
                ", status=" + status +
                '}';
    }
}

