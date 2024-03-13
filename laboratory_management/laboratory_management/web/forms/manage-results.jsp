<%@ page import="custom.ObjectFactory" %>
<%@ page session="true" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="dao.LoginDAO" %>
<%@ page import="model.Login" %>
<%@ page import="model.Patient" %>
<%@ page import="custom.PassEnc" %>
<%@ page import="dao.PatientDAO" %>
<%@ page import="dao.TestDAO" %>
<%@ page import="model.TestResults" %>
<%@ page import="dao.AppointmentDAO" %>
<%@ page import="model.Appointment" %>
<%
    String action = (String)request.getParameter("action");
    String appointmentNumber = (String)request.getParameter("appointmentNumber");
    String username = (String)request.getParameter("username");
    String resultDate = (String)request.getParameter("resultDate");
    String doctor = (String)request.getParameter("doctor");
    String technician = (String)request.getParameter("technician");
    String testFee = (String)request.getParameter("testFee");
%>

<%

    TestDAO testDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.TESTRESULTS);
    AppointmentDAO appointmentDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.APPOINTMENT);
    TestResults testResults = new TestResults();
    Appointment appointment = new Appointment();
    JSONObject responseJsonObject=new JSONObject();

    //SAVE NEW Results.............
    try {
        if (action.contains("save")) {
            testResults.setAppointmentNumber(Integer.parseInt(appointmentNumber));
            testResults.setUsername(username);
            testResults.setResultDate(resultDate);
            testResults.setDoctor(doctor);
            testResults.setTechnician(technician);
            testResults.setTestFee(Double.parseDouble(testFee));
            appointment.setAppointmentNumber(Integer.parseInt(appointmentNumber));

            boolean save = testDAO.save(testResults);
            if (save){
                boolean update = appointmentDAO.update(appointment);
                if (update) {
                    response.setStatus(200);
                    responseJsonObject.put("code", 200);
                    responseJsonObject.put("status", "success");
                }else {
                    response.setStatus(200);
                    responseJsonObject.put("code", 200);
                    responseJsonObject.put("status", "error");
                }
            }else {
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "error");
            }
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Content-Type", "application/json");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.getWriter().write(responseJsonObject.toString());

        }
    }catch (Exception e){
        e.printStackTrace();
        // write log...
    }

%>

