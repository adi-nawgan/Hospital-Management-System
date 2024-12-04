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
class StaffData {
    int staffId;
    String staffName;
    int staffAge;
    String staffDesignation;
    Timestamp staffAdmitDate;
    String staffAddress;
    String staffPhnNo;
    float staffSalary;

    public StaffData(int staffId,String staffName,int staffAge,String staffDesignation,Timestamp staffAdmitDate,String staffAddress,String staffPhnNo,float staffSalary ) {
    	 this.staffId=staffId;
    	    this.staffName=staffName;
    	    this.staffAge=staffAge;
    	    this.staffDesignation=staffDesignation;
    	    this.staffAdmitDate=staffAdmitDate;
    	    this.staffAddress=staffAddress;
    	    this.staffPhnNo=staffPhnNo;
    	    this.staffSalary=staffSalary;
    }

    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        json.put("staffId", staffId);
        json.put("staffName", staffName);
        json.put("staffAge", staffAge);
        json.put("staffDesignation", staffDesignation);
        json.put("staffAdmitDate", staffAdmitDate);
        json.put("staffAddress", staffAddress);
        json.put("staffPhnNo", staffPhnNo);
        json.put("staffSalary", staffSalary);
        
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
    ps = con.prepareStatement("SELECT * FROM STAFF");
    rs = ps.executeQuery();
    while (rs.next()) {
        StaffData staff = new StaffData(
        		 rs.getInt("STAFF_ID"),
            	rs.getString("STAFF_NAME"),
            	rs.getInt("STAFF_AGE"),
            	rs.getString("STAFF_DESIGNATION"),
            	rs.getTimestamp("STAFF_ADMIT_DATE"),
            	rs.getString("STAFF_ADDRESS"),
            	rs.getString("STAFF_PHN_NO"),
            	rs.getFloat("STAFF_SALARY")
        );
        
        jsonArray.put(staff.toJson()); // Add each patient's data as JSON
        
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


