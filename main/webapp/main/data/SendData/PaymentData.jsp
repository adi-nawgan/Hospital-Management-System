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
class PaymentData {
    int paymentId;
    float totalFees;
    float feesPaid;
    float feesDue;
    String paymentStatus;
    int wardId;
    String wardType;
    int patientId;

    public PaymentData(int paymentId,float totalFees,float feesPaid,float feesDue,String paymentStatus,int wardId,String wardType,int patientId ) {
       this.paymentId=paymentId;
       this.totalFees=totalFees;
       this.feesPaid=feesPaid;
       this.feesDue=feesDue;
       this.paymentStatus=paymentStatus;
       this.wardId=wardId;
       this.wardType=wardType;
    	this.patientId = patientId;
       
        
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("paymentId", paymentId);
        json.put("totalFees", totalFees);
        json.put("feesPaid", feesPaid);
        json.put("feesDue", feesDue);
        json.put("paymentStatus", paymentStatus);
        json.put("wardId", wardId);
        json.put("wardType", wardType);
        json.put("patientId", patientId);
        
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
    ps = con.prepareStatement("SELECT * FROM PAYMENT");
    rs = ps.executeQuery();
    while (rs.next()) {
        PaymentData payment = new PaymentData(
        		 rs.getInt("PAYMENT_ID"),
        		 rs.getFloat("TOTAL_FEES"),
        		 rs.getFloat("FEES_PAID"),
        		 rs.getFloat("FEES_DUE"),
            	rs.getString("PAYMENT_STATUS"),
            	rs.getInt("WARD_ID"),
            	rs.getString("WARD_TYPE"),
        		rs.getInt("PATIENT_ID")
        );
        
        jsonArray.put(payment.toJson()); // Add each patient's data as JSON
        
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


