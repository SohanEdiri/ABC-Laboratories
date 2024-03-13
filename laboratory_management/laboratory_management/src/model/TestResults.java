package model;

public class TestResults {

    private int testResultId;
    private int appointmentNumber;
    private String username;
    private String resultDate;
    private String doctor;
    private String technician;
    private double testFee;

    public TestResults() {
    }

    public TestResults(int testResultId, int appointmentNumber, String username, String resultDate, String doctor, String technician, double testFee) {
        this.testResultId = testResultId;
        this.appointmentNumber = appointmentNumber;
        this.username = username;
        this.resultDate = resultDate;
        this.doctor = doctor;
        this.technician = technician;
        this.testFee = testFee;
    }

    public int getTestResultId() {
        return testResultId;
    }

    public void setTestResultId(int testResultId) {
        this.testResultId = testResultId;
    }

    public int getAppointmentNumber() {
        return appointmentNumber;
    }

    public void setAppointmentNumber(int appointmentNumber) {
        this.appointmentNumber = appointmentNumber;
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

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
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

    @Override
    public String toString() {
        return "TestResults{" +
                "testResultId=" + testResultId +
                ", appointmentNumber=" + appointmentNumber +
                ", username='" + username + '\'' +
                ", resultDate='" + resultDate + '\'' +
                ", doctor='" + doctor + '\'' +
                ", technician='" + technician + '\'' +
                ", testFee=" + testFee +
                '}';
    }
}
