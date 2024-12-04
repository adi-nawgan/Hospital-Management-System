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
class OverviewData {
    int employeeCount = 0;
    int patientCount = 0;
    int wardCount = 0;
    int paymentCount = 0;
    int medicineCount = 0;
    int doctorCount = 0;

    public OverviewData(int employeeCount,int patientCount,int wardCount,int paymentCount ,int medicineCount,int doctorCount) {
    	this.employeeCount=employeeCount;
        this.patientCount=patientCount;
        this.wardCount=wardCount;
        this.paymentCount=paymentCount;
        this.medicineCount=medicineCount; 
        this.doctorCount=doctorCount; 
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("employeeCount", employeeCount);
        json.put("patientCount", patientCount);
        json.put("wardCount", wardCount);
        json.put("paymentCount", paymentCount);
        json.put("medicineCount", medicineCount);
        json.put("doctorCount",doctorCount);
        return json;
    }
}

JSONArray jsonArray = new JSONArray();

try {
	int employeeCount = 0;
    int patientCount = 0;
    int wardCount = 0;
    int paymentCount = 0;
    int medicineCount = 0;
    int doctorCount = 0;
        ps = con.prepareStatement("SELECT COUNT(STAFF_ID) as staff_count FROM STAFF");
        rs = ps.executeQuery();
        while (rs.next()) {
            
            employeeCount = rs.getInt("staff_count");
            
        }
    ps = con.prepareStatement("SELECT COUNT(PATIENT_ID) as patient_count FROM PATIENT");
    rs = ps.executeQuery();
    while (rs.next()) {
        
        patientCount = rs.getInt("patient_count");
        
    }
        ps = con.prepareStatement("SELECT COUNT(SR_NO) as ward_count FROM WARD");
        rs = ps.executeQuery();
        while (rs.next()) {
            
            wardCount = rs.getInt("ward_count");
            
        }
    ps = con.prepareStatement("SELECT COUNT(PAYMENT_ID) as payment_count FROM PAYMENT");
    rs = ps.executeQuery();
    while (rs.next()) {
        
        paymentCount = rs.getInt("payment_count");
        
    }
        ps = con.prepareStatement("SELECT COUNT(MEDICINE_ID) as medicine_count FROM MEDICINE");
        rs = ps.executeQuery();
        while (rs.next()) {
            
            medicineCount = rs.getInt("medicine_count");
            
    }
        ps = con.prepareStatement("SELECT COUNT(DOCTOR_ID) as doctor_count FROM DOCTOR");
        rs = ps.executeQuery();
        while (rs.next()) {
            
            doctorCount = rs.getInt("doctor_count");
            
    }
         OverviewData overview = new OverviewData(employeeCount,patientCount,wardCount,paymentCount,medicineCount,doctorCount);
    jsonArray.put(overview.toJson());
    
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


