<%@ page import="custom.ObjectFactory" %>
<%@ page session="true" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="dao.LoginDAO" %>
<%@ page import="model.Login" %>
<%@ page import="model.Patient" %>
<%@ page import="custom.PassEnc" %>
<%@ page import="dao.PatientDAO" %>
<%
    String name = (String)request.getParameter("name");
    String nic = (String)request.getParameter("nic");
    String email = (String)request.getParameter("email");
    String action = (String)request.getParameter("action");
    String address = (String)request.getParameter("address");
    String contact = (String)request.getParameter("contact");
    String age = (String)request.getParameter("age");
    String gender = (String)request.getParameter("gender");
    String username1 = (String)request.getParameter("username1");
    String pass = (String)request.getParameter("pass");
    String user_name = (String)request.getParameter("user_name");
    String password = (String)request.getParameter("password");
%>

<%

    LoginDAO loginDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.LOGIN);
    PatientDAO patientDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.PATIENT);
    Login login=new Login();
    Patient patient = new Patient();
    PassEnc passEnc = new PassEnc();
    JSONObject responseJsonObject=new JSONObject();

    //SAVE NEW USER.............
    try {
        if (action.contains("save") && passEnc.getPassword(pass) !=null) {
            login.setUsername(username1);
            login.setPassword(passEnc.getPassword(pass));
            login.setUserType(2);

            patient.setName(name);
            patient.setNic(nic);
            patient.setContact(contact);
            patient.setAddress(address);
            patient.setEmail(email);
            patient.setUsername(username1);
            patient.setAge(Integer.parseInt(age));
            patient.setGender(gender);

            boolean save = loginDAO.save(login);
            if (save){
                boolean save2 = patientDAO.save(patient);
                if (save2) {
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

    //LOGIN USER.............
    try {
        if (action.contains("login") && passEnc.getPassword(password) !=null) {
            Login user = loginDAO.checkUserLogin(user_name, passEnc.getPassword(password));

                session.setAttribute("username" , user.getUsername());
                session.setAttribute("password" , user.getPassword());
                session.setAttribute("userType" , user.getUserType());

                if (user.getUserType() == 2){
                    patient = patientDAO.searchbyusername(user_name);
                    System.out.println(patient.toString());
                    session.setAttribute("nic" , patient.getNic());
                    session.setAttribute("contact" , patient.getContact());
                    session.setAttribute("address" , patient.getAddress());
                    session.setAttribute("name" , patient.getName());
                    session.setAttribute("email" , patient.getEmail());
                    session.setAttribute("nic" , patient.getNic());
                    session.setAttribute("gender" , patient.getGender());
                    session.setAttribute("age" , patient.getAge());
                }

                response.setStatus(200);
                responseJsonObject.put("code", 200);
                responseJsonObject.put("status", "success");

            response.setHeader("Pragma", "no-cache");
            response.setHeader("Content-Type", "application/json");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.getWriter().write(responseJsonObject.toString());


        }
    }catch (Exception e){
        e.printStackTrace();
    }

    //UPDATE USER INFO.............
//    try {
//        if (action.contains("updateInfo")) {
//            userDto.setF_name(f_name);
//            userDto.setL_name(l_name);
//            userDto.setNic(nic);
//            userDto.setAddress(address);
//            userDto.setContact(contact);
//            userDto.setUsername(user_name);
//
//            boolean update = userDao.update(userDto);
//            if (update){
//                response.setStatus(200);
//                responseJsonObject.put("code", 200);
//                responseJsonObject.put("status", "success");
//
//                session.setAttribute("nic" , userDto.getNic());
//                session.setAttribute("contact" , userDto.getContact());
//                session.setAttribute("address" , userDto.getAddress());
//                session.setAttribute("fName" , userDto.getF_name());
//                session.setAttribute("lName" , userDto.getL_name());
//
//            }else {
//                response.setStatus(200);
//                responseJsonObject.put("code", 200);
//                responseJsonObject.put("status", "error");
//            }
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Content-Type", "application/json");
//            response.setHeader("Access-Control-Allow-Origin", "*");
//            response.getWriter().write(responseJsonObject.toString());
//        }
//    }catch (Exception e){
//        e.printStackTrace();
//    }

    //UPDATE LOGIN INFO.............
//    if(action.equalsIgnoreCase("updatePassword")){
//       try {
//           String currentPw=(String)session.getAttribute("password");
//           if (currentPw.equalsIgnoreCase(passEnc.getPassword(currentPassword))){
//
//
//               userDto.setUsername(user_name);
//               userDto.setPassword(passEnc.getPassword(password));
//               boolean update = userDao.updateUserPassword(userDto);
//               if (update){
//                   response.setStatus(200);
//                   responseJsonObject.put("code", 200);
//                   responseJsonObject.put("status", "success");
//
//                   session.setAttribute("password" , userDto.getPassword());
//               }else {
//                   response.setStatus(200);
//                   responseJsonObject.put("code", 200);
//                   responseJsonObject.put("status", "error");
//               }
//
//
//           }else {
//
//               response.setStatus(200);
//               responseJsonObject.put("code", 200);
//               responseJsonObject.put("status", "currentPwNothMatch");
//
//           }
//           response.setHeader("Pragma", "no-cache");
//           response.setHeader("Content-Type", "application/json");
//           response.setHeader("Access-Control-Allow-Origin", "*");
//           response.getWriter().write(responseJsonObject.toString());
//       }catch (Exception e){
//           e.printStackTrace();
//       }
//    }

%>

