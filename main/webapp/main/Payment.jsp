<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@include file="/database/Connection.jsp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.ParseException" %>
<% 
float amountToBePayed = 0;
float amountPayed = 0;
int patientId = 0;
float feesPaid=0;
HttpSession s=request.getSession(false);

if(s==null)
{
	response.sendRedirect(request.getContextPath()+"/Login");
}
else
{
	if(s.getAttribute("amountToBePayed")!=null && (s.getAttribute("patientId")!=null) && (s.getAttribute("feesPaid")!=null))
	{		
 		/*amountToBePayed=(Float)s.getAttribute("amountToBePayed");*/ 
 		patientId=(Integer)s.getAttribute("patientId");
 		feesPaid=(Float)s.getAttribute("feesPaid");
	}
	

    // Forward the request to the next page (no redirect, just forwarding)
   /*  RequestDispatcher dispatcher = request.getRequestDispatcher("/Verification");
    dispatcher.forward(request, response);
	 */
	 
if(request.getParameter("amountPayed")!=null)
{
	amountPayed=Float.parseFloat(request.getParameter("amountPayed"));
	System.out.println("Payment Page amount payes"+amountPayed);
}
s.setAttribute("amountToBePayed",amountToBePayed);
s.setAttribute("patientId",patientId);
s.setAttribute("feesPaid",feesPaid);
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment | Hospital Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #e9ecef;
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        .header h3 {
            margin: 0;
        }

        .header .staff-options {
            float: right;
        }

        .staff-options a {
            margin-left: 10px;
        }

        .form-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-size: 1.1rem;
            font-weight: bold;
        }

        .btn-pay {
            width: 100%;
            font-size: 1.2rem;
            padding: 10px;
        }
        
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3></h3>
                </div>
                <div class="col-md-4 text-center">
                    <h3>PAYMENT DETAILS</h3>
                </div>
                <div class="col-md-4 text-end staff-options">
                    <h5></h5>
                    <a href="<%=request.getContextPath() +"/Logout" %>" class="btn btn-outline-secondary btn-sm">Logout</a>
                    <a href="#" class="btn btn-outline-secondary btn-sm">Settings</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment Form -->
    <div class="container">
        <div class="form-container">
            <form id="paymentForm" method="POST" action="<%=request.getContextPath() +"/Verification" %>">

                <div class="mb-3">
                    <label for="paymentMode" class="form-label">Payment Mode:</label>
                    <select class="form-select" id="paymentMode" name="paymentMode">
                     <option>Select Payment Mode</option>
                        <option value="upi">UPI</option>
                        <option value="netbanking">Netbanking</option>
                    </select>
                </div>
				 <div class="mb-3">
                    <label for="payerName" class="form-label">Amount To Be Payed</label>
                    <input type="text" class="form-control" id="amountPayed" placeholder="" disabled value=<%=amountPayed %>>
                </div>
                <div class="mb-3">
                    <label for="payerName" class="form-label">Payer's Name:</label>
                    <input type="text" class="form-control" id="payerName" placeholder="Enter Payer's Name">
                </div>
                <input type="text" hidden value=<%=patientId %> name="patientId">
                <input type="text" hidden value=<%=amountPayed %> name="amountPayed">
                <% 
// Set the session attributes in the request scope for the next page

%>



               <!--  <div class="container" id="container">                
                <div class="mb-3">
                    <label for="payerName" class="form-label">Payer's Name:</label>
                    <input type="text" class="form-control" id="payerName" placeholder="Enter Payer's Name">
                </div> 
                </div>-->

	<div class="container d-flex justify-content-center" id="upi-container">
	
	</div>
                <div class="mb-3 mt-3 text-center">
                    <button type="submit" class="btn btn-primary btn-pay" id="payBtn">PAY</button>
                </div>
            </form>
        </div>
    </div>
    <!-- Modal for Success -->
    <div class="modal fade" id="paymentSuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Payment Successful</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Your payment was successfully processed!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<%

}
%>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="main/js/Payment.js">
       
    </script>
</body>
</html>




