let upiContainer = document.querySelector("#upi-container");
let paymentMode=document.querySelector("#paymentMode");


paymentMode.addEventListener("change",()=>{
  if(paymentMode.value==="upi")
    {
      
      upiContainer.innerHTML='<div class="card w-50 ">'+
	   							 '<img src="./public/upi_1730202419481.png" type="png"class="card-img-top" alt="...">'+
	  						'</div>';
		
    }
	else if(paymentMode.value === "netbanking")
		{
			upiContainer.innerHTML='<div class="container mt-5">'+
			        					'<div class="card p-4">'+
			            '<h5 class="card-title text-center">Enter Card Details</h5>'+
			            '<form id="patientForm" method="POST" action="<% request.getContextPath() +"/Verification" %>" class="mt-4">'+
			                '<div class="row mb-3">'+
			                  '<div class="col-md-6">'+
			                        '<label for="cardNumber" class="form-label">Card Number</label>'+
			                        '<input type="number" class="form-control" id="cardNumber" name="1234 5678 9112 3456">'+
			                    '</div>'+
			                    '<div class="col-md-6">'+
			                        '<label for="cardHolder" class="form-label">Card Holder Name</label>'+
			                        '<input type="text" class="form-control" id="cardHolder" name="cardHolder">'+
			                    '</div>'+      
			                '</div>'+
			                '<div class="row mb-4">'+
			                        '<div class="col-md-6">'+
			                            '<label for="month" class="form-label">Expiration Date</label>'+
			                            '<input type="month" class="form-control" id="month" required name="month">'+
			                        '</div>'+
			                        '<div class="col-md-6">'+
			                            '<label for="CVV" class="form-label">Enter CVV</label>'+
			                            '<input type="password" class="form-control" id="CVV" required name="cvv">'+
			                        '</div>'+
			                    '</div>'+
			                 '</form>'+
			        '</div>'+
			    '</div>';
		
				let cardNumber = document.querySelector("#cardNumber");

				if (cardNumber!=null && cardNumber!=undefined) {
				  cardNumber.addEventListener('input', () => {
				    let cardNumberValue = cardNumber.value;
				    if (cardNumberValue.length > 16) {
				      console.log(cardNumberValue);
				      cardNumber.value = cardNumberValue.slice(0, 16);
				      window.alert("Please enter a 16-digit number");
				    }
				  });
				}

				let CVV = document.querySelector("#CVV");

				if (CVV!=null && CVV!=undefined) {
				  CVV.addEventListener('input', () => {
				    let CVVValue = CVV.value;
				    if (CVVValue.length > 3) {
				     
				      CVV.value = CVVValue.slice(0, 3);
				      window.alert("Please enter a correct CVV");
				    }
				  });
				}

									
		}
})

