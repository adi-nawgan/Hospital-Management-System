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
class WardData {
    int srNo;
    int FloorNo;
    String wardType;
    int wardIsAssigned;
    int patientId;
    int doctorId;
    int staffId;
    String wardId;

    public WardData(int srNo,int FloorNo,String wardType,int wardIsAssigned,int patientId,int doctorId,int staffId,String wardId) {
    	this.srNo=srNo;
        this.FloorNo=FloorNo;
        this.wardType=wardType;
        this.wardIsAssigned=wardIsAssigned;
        this.patientId=patientId;
        this.doctorId=doctorId;
        this.staffId=staffId;
        this.wardId=wardId;
       
        
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("srNo", srNo);
        json.put("FloorNo", FloorNo);
        json.put("wardType", wardType);
        json.put("wardIsAssigned", wardIsAssigned);
        json.put("patientId", patientId);
        json.put("doctorId", doctorId);
        json.put("staffId", staffId);
        json.put("wardId", wardId);
        
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
    ps = con.prepareStatement("SELECT * FROM WARD");
    rs = ps.executeQuery();
    while (rs.next()) {
        WardData ward = new WardData(
        		 rs.getInt("SR_NO"),
        		 rs.getInt("FLOOR_NO"),
            	rs.getString("WARD_TYPE"),
            	rs.getInt("WARD_IS_ASSIGNED"),
            	rs.getInt("PATIENT_ID"),
            	rs.getInt("DOCTOR_ID"),
            	rs.getInt("STAFF_ID"),
            	rs.getString("WARD_ID")
            	
        );
        
        jsonArray.put(ward.toJson()); // Add each patient's data as JSON
        
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


