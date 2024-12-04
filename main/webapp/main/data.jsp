<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%@page import="java.util.*" %>
<% 
int employeeCount = -1;
int patientCount = -1;
int wardCount = -1;
int paymentCount = -1;
int medicineCount = -1;
// Patient Data 
int patientId = -1;
String patientName = "";
int patientAge = -1;
String patientPhnNo = "";
String patientEmail = "";
String patientDisease = "";
Timestamp patientAdmittedOn = null;
Timestamp patientLeftOn = null;
String patientWardType = "";
String patientAddress = "";
String patientBloodType = "";
float patientFeesPaid = 0;
float patientFeesDue = 0;
//Doctor Data 
int doctorId = -1;
String doctorName = "";
int doctorAge = -1;
String doctorSpeciality = "";
Timestamp doctorJoiningDate = null;
String doctorAddress = "";
String doctorPhnNo = "";
float doctorSalary = 0;
//Staff Data
int staffId = -1;
String staffName = "";
int staffAge = -1;
String staffDesignation = "";
Timestamp staffJoiningDate = null;
String staffAddress = "";
String staffPhnNo = "";
float staffSalary = 0;
// Ward Data
String wardId = "";
int floorNo = -1;
String wardType = "";
String wardStatus = "";
//Medicine Data
String medicineData = "";
String medicineType = "";
int medicineQuantity = -1;
Timestamp medicineExpiryDate = null;
//Payment data
int paymentId = -1;
String paymentStatus = "";
float feesDue = 0;
float feesPaid = 0;
float totalFees = 0;

ArrayList<Integer> patientIds=new ArrayList<Integer>();
if(feesDue!=0 && feesPaid!=0 && totalFees!=0)
{
	patientFeesPaid=totalFees-feesDue;
	patientFeesDue=totalFees-feesPaid;
	
}


try{
	ps=con.prepareStatement("SELECT PATIENT_ID FROM PATIENT");
	rs=ps.executeQuery();
	while(rs.next())
	{
		
			patientIds.add(rs.getInt("PATIENT_ID"));
			/* patientId=rs.getInt("PATIENT_ID"); */
			/* out.println(patientId); */
			/* ps=con.prepareStatement("SELECT * FROM PATIENT WHERE PATIENT_ID=?");
			ps.setInt(1,patientId);
			rs=ps.executeQuery();
			while(rs.next())
			{
				patientId = rs.getInt("PATIENT_ID");
				patientName = rs.getString("PATIENT_NAME");
				patientAge = rs.getInt("PATIENT_AGE");
				patientPhnNo = rs.getString("PATIENT_PH_NO");
				patientDisease = rs.getString("PATIENT_DISEASE");
				patientAdmittedOn = rs.getTimestamp("PATIENT_ADMITTED_ON");
				patientLeftOn = rs.getTimestamp("PATIENT_LEFT_ON");
				patientWardType=rs.getString("PATIENT_WARD_TYPE");
				patientBloodType = rs.getString("PATIENT_BLOOD_TYPE");
				patientAddress = rs.getString("PATIENT_ADDRESS");
			out.println("PATIENT ID :"+patientId);
			out.println("<br>PATIENT NAME :"+patientName);
			out.println("<br>PATIENT Age :"+patientAge);
			out.println("<br>PATIENT PH NO :"+patientPhnNo);
			out.println("<br>PATIENT DISEASE :"+patientDisease);
			out.println("<br>PATIENT ADMITTED ON :"+patientAdmittedOn);
			out.println("<br>PATIENT LEFT ON :"+patientLeftOn);
			out.println("<br>PATIENT Ward Type :"+patientWardType);
			out.println("<br>PATIENT Blood Type :"+patientBloodType);
			out.println("<br>PATIENT Address :"+patientAddress);
			
			} */
			
	
	}
	rs.close();
	ps.close();
 ListIterator li = patientIds.listIterator();
		while(li.hasNext())
		{
			patientId =(Integer)li.next();
			 ps=con.prepareStatement("SELECT * FROM PATIENT WHERE PATIENT_ID=?");
				ps.setInt(1,patientId);
				rs=ps.executeQuery();
				while(rs.next())
				{
					patientId = rs.getInt("PATIENT_ID");
					patientName = rs.getString("PATIENT_NAME");
					patientAge = rs.getInt("PATIENT_AGE");
					patientPhnNo = rs.getString("PATIENT_PH_NO");
					patientDisease = rs.getString("PATIENT_DISEASE");
					patientAdmittedOn = rs.getTimestamp("PATIENT_ADMITTED_ON");
					patientLeftOn = rs.getTimestamp("PATIENT_LEFT_ON");
					patientWardType=rs.getString("PATIENT_WARD_TYPE");
					patientBloodType = rs.getString("PATIENT_BLOOD_TYPE");
					patientAddress = rs.getString("PATIENT_ADDRESS");
				out.println("PATIENT ID :"+patientId);
				out.println("<br>PATIENT NAME :"+patientName);
				out.println("<br>PATIENT Age :"+patientAge);
				out.println("<br>PATIENT PH NO :"+patientPhnNo);
				out.println("<br>PATIENT DISEASE :"+patientDisease);
				out.println("<br>PATIENT ADMITTED ON :"+patientAdmittedOn);
				out.println("<br>PATIENT LEFT ON :"+patientLeftOn);
				out.println("<br>PATIENT Ward Type :"+patientWardType);
				out.println("<br>PATIENT Blood Type :"+patientBloodType);
				out.println("<br>PATIENT Address :"+patientAddress);
			
		
		}
	}
	 
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>