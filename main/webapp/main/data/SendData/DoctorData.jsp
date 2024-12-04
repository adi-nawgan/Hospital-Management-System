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
class DoctorData {
    int doctorId;
    String doctorName;
    int doctorAge;
    String doctorSpeciality;
    Timestamp doctorJoinedDate;
    String doctorAddress;
    String doctorPhnNo;
    float doctorSalary;

    public DoctorData(int doctorId,String doctorName,int doctorAge,String doctorSpeciality,Timestamp doctorJoinedDate,String doctorAddress,String doctorPhnNo,float doctorSalary ) {
    	this.doctorId=doctorId;
        this.doctorName=doctorName;
        this.doctorAge=doctorAge;
        this.doctorSpeciality=doctorSpeciality;
        this.doctorJoinedDate=doctorJoinedDate;
        this.doctorAddress=doctorAddress;
        this.doctorPhnNo=doctorPhnNo;
        this.doctorSalary=doctorSalary;
       
        
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("doctorId", doctorId);
        json.put("doctorName", doctorName);
        json.put("doctorAge", doctorAge);
        json.put("doctorSpeciality", doctorSpeciality);
        json.put("doctorJoinedDate", doctorJoinedDate);
        json.put("doctorAddress", doctorAddress);
        json.put("doctorPhnNo", doctorPhnNo);
        json.put("doctorSalary", doctorSalary);
        
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
    ps = con.prepareStatement("SELECT * FROM DOCTOR");
    rs = ps.executeQuery();
    while (rs.next()) {
        DoctorData doctor = new DoctorData(
        		 rs.getInt("DOCTOR_ID"),
            	rs.getString("DOCTOR_NAME"),
            	rs.getInt("DOCTOR_AGE"),
            	rs.getString("DOCTOR_SPECIALITY"),
            	rs.getTimestamp("DOCTOR_JOINED_DATE"),
            	rs.getString("DOCTOR_ADDRESS"),
            	rs.getString("DOCTOR_PH_NO"),
            	rs.getFloat("DOCTOR_SALARY")
        );
        
        jsonArray.put(doctor.toJson()); // Add each patient's data as JSON
        
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


