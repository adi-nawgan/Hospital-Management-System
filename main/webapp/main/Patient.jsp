<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@include file="/database/Connection.jsp" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="java.text.ParseException" %>
<%


%>
<%

float totalFees=0;
String NewpatientEmail = "";
	String patientName = "";
	int patientAge = 0;
	String patientPhnNo="";
	String patientDisease = "";
	Timestamp patientAdmittedOn = null;
	String patientAdmittedOnFormatted = "";
	Timestamp patientDischargedOn = null;
	String patientLeftOnFormatted = "";
	String patientWard = "";
	String existingEmail = "";
	int patientId = 0;
String patientEmail = "";
int userpatientId=-1;
float patientFeesPaid = 0;
float patientFeesDue = 0;
String patientAddress = "";
String patientBloodType = "";
String patientDischargedFormatted = "";
int transactionId = -1;
Timestamp transactionDate = null;
String transactionType = "";
float transactionAmount=0;
HttpSession s=request.getSession(false);
Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
sessionCookie.setHttpOnly(true); // Helps prevent XSS
sessionCookie.setPath("/"); // Make sure it's accessible in the entire app
response.addCookie(sessionCookie);
System.out.println(session.getId());
if(s==null || (s.getAttribute("patientEmail")==null && s.getAttribute("patientId")==null))
{
	response.sendRedirect(request.getContextPath()+"/Login");
}
else
{
	
 patientEmail = (String)s.getAttribute("patientEmail");
 userpatientId =(Integer)s.getAttribute("patientId");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="./css/Patient.css">
    <!-- Bootstrap CSS -->  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .output-container {
            display: none;
        }
    </style>
</head>
<body>
<%
System.out.println(patientEmail);
System.out.println(patientId);
		try{
    		ps=con.prepareStatement("SELECT * FROM PATIENT WHERE PATIENT_ID=?");
    		ps.setInt(1,userpatientId);
    		rs=ps.executeQuery();
    %>
    <!-- Dashboard Navigation -->
    <div class="container-fluid bg-dark p-3">
        <div class="row">
            <div class="col-md-8">
                <h3 class="text-light">Dashboard</h3>
            </div>
            <div class="col-md-4 text-end">
                <h5><span id="patientName" class="text-light"> 
                <%
                if(rs.next())
        		{
        			patientName=rs.getString("PATIENT_NAME");
                		out.println(patientName);
                		patientId=rs.getInt("PATIENT_ID");
                		 s.setAttribute("patientEmail", patientEmail);
   			            s.setAttribute("patientId", patientId);
            			patientName = rs.getString("PATIENT_NAME");	
            			patientDisease=rs.getString("PATIENT_DISEASE");
            			patientAdmittedOn = rs.getTimestamp("PATIENT_ADMITTED_ON");
            			patientDischargedOn = rs.getTimestamp("PATIENT_LEFT_ON");
            			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            			if(patientAdmittedOn!=null)
            			{
            				
        			    patientAdmittedOnFormatted = sdf.format(patientAdmittedOn);
            			System.out.println(patientAdmittedOnFormatted);
            			}
            			if(patientDischargedOn!=null)
            			{
            				
        			   	 	patientLeftOnFormatted = sdf.format(patientDischargedOn);
            				System.out.println(patientLeftOnFormatted);
            			}
            			else
            			{
            				patientLeftOnFormatted = "Yet To Be Discharged";
            			}
            			patientWard=rs.getString("PATIENT_WARD_TYPE");
            			patientAddress=rs.getString("PATIENT_ADDRESS");
            			patientBloodType=rs.getString("PATIENT_BLOOD_TYPE");
            			
            			try{
            				ps=con.prepareStatement("");
            			}
            			catch(Exception e)
            			{
            				
            			}
            			 

                		%></span></h5>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        Settings
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="<%=request.getContextPath() +"/Profile" %>">Profile</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath() +"/Settings" %>">Settings</a></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath() + "/Logout"%>">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
	<h2 class="mt-5 fs-4 text-center text-success">Welcome <%=patientName %></h2>
    <!-- Patient Details Section -->
    <div class="container mt-4">
        <div class="card p-4">
            <h5 class="card-title text-center">Patient Details</h5>
          		
          		 <table class="table table-success mt-5 p-4">
 					 <thead class="table-dark">
     					<tr>
      						<th scope="col" class="p-4">Patient ID</th>
      						<th scope="col"class="p-4">Name</th>
     						<th scope="col" class="p-4">Disease</th>
      						<th scope="col" class="p-4">Ward</th>
        					<th scope="col" class="p-4">Admitted On</th>
        					<th scope="col" class="p-4">Discharged On</th>
        					<th scope="col" class="p-4">Address</th>
        					<th scope="col" class="p-4">Blood Type</th>
        					<th scope="col" class="p-4">Fees Paid</th>
        					<th scope="col" class="p-4">Fees Due</th>
        					<th scope="col" class="p-4">Total</th>
    					</tr>
  					</thead>
  					<tbody>
    				<tr class="p-4">
      				<th class="p-4"><%=patientId %></th>
      				<td class="p-4"><%=patientName %></td>
      				<td class="p-4"><%=patientDisease %> </td>
      				<td class="p-4"><%=patientWard %> </td>
      				<td class="p-4"><%=patientAdmittedOnFormatted %> </td>
      				<td class="p-4"><%=patientLeftOnFormatted %> </td>
      				<td class="p-4"><%=patientAddress %> </td>
      				<td class="p-4"><%=patientBloodType %> </td>
      				<% 
      				ps=con.prepareStatement("SELECT TOTAL_FEES,FEES_DUE,FEES_PAID FROM PAYMENT WHERE PATIENT_ID = ?");
      				ps.setInt(1,patientId);
      				rs=ps.executeQuery();
      						
      				if(rs.next()){
      							patientFeesDue=rs.getFloat("FEES_DUE");
      							totalFees=rs.getFloat("TOTAL_FEES");
      							patientFeesPaid=rs.getFloat("FEES_PAID");
      							
      							 s = request.getSession();
      			                s.setAttribute("amountToBePayed", patientFeesDue);
      			             
      			            s.setAttribute("feesPaid",patientFeesPaid);
      			             
      			                
      						}
      				%> 
      				<td class="p-4"><%=patientFeesPaid %> </td>
      				<td class="p-4"><%=patientFeesDue %> </td>
      				<td class="p-4"><%=totalFees %> </td>
    				</tr>
 				 </tbody>
</table>
<table class="table table-danger mt-3">
 <h5 class=" text-center">Transactions</h5>
<thead class="table-dark">
<tr>
		
      <th scope="col" class="p-4">Transaction ID</th>
      <th scope="col" class="p-4">Transaction Date</th>
      <th scope="col" class="p-4">Transaction Type</th>
      <th scope="col" class="p-4">Amount</th>
</tr>
</thead>
<tbody>
<tr class="p-4">
<%
		ps=con.prepareStatement("SELECT * FROM TRANSACTION WHERE PATIENT_ID = ?");
		ps.setInt(1,patientId);
		rs=ps.executeQuery();
		while(rs.next())
		{
			transactionId=rs.getInt("TRANSACTION_ID");
			transactionDate=rs.getTimestamp("TRANSACTION_DATE");
			transactionType=rs.getString("TRANSACTION_TYPE");
			transactionAmount=rs.getFloat("TRANSACTION_AMOUNT");
		}

%>
	<% if(transactionId!=-1 && transactionDate!=null && transactionType!="" && transactionAmount!=0)
	{
	%>
	<td><%=transactionId %></td>
	<td><%=transactionDate %></td>
	<td><%=transactionType %></td>
	<td><%=transactionAmount %></td>
<%
	}

		else
		{
			%>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			<% 
		}
%>
</tr>
</tbody>
</table>
 <div class="row mt-4">
                    <div class="col-md-6">
                    	<%
                    	if(patientFeesDue==0)
                    	{
                    		%>
                        <button type="button" class="btn btn-primary w-100" disabled onclick="<%= request.getContextPath()+"/Payment" %>" >Pay</button>
                    	<% 
                    	}
                    	else
                    	{
                    	
                    	%>
                				<form method="POST" action="<%=request.getContextPath() +"/Payment" %>">
                						<input type="text" value="<%=patientId %>" hidden>
                						<input type="text" value="<%=patientFeesDue %>" hidden name="amountPayed">
        							
                    		
                    		 <button type="submit" class="btn btn-primary w-100"  href="<%= request.getContextPath()+"/Payment" %>" >Pay</button>
                    			</form>
                    			<% 
                    	}
                    	
                    	%>
                    </div>
                    
                  
                </div>
               
               	
          	
    			
                </div>
            </div>
            </
    			<% 
    		}
    		else
    		{
    			
    			%>
    			  <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                      Settings
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <li><a class="dropdown-item" href="#">Profile</a></li>
                      <li><a class="dropdown-item" href="#">Settings</a></li>
                      <li><a class="dropdown-item" href="<%= request.getContextPath() + "/Logout"%>">Logout</a></li>
                  </ul>
              </div>
          </div>
      </div>
  </div>
    			</div>
    			</div>
    			<div class="container mt-5">
        <div class="card p-4">
            <h5 class="card-title text-center">Patient Details</h5>
            <form id="patientForm" method="POST" action="<%= request.getContextPath()+ "/PatientRegistration" %>" class="mt-4">
                <div class="row mb-3">
                  <div class="col-md-6">
                        <label for="patientEmailInput" class="form-label">Patient Email</label>
                        <input type="text" class="form-control" id="patientEmailInput" name="patientEmail">
                    </div>
                    <div class="col-md-6">
                        <label for="patientNameInput" class="form-label">Patient Name</label>
                        <input type="text" class="form-control" id="patientNameInput" name="patientName">
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
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="patientDisease" class="form-label">Patient Disease</label>
                        <input type="text" class="form-control" id="patientDisease" name="patientDisease">
                    </div>
                    <div class="col-md-6">
                        <label for="patientAddress" class="form-label">Patient Address</label>
                            <input type="text" class="form-control" id="patientAddress" required name="patientAddress">
                       <!--  <input type="text" class="form-control" id="patientWard" name="patientWard"> -->
                    </div>
                </div>
                <div class="row mb-3">
                 <div class="col-md-6">
                        <label for="patientWard" class="form-label">Patient Ward</label>
                        <select class="form-select" aria-label="Default select example" id="patientWard" name="patientWard">
  						<option selected>Select Ward Type</option>
  						<option value="General">General Ward (No Acc | Rooms Availabilty Less) ₹ 20,000 + Taxes</option>
  						<option value="Special">Special Ward (Ac | Rooms Availabilty More) ₹ 50,000 + Taxes</option>
  						
</select>
                      
                    </div>
                    <div class="col-md-6">
                        <label for="admittedOn" class="form-label">Patient Admitted On</label>
                        <input type="datetime-local" class="form-control" id="patientadmittedOn" name="patientRegistered" format="yyyy-mm-dd">
                    </div>
                </div>
                  <div class="row mb-3">
                 <div class="col-md-6">
                        <label for="patientBloodType" class="form-label">Patient Blood Type</label>
                        <select class="form-select" aria-label="Default select example" id="patientBloodType" name="patientBloodType">
  						<option selected>Select Blood Type</option>
  						<option value="A+"> A+ </option>
  						<option value="A-"> A- </option>
  						<option value="B+"> B+ </option>
  						<option value="B-"> B- </option>
  						<option value="AB+"> AB+ </option>
  						<option value="AB-"> AB- </option>
  						<option value="O+"> O+ </option>
  						<option value="O-"> O- </option>
						</select>
                       <!--  <input type="text" class="form-control" id="patientWard" name="patientWard"> -->
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </div>
                    <div class="col-md-6">
                        <button type="reset" class="btn btn-secondary w-100">Clear</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    			
    			<% 
    		}
            
            %>
         
    

  
		<%
		}
catch(Exception e)
{
	e.printStackTrace();
}

}


%>
    <!-- Bootstrap JS -->
    <script src="main/js/Patient.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
