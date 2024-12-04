<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<% String sessionId = null;
	Cookie[] cookies = request.getCookies();

if (cookies != null) {
   for (Cookie cookie : cookies) {
       if (cookie.getName().equals("JSESSIONID")) {
           sessionId = cookie.getValue();
           break;
       }
   }
} 

String paymentMode = request.getParameter("paymentMode");
String patientEmail = "";
int patientId=0;
if(request.getParameter("patientId")!=null)
{
	 patientId=Integer.parseInt(request.getParameter("patientId"));	
}
float amountToBePayed=0;
if(request.getParameter("amountPayed")!=null)
{
	amountToBePayed=Float.parseFloat(request.getParameter("amountPayed"));	
}
float feesPayed = 0;
int paymentId = 0;
/*  out.println("Amount Payed"+amountToBePayed);*/
HttpSession s=request.getSession();
if(s!=null && sessionId!=null && sessionId.equals(session.getId()))
{
	if( s.getAttribute("patientId")!=null && s.getAttribute("feesPayed")!=null)
	{
		
		/* patientId = (Integer)s.getAttribute("patientId"); 
		/* amountToBePayed = (Float)s.getAttribute("amountToBePayed"); */
		System.out.println("Amoutn Payed"+amountToBePayed);
		 feesPayed= (Float)s.getAttribute("feesPayed");
		 System.out.println("Fees Payed"+feesPayed);
	}
	
	try{
		ps=con.prepareStatement("SELECT PAYMENT_ID FROM PAYMENT WHERE PATIENT_ID=?");
		ps.setInt(1,patientId);
		System.out.println("VERIFICATION PATIENT ID = "+patientId);
		rs=ps.executeQuery();
		if(rs.next())
		{
			paymentId = rs.getInt("PAYMENT_ID");
			try{
				ps=con.prepareStatement("UPDATE PAYMENT SET FEES_PAID=?,PAYMENT_STATUS=?,FEES_DUE=? WHERE PAYMENT_ID=?");
				ps.setFloat(1,amountToBePayed);
				ps.setString(2,"Payed");
				ps.setInt(3,0);
				ps.setInt(4,paymentId);
				System.out.println("VERIFICATION AMOUNT TO BE PAYED = "+amountToBePayed);
				System.out.println("VERIFICATION PAYMENT ID = "+paymentId);
				
				int updateResult = ps.executeUpdate();
				if(updateResult>0)
				{
					System.out.print("Update Succesfull");	
				}
				else
				{
					System.out.print("Update Not Succesfull");
				}
				ps=con.prepareStatement("INSERT INTO TRANSACTION(TRANSACTION_DATE,TRANSACTION_TYPE,TRANSACTION_AMOUNT,PATIENT_ID)VALUE(CURRENT_TIMESTAMP,?,?,?)");
				ps.setString(1,paymentMode);
				ps.setFloat(2,amountToBePayed);
				ps.setInt(3,patientId);
				System.out.println("VERIFICATION PAYMENT MODE = "+paymentMode);
				System.out.println("VERIFICATION AMOUNT TO BE PAYED = "+amountToBePayed);
				System.out.println("VERIFICATION PATIENT ID = "+patientId);
				 int result=ps.executeUpdate();
				if(result>0)
				{
					System.out.print("Update Succesfull");	
				}
				else
				{
					System.out.print("Update Not Succesfull");
				}
				
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	response.sendRedirect(request.getContextPath()+"/Patient;jsessionid="+sessionId);
	
}


%> 