<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./Connection.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Creation | Hospital Management System</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-7/assets/css/registration-7.css">

</head>
<body>
<nav class="navbar bg-dark text-light p-3">
  <div class="container-fluid flex justify-between ">
    <a class="navbar-brand text-light" href="#">Dashboard </a>
    <a class="navbar-brand text-light">Hospital Management System</a>
  </div>
</nav>
      <h6 class='mt-5'>Create Tables  </h6>
      <form method="POST" action="Tables.jsp">
    <table class='table table-bordered'>
        <thead>
            <tr>
                <th scope='col'># </th>
                <th scope='col'>Table Name </th>
                <th scope='col'>Click to Create Table </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope='row'>1 </th>
                <td>Login </td>
                <td><button type="submit" class="btn btn-success" name="CreateLoginTable">Create Login Table</button></td>
            </tr>
           <tr>
                <th scope='row'>2 </th>
                <td>Patient </td>
                <td><button type="submit" class="btn btn-success" name="CreatePatientTable">Create Patient Table</button></td>
                
            </tr>
           <tr>
                <th scope='row'>3 </th>
                <td>Doctor </td>
                <td><button type="submit" class="btn btn-success" name="CreateDoctorTable">Create Doctor Table</button></td>
                
            </tr>
           <tr>
                <th scope='row'>4 </th>
                <td>Staff </td>
                <td><button type="submit" class="btn btn-success" name="CreateStaffTable">Create Staff Table</button></td>
                
            </tr>
           <tr>
                <th scope='row'>5 </th>
                <td>Ward </td>
                <td><button type="submit" class="btn btn-success" name="CreateWardTable">Create Ward Table</button></td>
                
            </tr>
           <tr>
                <th scope='row'>6 </th>
                <td>Payments </td>
                <td><button type="submit" class="btn btn-success" name="CreatePaymentTable">Create Payment Table</button></td>
               
            </tr>
        </tbody>
    </table>
    </form>
                 



<%
	String CreateLogin = request.getParameter("CreateLoginTable");
String CreatePatient = request.getParameter("CreatePatientTable");
String CreateDoctor = request.getParameter("CreateDoctorTable");
String CreateStaff = request.getParameter("CreateStaffTable");
String CreateWard = request.getParameter("CreateWardTable");
String CreatePayment = request.getParameter("CreatePaymentTable");
int sval = 0;
try{
	

	if(CreateLogin!=null)
	{	
		ps=con.prepareStatement("CREATE TABLE LOGIN(LOGIN_ID INT AUTO_INCREMENT,USER_EMAIL VARCHAR(40) NOT NULL,USER_PASS VARCHAR(20) NOT NULL,IS_ADMIN BOOLEAN,PATIENT_EMAIL VARCHAR(40),PRIMARY KEY(LOGIN_ID),UNIQUE KEY(USER_EMAIL),FOREIGN KEY(PATIENT_EMAIL) REFERENCES PATIENT(PATIENT_EMAIL))");
		sval=ps.executeUpdate();
				if(sval==0)
				{
					%>
					<div class="w-25 alert alert-success" role="alert">
					 Created Login
					</div>
					<% 
				}
				else
				{
					%>
					<div class="w-25 alert alert-danger" role="alert">
					 Cannot Create Login
					</div>
					<% 
				}
	
		
	}

if(CreatePatient!=null)
{	
	
	ps=con.prepareStatement("CREATE TABLE PATIENT(PATIENT_ID INT AUTO_INCREMENT,PATIENT_EMAIL VARCHAR(40),PATIENT_NAME VARCHAR(30) NOT NULL,PATIENT_AGE INT NOT NULL,PATIENT_DISEASE VARCHAR(40) NOT NULL,PATIENT_ADMITTED_ON TIMESTAMP,PATIENT_LEFT_ON TIMESTAMP,PATIENT_PH_NO VARCHAR(10) NOT NULL,PATIENT_WARD_TYPE VARCHAR(10) NOT NULL,PRIMARY KEY(PATIENT_ID))");
	sval=ps.executeUpdate();
			if(sval==0)
			{
				%>
				<div class="w-25 alert alert-success" role="alert">
				 Created Patient 
				</div>
				<% 
			}
			else
			{
				%>
				<div class="w-25 alert alert-danger" role="alert">
				 Cannot Create Patient
				</div>
				<% 
			}
			ps=con.prepareStatement("ALTER TABLE PATIENT ADD UNIQUE(PATIENT_EMAIL)");
			sval=ps.executeUpdate();
					if(sval==0)
					{
						%>
						<div class="w-25 alert alert-success" role="alert">
						 Alter Succesfull 
						</div>
						<% 
					}
					else
					{
						%>
						<div class="w-25 alert alert-danger" role="alert">
						 Alter UnSuccesfull 
						</div>
						<% 
					}

}
if(CreateDoctor!=null)
{	
	
	ps=con.prepareStatement("CREATE TABLE DOCTOR(DOCTOR_ID INT AUTO_INCREMENT,DOCTOR_NAME VARCHAR(40) NOT NULL,DOCTOR_AGE INT NOT NULL,DOCTOR_SPECIALITY VARCHAR(20) NOT NULL,DOCTOR_JOINED_DATE TIMESTAMP NOT NULL,DOCTOR_ADDRESS VARCHAR(50) NOT NULL,DOCTOR_PH_NO VARCHAR(10) NOT NULL,PRIMARY KEY(DOCTOR_ID),UNIQUE KEY(DOCTOR_PH_NO))");
	sval=ps.executeUpdate();
			if(sval==0)
			{
				%>
				<div class="w-25 alert alert-success" role="alert">
				 Created Patient 
				</div>
				<% 
			}
			else
			{
				%>
				<div class="w-25 alert alert-danger" role="alert">
				 Cannot Create Patient
				</div>
				<% 
			}
	 
}
if(CreateStaff!=null)
{	
	ps=con.prepareStatement("CREATE TABLE STAFF(STAFF_ID INT AUTO_INCREMENT,STAFF_NAME VARCHAR(40) NOT NULL,STAFF_AGE INT NOT NULL,STAFF_DESIGNATION VARCHAR(20) NOT NULL,STAFF_ADMIT_DATE TIMESTAMP NOT NULL,STAFF_ADDRESS VARCHAR(50) NOT NULL,STAFF_PHN_NO VARCHAR(10) NOT NULL,STAFF_SALARY DECIMAL(10,2) NOT NULL,PRIMARY KEY(STAFF_ID),UNIQUE KEY(STAFF_PHN_NO))");
	sval=ps.executeUpdate();
			if(sval==0)
			{
				%>
				<div class="w-25 alert alert-success" role="alert">
				 Created Staff
				</div>
				<% 
			}
			else
			{
				%>
				<div class="w-25 alert alert-danger" role="alert">
				 Cannot Create Staff
				</div>
				<% 
			}
	 
}
if(CreateWard!=null)
{	
	ps=con.prepareStatement("CREATE TABLE WARD(WARD_ID INT AUTO_INCREMENT,FLOOR_NO INT,WARD_TYPE VARCHAR(10)NOT NULL,WARD_IS_ASSIGNED INT NOT NULL,PATIENT_ID INT,DOCTOR_ID INT,STAFF_ID INT,PRIMARY KEY(WARD_ID),FOREIGN KEY(PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),FOREIGN KEY(DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID),FOREIGN KEY(STAFF_ID) REFERENCES STAFF(STAFF_ID))");
	sval=ps.executeUpdate();
			if(sval==0)
			{
				%>
				<div class="w-25 alert alert-success" role="alert">
				 Created Ward
				</div>
				<% 
			}
			else
			{
				%>
				<div class="w-25 alert alert-danger" role="alert">
				 Cannot Create Ward
				</div>
				<% 
			}
	
}
if(CreatePayment!=null)
{	
	ps=con.prepareStatement(" CREATE TABLE PAYMENT(TRANSACTION_ID INT AUTO_INCREMENT,TOTAL_FEES DECIMAL(10,2) NOT NULL,FESS_PAID DECIMAL(10,2),FESS_DUE DECIMAL(10,2),PAYMENT_STATUS INT NOT NULL,WARD_ID INT,WARD_TYPE VARCHAR(10) NOT NULL,PATIENT_ID INT,PRIMARY KEY(TRANSACTION_ID),FOREIGN KEY(WARD_ID) REFERENCES WARD(WARD_ID))");
	sval=ps.executeUpdate();
			if(sval==0)
			{
				%>
				<div class="w-25 alert alert-success" role="alert">
				 Created Payment
				</div>
				<% 
			}
			else
			{
				%>
				<div class="w-25 alert alert-danger" role="alert">
				 Cannot Create Payment
				</div>
				<% 
			}
	
}

}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

