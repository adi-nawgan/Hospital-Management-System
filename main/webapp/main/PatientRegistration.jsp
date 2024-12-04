 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/database/Connection.jsp" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.time.format.DateTimeFormatter" %>
     <%@page import="java.time.format.DateTimeParseException" %>
    <%@page import="java.time.LocalDateTime" %>
<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./css/Patient.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
  --%>
	<%
	float totalFees = 0;
	float feesDue = 0;
	float feesPaid=0;
	int patientId = 0;
	String patientAddress = "";
	String patientEmail = "";
	String patientName = "";
	int patientAge = 0;
	String patientPhnNo="";
	String patientDisease = "";
	Timestamp patientAdmittedOn = null;
	String patientDischargedOn = "";
	String patientWard = "";
	String existingEmail = "";
	String patientBloodType = "";
		if(request.getParameter("patientEmail")!=null && !request.getParameter("patientEmail").isEmpty())
		{			
			 patientEmail = request.getParameter("patientEmail");
		}
		if(request.getParameter("patientName")!=null && !request.getParameter("patientName").isEmpty())
		{			
			 patientName = request.getParameter("patientName");
		}
		if(request.getParameter("patientAge")!=null && !request.getParameter("patientAge").isEmpty())
		{			
			 patientAge = Integer.parseInt(request.getParameter("patientAge"));
		}
		if(request.getParameter("patientPhnNo")!=null && !request.getParameter("patientPhnNo").isEmpty())
		{			
			patientPhnNo = request.getParameter("patientPhnNo");
		}
		if(request.getParameter("patientDisease")!=null && !request.getParameter("patientDisease").isEmpty())
		{			
			patientDisease = request.getParameter("patientDisease");
		}
		if(request.getParameter("patientRegistered")!=null && !request.getParameter("patientRegistered").isEmpty())
		{	
			String admittedOnStr = request.getParameter("patientRegistered");

			if (admittedOnStr != null && !admittedOnStr.isEmpty()) {
			    try {
			        // Adjusting the format to match the HTML datetime-local value
			        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			        LocalDateTime localDateTime = LocalDateTime.parse(admittedOnStr, formatter);
			        
			        // Converting LocalDateTime to Timestamp
			         patientAdmittedOn = Timestamp.valueOf(localDateTime);
			        System.out.println("Parsed Timestamp: " + patientAdmittedOn); // Debugging

			    } catch (DateTimeParseException e) {
			        e.printStackTrace(); // Handle parsing error
			    }
			} else {
			    System.out.println("Admitted On value is missing or empty.");
			}

			
			
		}
		 if(request.getParameter("patientAddress")!=null && !request.getParameter("patientAddress").isEmpty())
		{			
			patientAddress = request.getParameter("patientAddress");
		} 
		if(request.getParameter("patientWard")!=null && !request.getParameter("patientWard").isEmpty())
		{			
			patientWard = request.getParameter("patientWard");
		}
		if(request.getParameter("patientBloodType")!=null && !request.getParameter("patientBloodType").isEmpty())
		{			
			patientBloodType = request.getParameter("patientBloodType");
		}       		
		
		ps=con.prepareStatement("SELECT PATIENT_EMAIL FROM PATIENT WHERE PATIENT_EMAIL=?");
		ps.setString(1,patientEmail);
		rs=ps.executeQuery();
		if(rs.next())
		{
			/* existingEmail=rs.getString("PATIENT_EMAIL");
			if(existingEmail.equals(patientEmail))
			{
				existingEmail=rs.getString("PATIENT_EMAIL");
			} */
			%>
			<div class="w-75 alert alert-danger position-absolute top-0 start-0" role="alert">
			 Registration Unsuccessfull User Already Exists!
			</div>
			<%
		}
			else
			{
				try{
					ps=con.prepareStatement("INSERT INTO PATIENT(PATIENT_EMAIL,PATIENT_NAME,PATIENT_AGE,PATIENT_DISEASE,PATIENT_ADMITTED_ON,PATIENT_PH_NO,PATIENT_WARD_TYPE,PATIENT_ADDRESS,PATIENT_BLOOD_TYPE) VALUES (?,?,?,?,?,?,?,?,?)");
					ps.setString(1,patientEmail);
					ps.setString(2,patientName);
					ps.setInt(3,patientAge);
					ps.setString(4,patientDisease);
					ps.setTimestamp(5,patientAdmittedOn);
					/* ps.setString(6,""); */
					ps.setString(6,patientPhnNo);
					ps.setString(7,patientWard);
					ps.setString(8,patientAddress);
					ps.setString(9,patientBloodType);
					int sval=ps.executeUpdate();
					if(sval>=0)
					{
						%>
						<div class="w-75 alert alert-success position-absolute top-0 start-0" role="alert">
						 Registration Succesfull
						</div>
						<%
						if(patientWard.equals("General"))
						{
							totalFees+=20000;
							if(totalFees-feesPaid<0)
							{
								feesDue=(totalFees-feesPaid)*(-1);
							}
							else
							{
								feesDue=totalFees-feesPaid;
							}
							
						}
						else
						{
							totalFees+=50000;
							if(totalFees-feesPaid<0)
							{
								feesDue=(totalFees-feesPaid)*(-1);
							}
							else
							{
								feesDue=totalFees-feesPaid;
							}
						}
						
						try{
							ps=con.prepareStatement("SELECT PATIENT_ID,PATIENT_EMAIL FROM PATIENT WHERE PATIENT_EMAIL=?");
							ps.setString(1,patientEmail);
							rs=ps.executeQuery();
							if(rs.next())
							{
								patientEmail = rs.getString("PATIENT_EMAIL");
								patientId=rs.getInt("PATIENT_ID");
							}
						}	
						catch(Exception e)
						{
							e.printStackTrace();
						}
						ps=con.prepareStatement("INSERT INTO PAYMENT(TOTAL_FEES,FEES_PAID,FEES_DUE,WARD_TYPE,PATIENT_ID)VALUES(?,?,?,?,?)");
						ps.setFloat(1,totalFees);
						ps.setFloat(2,feesPaid);
						ps.setFloat(3,feesDue);
						ps.setString(4,patientWard);
						ps.setInt(5,patientId);
						sval=ps.executeUpdate();
						HttpSession s = request.getSession();
		                s.setAttribute("patientEmail",patientEmail);
		                s.setAttribute("patientId",patientId);
						response.sendRedirect(request.getContextPath() +"/Patient");
					}
					else
					{
						%>
						<div class="w-75 alert alert-danger position-absolute top-0 start-0" role="alert">
						 Registration UnSuccesfull 
						</div>
						<%
					}
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		
		
			
		
		
	
	%>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="script.js"></script>
</body>
</html> -->





















































<div class="container mt-4 w-100 float-left">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Patient Registration</h2>
            </div>
            <div class="card-body">
                <form id="patientRegistrationForm" method="POST" action="<%=request.getContextPath() +"/PatientRegistration" %>">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="patientEmail" class="form-label">Patient Email</label>
                            <input type="email" class="form-control" id="patientEmail" name="patientEmail" value="<%=patientEmail %>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" required name="patientName">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" class="form-control" id="age" required name="patientAge">
                        </div>
                        <div class="col-md-6">
                            <label for="phoneNo" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phoneNo" required name="patientPhnNo">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <label for="disease" class="form-label">Disease</label>
                            <input type="text" class="form-control" id="disease" required name="patientDisease">
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="admittedOn" class="form-label">Admitted On</label>
                            <input type="date" class="form-control" id="admittedOn" required name="patientAdmittedOn">
                        </div>
                        <div class="col-md-6">
                            <label for="dischargedOn" class="form-label">Discharged On</label>
                            <input type="date" class="form-control" id="dischargedOn" name="patientDischargedOn" disabled>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="ward" class="form-label">Ward</label>
                            <select class="form-select" id="ward" required name="patientWard">
                                <option value="">Select Ward</option>
                                <option value="special" name="special" value="special">Special</option>
                                <option value="general" name="general" value="general">General</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">Register Patient</button>
                    </div>
                </form>
            </div>
        </div>
        </div>