<%@ page import="dao.AppointmentDAO" %>
<%@ page import="custom.ObjectFactory" %>
<%@ page import="model.Appointment" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="mailModule.SendMail" %><%

    String action = (String)request.getParameter("action");
    String appointmentdate = (String)request.getParameter("appointmentdate");
    String service = (String)request.getParameter("service");
    String doctor = (String)request.getParameter("doctor");
    String message = (String)request.getParameter("message");
    String appointmentFee = (String)request.getParameter("appointmentFee");


    String appointmentTime = (String)request.getParameter("appointmentTime");
    String appointmentno = (String)request.getParameter("appointmentno");
    String appointmentdte = (String)request.getParameter("appointmentdte");
    String testtype = (String)request.getParameter("testtype");
    String doc = (String)request.getParameter("doc");
    String fee = (String)request.getParameter("fee");
    String pname = (String)request.getParameter("pname");
    String email = (String)request.getParameter("email");



    AppointmentDAO appointmentDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.APPOINTMENT);
    Appointment appointment = new Appointment();
    JSONObject responseJsonObject=new JSONObject();

    //SAVE NEW USER.............
    try {
        if (action.contains("save")) {

            String username = (String) session.getAttribute("username");
            if (username == null || username == ""){
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "error");
                return;

            }

            appointment.setUsername(username);
            appointment.setServiceType(service);
            appointment.setAppointmentDate(appointmentdate);
            appointment.setAppointmentTime("");
            appointment.setAppointmentFee(2000.00);
            appointment.setDoctor(doctor);
            appointment.setStatus(1);
            appointment.setMessage(message);
            appointment.setAppointmentFee(Double.parseDouble(appointmentFee));

            boolean save = appointmentDAO.save(appointment);
            if (save){
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "success");

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

    //SEND MAIL & SET TIME
    try {
        if (action.contains("sendMail")) {

            String username = (String) session.getAttribute("username");
            if (username == null || username == ""){
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "error");
                return;

            }

            appointment.setAppointmentTime(appointmentTime);
            appointment.setAppointmentNumber(Integer.parseInt(appointmentno));
            appointment.setAppointmentDate(appointmentdte);
            appointment.setServiceType(testtype);
            appointment.setDoctor(doc);
            appointment.setMessage(pname);
            appointment.setAppointmentFee(Double.parseDouble(fee));


            boolean update = appointmentDAO.updateTime(appointment);
            if (update){
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "success");


                System.out.println("=================");
                SendMail sendMail = new SendMail();
                sendMail.sendMail(email,appointment);



            }else {
                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "success");
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
