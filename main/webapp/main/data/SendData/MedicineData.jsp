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
class MedicineData {
    int medicineId;
    String medicineName;
    String medicineType;
    int quantity;
    Timestamp expiryDate;

    public MedicineData(int medicineId,String medicineName,String medicineType,int quantity,Timestamp expiryDate) {
      this.medicineId=medicineId;
      this.medicineName=medicineName;
      this.medicineType=medicineType;
      this.quantity=quantity;
      this.expiryDate=expiryDate;
       
        
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("medicineId", medicineId);
        json.put("medicineName", medicineName);
        json.put("medicineType", medicineType);
        json.put("quantity", quantity);
        json.put("expiryDate", expiryDate);
        
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
    ps = con.prepareStatement("SELECT * FROM MEDICINE");
    rs = ps.executeQuery();
    while (rs.next()) {
        MedicineData medicine = new MedicineData(
        		 rs.getInt("MEDICINE_ID"),
            	rs.getString("MEDICINE_NAME"),
            	rs.getString("MEDICINE_TYPE"),
            	rs.getInt("QUANTITY"),
        		rs.getTimestamp("EXPIRY_DATE")
        );
        
        jsonArray.put(medicine.toJson()); // Add each patient's data as JSON
        
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


