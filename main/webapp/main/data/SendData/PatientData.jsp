<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.google.gson.Gson" %>


<%
response.setContentType("application/json"); // Ensure content type is JSON
response.setCharacterEncoding("UTF-8");
class PatientData {
    int patientId;
    String patientName;
    int patientAge;
    String patientPhnNo;
    String patientEmail;
    String patientDisease;
    Timestamp patientAdmittedOn;
    Timestamp patientLeftOn;
    String patientWardType;
    String patientAddress;
    String patientBloodType;
    

    public PatientData(int patientId, String patientName, int patientAge, String patientPhnNo, String patientEmail,
                       String patientDisease, Timestamp patientAdmittedOn, Timestamp patientLeftOn,
                       String patientWardType, String patientAddress, String patientBloodType) {
        this.patientId = patientId;
        this.patientName = patientName;
        this.patientAge = patientAge;
        this.patientPhnNo = patientPhnNo;
        this.patientEmail = patientEmail;
        this.patientDisease = patientDisease;
        this.patientAdmittedOn = patientAdmittedOn;
        this.patientLeftOn = patientLeftOn;
        this.patientWardType = patientWardType;
        this.patientAddress = patientAddress;
        this.patientBloodType = patientBloodType;
        
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("patientId", patientId);
        json.put("patientName", patientName);
        json.put("patientAge", patientAge);
        json.put("patientPhnNo", patientPhnNo);
        json.put("patientEmail", patientEmail);
        json.put("patientDisease", patientDisease);
        json.put("patientAdmittedOn", patientAdmittedOn);
        json.put("patientLeftOn", patientLeftOn);
        json.put("patientWardType", patientWardType);
        json.put("patientAddress", patientAddress);
        json.put("patientBloodType", patientBloodType);
        
        return json;
    }
   /*  HashMap<Integer, PatientData> hashmapdata = new HashMap<>();
    Gson gson = new Gson();
    String jsonResponse = gson.toJson(hashmapdata);
    out.println(" "+gson.toJson(hashmapdata));
    /* out.print(jsonResponse); */ // Send JSON data to client
    /* out.flush(); */ 
}

JSONArray jsonArray = new JSONArray();

try {
    ps = con.prepareStatement("SELECT * FROM PATIENT");
    rs = ps.executeQuery();
    while (rs.next()) {
        PatientData patient = new PatientData(
            rs.getInt("PATIENT_ID"),
            rs.getString("PATIENT_NAME"),
            rs.getInt("PATIENT_AGE"),
            rs.getString("PATIENT_PH_NO"),
            rs.getString("PATIENT_EMAIL"),
            rs.getString("PATIENT_DISEASE"),
            rs.getTimestamp("PATIENT_ADMITTED_ON"),
            rs.getTimestamp("PATIENT_LEFT_ON"),
            rs.getString("PATIENT_WARD_TYPE"),
            rs.getString("PATIENT_ADDRESS"),
            rs.getString("PATIENT_BLOOD_TYPE")
        );
        
        jsonArray.put(patient.toJson()); // Add each patient's data as JSON
        
    }

    // Output JSON array as the response
    out.print(jsonArray.toString());
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>


