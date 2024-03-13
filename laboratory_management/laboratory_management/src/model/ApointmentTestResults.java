package model;

public class ApointmentTestResults {

    private int appointmentNumber;
    private String serviceType;
    private String appointmentDate;
    private String appointmentTime;
    private double appointmentFee;
    private String doctor;
    private int status;
    private String message;
    private int testResultId;
    private String username;
    private String patientName;
    private String patientContact;
    private String patientEmail;
    private String resultDate;
    private String technician;
    private double testFee;

    public ApointmentTestResults() {
    }

    public ApointmentTestResults(int appointmentNumber, String serviceType, String appointmentDate, String doctor, String resultDate, String technician, double testFee) {
        this.appointmentNumber = appointmentNumber;
        this.serviceType = serviceType;
        this.appointmentDate = appointmentDate;
        this.doctor = doctor;
        this.resultDate = resultDate;
        this.technician = technician;
        this.testFee = testFee;
    }

    public ApointmentTestResults(int appointmentNumber, String serviceType, String appointmentDate, String doctor, String resultDate, String technician, double testFee, String patientName, String patientContact, String patientEmail) {
        this.appointmentNumber = appointmentNumber;
        this.serviceType = serviceType;
        this.appointmentDate = appointmentDate;
        this.doctor = doctor;
        this.resultDate = resultDate;
        this.technician = technician;
        this.testFee = testFee;
        this.patientName = patientName;
        this.patientContact = patientContact;
        this.patientEmail = patientEmail;
    }

    public ApointmentTestResults(int appointmentNumber, String serviceType, String appointmentDate, String appointmentTime, double appointmentFee, String doctor, int status, String message, int testResultId, String username, String resultDate, String technician, double testFee) {
        this.appointmentNumber = appointmentNumber;
        this.serviceType = serviceType;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.appointmentFee = appointmentFee;
        this.doctor = doctor;
        this.status = status;
        this.message = message;
        this.testResultId = testResultId;
        this.username = username;
        this.resultDate = resultDate;
        this.technician = technician;
        this.testFee = testFee;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientContact() {
        return patientContact;
    }

    public void setPatientContact(String patientContact) {
        this.patientContact = patientContact;
    }

    public String getPatientEmail() {
        return patientEmail;
    }

    public void setPatientEmail(String patientEmail) {
        this.patientEmail = patientEmail;
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

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getTestResultId() {
        return testResultId;
    }

    public void setTestResultId(int testResultId) {
        this.testResultId = testResultId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getResultDate() {
        return resultDate;
    }

    public void setResultDate(String resultDate) {
        this.resultDate = resultDate;
    }

    public String getTechnician() {
        return technician;
    }

    public void setTechnician(String technician) {
        this.technician = technician;
    }

    public double getTestFee() {
        return testFee;
    }

    public void setTestFee(double testFee) {
        this.testFee = testFee;
    }
}
