let onPageClickChange = document.querySelector("#onPageClickChange");
let rightSection = document.querySelector("#rightSection");
window.addEventListener("load",()=>{
	addToRightSection(1);
	console.log("In load quer selector");
})

    
      /*'<tr class="rounded">' +
      '<th scope="row"><div class="form-check">' +
      '<input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">' +
      "</th>" +
      '<th scope="row">1</th>' +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
      "<td></td>" +
	  "<td></td>" +
	  "<td></td>" +
      "</tr>" +
      "</table>" +
      '<button type="button" class="btn btn-success mb-3 me-5 w-25">Add Patient</button>' +
      '<button type="button" class="btn btn-danger  mb-3 me-5 w-25">Delete Patient</button>' +
      "</div>";*/
    
   
  
    
    
	let goToEmployee=document.querySelector("#goToEmployee");
	let goToPatient=document.querySelector("#goToPatient");
	let goToWard=document.querySelector("#goToWard");
	let goToPayments=document.querySelector("#goToPayments");
	let goToMedicine=document.querySelector("#goToMedicine");
    let overviewClicked = document.querySelector("#overviewClicked");
    let patientClicked = document.querySelector("#patientClicked");
    let doctorClicked = document.querySelector("#doctorClicked");
    let employeeClicked = document.querySelector("#employeeClicked");
    let wardClicked = document.querySelector("#wardClicked");
    let medicineClicked = document.querySelector("#medicineClicked");
    let paymentClicked = document.querySelector("#paymentClicked");
	let reportClicked = document.querySelector("#reportClicked");
    document.addEventListener("DOMContentLoaded", () => {
      overviewClicked.addEventListener("click", () => {
        addToRightSection(1);
      });
      patientClicked.addEventListener("click", () => {
        addToRightSection(2);
      });
      doctorClicked.addEventListener("click", () => {
        addToRightSection(3);
      });
      employeeClicked.addEventListener("click", () => {
        addToRightSection(4);
      });
      wardClicked.addEventListener("click", () => {
        addToRightSection(5);
      });
      medicineClicked.addEventListener("click", () => {
        addToRightSection(6);
      });
		paymentClicked.addEventListener("click", () => {
		addToRightSection(7);
	  });
	  reportClicked.addEventListener("click", () => {
	  		addToRightSection(8);
	  	  });
	goToEmployee.addEventListener("click", () => {
        addToRightSection(4);
      });
	  goToPatient.addEventListener("click", () => {
		addToRightSection(2);
	  });
		goToWard.addEventListener("click", () => {
		addToRightSection(5);
	  });
		goToPayments.addEventListener("click", () => {
		addToRightSection(7);
	  });
		goToMedicine.addEventListener("click", () => {
		addToRightSection(6);
	  });
	  
    });

    function addToRightSection(choice) {
      

      switch (choice) {
        case 1:
          rightSection.innerHTML = "";
		  let overView ='<div class="container-fluid d-flex justify-content-evenly align-items-center flex-wrap ">'+
		        '<div class="card mt-3 bg-primary" style="width: 30rem;">'+
		        '<div class="card-body p-5">';
		  	  fetch('./OverviewData')
		  	  .then((response)=>response.json())
		  	  .then((data)=>
		  		data.forEach((index)=>{	
		        overView+=`<h5 class="card-title text-light" id="employeeCount">Total Employee `+
		        `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="50" height="50" class="bi bi-credit-card-fill float-end bg-primary rounded text-light" style="color: #fffff;">`+
				`<path fill="white" d="M96 128l0-57.8c0-13.3 8.3-25.3 20.8-30l96-36c7.2-2.7 15.2-2.7 22.5 0l96 36c12.5 4.7 20.8 16.6 20.8 30l0 57.8-.3 0c.2 2.6 .3 5.3 .3 8l0 40c0 70.7-57.3 128-128 128s-128-57.3-128-128l0-40c0-2.7 .1-5.4 .3-8l-.3 0zm48 48c0 44.2 35.8 80 80 80s80-35.8 80-80l0-16-160 0 0 16zM111.9 327.7c10.5-3.4 21.8 .4 29.4 8.5l71 75.5c6.3 6.7 17 6.7 23.3 0l71-75.5c7.6-8.1 18.9-11.9 29.4-8.5C401 348.6 448 409.4 448 481.3c0 17-13.8 30.7-30.7 30.7L30.7 512C13.8 512 0 498.2 0 481.3c0-71.9 47-132.7 111.9-153.6zM208 48l0 16-16 0c-4.4 0-8 3.6-8 8l0 16c0 4.4 3.6 8 8 8l16 0 0 16c0 4.4 3.6 8 8 8l16 0c4.4 0 8-3.6 8-8l0-16 16 0c4.4 0 8-3.6 8-8l0-16c0-4.4-3.6-8-8-8l-16 0 0-16c0-4.4-3.6-8-8-8l-16 0c-4.4 0-8 3.6-8 8z"/>`+
				`</svg>`+
		        `</h5>`+
		        `<p class="card-text mt-3 text-light" >Employee Count : <span class="fs-3 text-light" style="font-family : Unbounded">${index.employeeCount}</span></p>`+
		        `</div>`+
		        `</div>`+
		        `<div class="card mt-3 bg-success" style="width: 30rem;">`+
		        `<div class="card-body p-5">`+
		        `<h5 class="card-title text-light">Total Patients`+
				`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="50" height="50" class="bi bi-credit-card-fill float-end  rounded">`+
				`<path fill="white" d="M240 80l102.7 0c-7.9-19.5-20.4-36.5-36.2-49.9L240 80zm37.7-68.2C261.3 4.2 243.2 0 224 0c-53.7 0-99.7 33.1-118.7 80l81.4 0 91-68.2zM224 256c70.7 0 128-57.3 128-128c0-5.4-.3-10.8-1-16L97 112c-.7 5.2-1 10.6-1 16c0 70.7 57.3 128 128 128zM124 312.4c-9.7 3.1-19.1 7-28 11.7L96 512l147.7 0L181.5 408.2 124 312.4zm33-7.2L204.3 384l67.7 0c44.2 0 80 35.8 80 80c0 18-6 34.6-16 48l82.3 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0c-7.2 0-14.3 .4-21.3 1.3zM0 482.3C0 498.7 13.3 512 29.7 512L64 512l0-166.6C24.9 378.1 0 427.3 0 482.3zM320 464c0-26.5-21.5-48-48-48l-48.5 0 57.1 95.2C303 507.2 320 487.6 320 464z"/>`+
				`+</svg>`+
		        `</h5>`+
		        `<p class="card-text mt-3 text-light">Patient Count : <span class="fs-3 text-light" style="font-family : Unbounded">${index.patientCount}</span></p>`+
		        `</div>`+
		        `</div>`+
				`<div class="card mt-3 bg-info" style="width: 30rem; ">`+
				`<div class="card-body p-5">`+
				`<h5 class="card-title text-light">Total Doctor :`+
				`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="50" height="50" class="bi bi-capsule float-end rounded">`+
				`<path fill="white" d="M142.4 21.9c5.6 16.8-3.5 34.9-20.2 40.5L96 71.1 96 192c0 53 43 96 96 96s96-43 96-96l0-120.9-26.1-8.7c-16.8-5.6-25.8-23.7-20.2-40.5s23.7-25.8 40.5-20.2l26.1 8.7C334.4 19.1 352 43.5 352 71.1L352 192c0 77.2-54.6 141.6-127.3 156.7C231 404.6 278.4 448 336 448c61.9 0 112-50.1 112-112l0-70.7c-28.3-12.3-48-40.5-48-73.3c0-44.2 35.8-80 80-80s80 35.8 80 80c0 32.8-19.7 61-48 73.3l0 70.7c0 97.2-78.8 176-176 176c-92.9 0-168.9-71.9-175.5-163.1C87.2 334.2 32 269.6 32 192L32 71.1c0-27.5 17.6-52 43.8-60.7l26.1-8.7c16.8-5.6 34.9 3.5 40.5 20.2zM480 224a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/>`+
				`</svg>`+
				`</h5>`+
				`<p class="card-text mt-3 text-light">Doctors :  <span class="fs-3 text-light" style="font-family : Unbounded">${index.doctorCount}</span></p>`+
				`</div>`+
				`</div>`+
		        `<div class="card mt-3 bg-danger" style="width: 30rem;">`+
		        `<div class="card-body p-5 text-light">`+
		        `<h5 class="card-title text-light">Total Payments :`+
				`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="50" height="50" class="bi bi-credit-card-fill float-end  rounded">`+
				`<path fill="white" d="M0 64C0 46.3 14.3 32 32 32l64 0 16 0 176 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-56.2 0c9.6 14.4 16.7 30.6 20.7 48l35.6 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-35.6 0c-13.2 58.3-61.9 103.2-122.2 110.9L274.6 422c14.4 10.3 17.7 30.3 7.4 44.6s-30.3 17.7-44.6 7.4L13.4 314C2.1 306-2.7 291.5 1.5 278.2S18.1 256 32 256l80 0c32.8 0 61-19.7 73.3-48L32 208c-17.7 0-32-14.3-32-32s14.3-32 32-32l153.3 0C173 115.7 144.8 96 112 96L96 96 32 96C14.3 96 0 81.7 0 64z"/>`+
				`</svg>`+
		        `</h5>`+
		        `<p class="card-text mt-3 text-light">Payments :  <span class="fs-3 text-light" style="font-family : Unbounded">${index.paymentCount}</span></p>`+
		        `</div>`+
		        `</div>`+
				`<div class="card mt-3 bg-secondary" style="width: 30rem;">`+
				`<div class="card-body p-5">`+
				`<h5 class="card-title text-light">Total Ward : `+
				`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" height="50" width="50" class="bi bi-credit-card-fill float-end  rounded">`+
				`<path fill="white" d="M32 32c17.7 0 32 14.3 32 32l0 256 224 0 0-160c0-17.7 14.3-32 32-32l224 0c53 0 96 43 96 96l0 224c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-32-224 0-32 0L64 416l0 32c0 17.7-14.3 32-32 32s-32-14.3-32-32L0 64C0 46.3 14.3 32 32 32zm144 96a80 80 0 1 1 0 160 80 80 0 1 1 0-160z"/>`+
				`</svg>`+
				`</h5>`+
				`<p class="card-text mt-3 text-light">Ward Count : <span class="fs-3 text-light" style="font-family : Unbounded">${index.wardCount}</span></p>`+
				`</div>`+
				`</div>`+
		        `<div class="card mt-3 bg-dark" style="width: 30rem;">`+
		        `<div class="card-body p-5">`+
		        `<h5 class="card-title text-light">Total Medicines`+
				`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="50" height="50" class="bi bi-credit-card-fill float-end  rounded">`+
				`<path fill="white" d="M64 144c0-26.5 21.5-48 48-48s48 21.5 48 48l0 112-96 0 0-112zM0 144L0 368c0 61.9 50.1 112 112 112s112-50.1 112-112l0-178.4c1.8 19.1 8.2 38 19.8 54.8L372.3 431.7c35.5 51.7 105.3 64.3 156 28.1s63-107.5 27.5-159.2L427.3 113.3C391.8 61.5 321.9 49 271.3 85.2c-28 20-44.3 50.8-47.3 83l0-24.2c0-61.9-50.1-112-112-112S0 82.1 0 144zm296.6 64.2c-16-23.3-10-55.3 11.9-71c21.2-15.1 50.5-10.3 66 12.2l67 97.6L361.6 303l-65-94.8zM491 407.7c-.8 .6-1.6 1.1-2.4 1.6l4-2.8c-.5 .4-1 .8-1.6 1.2z"/>`+
				`</svg>`+
		        `</h5>`+
		        `<p class="card-text mt-3 text-light">Medicines Available : <span class="fs-3 text-light" style="font-family : Unbounded">${index.medicineCount}</span></p>`+
		        `</div>`+
		        `</div>`+
		        `</div>`+  
		      `</div>`;
          			rightSection.innerHTML = overView;
		  	})			
		  	)
          onPageClickChange.innerHTML = "Overview";
		  requestAnimationFrame(() => {
		       const goToEmployee = document.querySelector("#goToEmployee");
		       const goToPatient = document.querySelector("#goToPatient");
		       const goToWard = document.querySelector("#goToWard");
		       const goToPayments = document.querySelector("#goToPayments");
		       const goToMedicine = document.querySelector("#goToMedicine");
			   const goToDoctor = document.querySelector("#goToDoctor");
			  

		       if (goToEmployee) {
		         goToEmployee.addEventListener("click", () => {
		           addToRightSection(4);
		         });
		       }
		       
		       if (goToPatient) {
		         goToPatient.addEventListener("click", () => {
		           addToRightSection(2);
		         });
		       }

		       if (goToWard) {
		         goToWard.addEventListener("click", () => {
		           addToRightSection(5);
		         });
		       }
		       
		       if (goToPayments) {
		         goToPayments.addEventListener("click", () => {
		           addToRightSection(7);
		         });
		       }
		       
		       if (goToMedicine) {
		         goToMedicine.addEventListener("click", () => {
		           addToRightSection(6);
		         });
		       }
			   if (goToDoctor) {
			   		         goToDoctor.addEventListener("click", () => {
			   		           addToRightSection(3);
			   		         });
			   		       }
						  
		     });
          
          break;
        case 2:
			rightSection.innerHTML = ""; // Clear existing content

			let patientTable =
			  '<form method="POST" action="./deletePatient">' +
			  '<div class="container-xl container-fluid d-flex justify-content-center align-items-center flex-wrap text-light rounded p-4 mt-1">' +
			  '<table class="table table-hover table-success caption-top border border-dark-subtle w-100" id="table-rounded">' +
			  '<h1 class="text-dark fs-2 text-center mb-3" style="font-family:Roboto Condensed">Patient Details</h1>' +
			  '<thead class="rounded">' +
			  '<tr class="rounded">' +
			  '<th scope="col"></th>' +
			  '<th scope="col">Patient ID</th>' +
			  '<th scope="col">Patient Name</th>' +
			  '<th scope="col">Age</th>' +
			  '<th scope="col">Patient Phn No</th>' +
			  '<th scope="col">Patient Email</th>' +
			  '<th scope="col">Patient Blood Type</th>' +
			  '<th scope="col">Patient Address</th>' +
			  '<th scope="col">Patient Disease</th>' +
			  '<th scope="col">Patient Admitted On</th>' +
			  '<th scope="col">Patient Left On</th>' +
			  '<th scope="col">Patient Ward Type</th>' +
			  '<th scope="col">Patient Fees Paid</th>' +
			  '<th scope="col">Patient Fees Due</th>' +
			  '<th scope="col">Total Fees</th>' +
			  '</tr>' +
			  '</thead>' +
			  '<tbody class="rounded">';

			Promise.all([fetch('./PatientData').then((res) => res.json()), fetch('./PaymentData').then((res) => res.json())])
			  .then(([patients, payments]) => {
			    let rows = "";

			    patients.forEach((patient) => {
			      // Find matching payment data for the current patient
			      const payment = payments.find((pay) => pay.patientId === patient.patientId);

			      // Build the table row with the data
			      rows += `
			        <tr class="rounded">
			          <td scope="row">
			            <div class="form-check">
			              <input class="form-check-input" type="radio" value="${patient.patientId}" id="check" name="patientId">
			            </div>
			          </td>
			          <td class="text-dark">${patient.patientId}</td>
			          <td>${patient.patientName}</td>
			          <td>${patient.patientAge}</td>
			          <td>${patient.patientPhnNo}</td>
			          <td>${patient.patientEmail}</td>
			          <td>${patient.patientBloodType}</td>
			          <td>${patient.patientAddress}</td>
			          <td>${patient.patientDisease}</td>
			          <td>${patient.patientAdmittedOn}</td>
			          <td>${patient.patientLeftOn}</td>
			          <td>${patient.patientWardType}</td>
			          <td>${payment?.feesPaid || 'N/A'}</td>
			          <td>${payment?.feesDue || 'N/A'}</td>
			          <td>${payment?.totalFees || 'N/A'}</td>
			        </tr>`;
			    });

			    // Finalize the table
			    patientTable += rows + '</tbody></table>';
			    patientTable +=
			      '<button type="submit" class="btn btn-danger mb-3 me-5 w-25">Delete Patient</button>' +
			      '</form>' +
			      '</div>';

			    // Render the table to the DOM
			    rightSection.innerHTML = patientTable;
			  })
			  .catch((error) => {
			    console.error('Error fetching data:', error);
			    rightSection.innerHTML = '<p>Error loading data. Please try again later.</p>';
			  });


			/*
          rightSection.innerHTML = "";
		  let patient =
		  '<form method="POST" action="./deletePatient">'+
		        '<div class="container-xl container-fluid d-flex justify-content-center align-items-center flex-wrap  text-light rounded  p-4  mt-1">' +
		        '<table class="table table-hover table-success caption-top border border-dark-subtle" id="table-rounded w-100">' +
		        '<h1 class="text-dark fs-2 text-center mb-3" style="font-family:Roboto Condensed ">Patient Details</h1>' +
		        '<thead class="rounded">' +
		        '<tr class="rounded">' +
		        '<th scope="col"></th>' +
		        '<th scope="col">Patient ID</th>' +
		        '<th scope="col">Patient Name</th>' +
		        '<th scope="col">Age</th>' +
		        '<th scope="col">Patient Phn No</th>' +
		        '<th scope="col">Patient Email</th>' +
		  	  '<th scope="col">Patient Blood Type</th>' +
		  	  '<th scope="col">Patient Address</th>' +
		        '<th scope="col">Patient Disease</th>' +
		        '<th scope="col">Patient Admitted On</th>' +
		        '<th scope="col">Patient Left On</th>' +
		        '<th scope="col">Patient Ward Type</th>' +
		        '<th scope="col">Patient Fees Paid</th>' +
		        '<th scope="col">Patient Fess Due</th>' +
		        '<th scope="col">Total Fees</th>' +
		        "</tr>" +
		        "</thead>" +
		        '<tbody class="rounded">';
          onPageClickChange.innerHTML = "Patient ";
		  fetch('./PatientData')
		  .then((response)=>response.json())
		  .then((data)=>
				data.forEach((index)=>{
					patient+=`<tr class="rounded">`+
								`<td scope="row">`+
									`<div class="form-check">` +
									`<input class="form-check-input" type="radio" value=${index.patientId} id="check" name="patientId">`+
									`</div>`+
								`</td>`+
							`<td class="text-dark">${index.patientId}</td>` +
							`<td>${index.patientName}</td>`+
							`<td>${index.patientAge}</td>` +
							`<td>${index.patientPhnNo}</td>` +
							`<td >${index.patientEmail}</td>` +
							`<td>${index.patientBloodType}</td>` +
							`<td>${index.patientAddress}</td>` +
							`<td>${index.patientDisease}</td>` +
							`<td>${index.patientAdmittedOn}</td>` +
							`<td>${index.patientLeftOn}</td>` +
							`<td>${index.patientWardType}</td>`;
							fetch('./PaymentData')
							.then((response)=>response.json())
							.then((newdata)=>{
								newdata.forEach((newindex)=>{
									if(index.patientId == newindex.patientId)
										{
											console.log('Index Patient id'+index.patientId);
											console.log('NewIndex Patient id'+newindex.patientId);
											patient+=`<td>${newindex.feesPaid}</td>` +
											`<td>${newindex.feesDue}</td>` +
											`<td>${newindex.totalFees}</td>`+
											`</tr>`;
											console.log(newdata);
										}
										else
										{
											patient+=`<td></td>` +
													`<td></td>` +
													`<td></td>`+
													`</tr>`;
										}
								})
							})
							.catch((error)=>{
								console.error('Error is'+error);
								
							})
							
							console.log(data);
				})	
				).then(()=>{					
				patient=patient+
						'</tbody>'+
						'</table>'+
						'<button type="submit" class="btn btn-danger  mb-3 me-5 w-25" >Delete Patient</button>' +
						'</form>'+
						"</div>";
					rightSection.innerHTML = patient;
				});
          */
          break;
        case 3:
          rightSection.innerHTML = "";
		  let count = 0;
		  let doctor ='<div class="container-fluid d-flex justify-content-center align-items-center flex-wrap border border-dark-subtle text-light rounded w-100 p-4 ">' +
		  '<div class="container mt-5">'+
		  '<h1 class="text-center text-dark mb-3">Doctor Details</h1>'+
		          '<div class="row justify-content-center">'+
		              '<div class="col-lg-8 w-100">'+
		                  '<div class="card bg-warning-subtle">'+
		                      '<div class="card-header">'+
		                          '<h2 class="text-center mb-0"><i class="fas fa-user-md me-2"></i>Doctor Registration</h2>'+
		                      '</div>'+
		                      '<div class="card-body">'+
		                          '<form id="registrationForm" method="POST" action="main/data/AddData/addDoctor.jsp">'+
		                              '<div class="row mb-3">'+
		                                  '<div class="col-md-6">'+
		                                      '<label for="doctorName" class="form-label">Doctor Name</label>'+
		                                      '<div class="input-group">'+
		                                          '<span class="input-group-text"><i class="fas fa-user"></i></span>'+
		                                          '<input type="text" class="form-control" id="doctorName" required name="doctorName">'+
		                                      '</div>'+
		                                  '</div>'+
										  '<div class="col-md-6">'+
										  	'<label for="doctorAge" class="form-label">Age</label>'+
										  	'<div class="input-group">'+
										  	'<span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>'+
										  	'<input type="number" class="form-control" id="doctorAge" required name="doctorAge">'+
										  	'</div>'+
										  	'</div>'+
		                              '</div>'+
		                              '<div class="row mb-3">'+
		                                  
		                                  '<div class="col-md-6">'+
		                                      '<label for="doctorSpeciality" class="form-label">Speciality</label>'+
		                                      '<div class="input-group">'+
		                                          '<span class="input-group-text"><i class="fas fa-stethoscope"></i></span>'+
		                                          '<input type="text" class="form-control" id="doctorSpeciality" required name="doctorSpeciality">'+
		                                      '</div>'+
		                                  '</div>'+
										  '<div class="col-md-6">'+
										  	'<label for="doctorAdmitDate" class="form-label">Admit Date</label>'+
										  	'<div class="input-group">'+
										  	'<span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>'+
										  	'<input type="datetime-local" class="form-control" id="doctorAdmitDate" required name="doctorAdmitDate">'+
										  	'</div>'+
										  	'</div>'+
		                              '</div>'+
		                              '<div class="row mb-3">'+
		                                  '<div class="col-md-6">'+
		                                      '<label for="doctorAddress" class="form-label">Address</label>'+
		                                      '<div class="input-group">'+
		                                          '<span class="input-group-text"><i class="fas fa-home"></i></span>'+
		                                          '<input type="text" class="form-control" id="doctorAddress" required name="doctorAddress">'+
		                                      '</div>'+
		                                  '</div>'+
		                                  '<div class="col-md-6">'+
		                                      '<label for="doctorPhNo" class="form-label">Phone Number</label>'+
		                                      '<div class="input-group">'+
		                                          '<span class="input-group-text"><i class="fas fa-phone"></i></span>'+
		                                          '<input type="tel" class="form-control" id="doctorPhNo" required name="doctorPhNo">'+
		                                      '</div>'+
		                                  '</div>'+
		                              '</div>'+
		                              '<div class="row mb-3">'+
		                                  '<div class="col-md-6">'+
		                                      '<label for="doctorWorkingHours" class="form-label">Working Hours</label>'+
		                                      '<div class="input-group">'+
		                                          '<span class="input-group-text"><i class="fas fa-clock"></i></span>'+
		                                          '<select id="doctorWorkingHours" name="workingHours"  class="form-select">'+
												  '<option value="8am to 8pm">8am to 8pm(Morning)</option>'+
												  '<option value="8pm to 8am">8pm to 8am(Night)</option>'+
												  '</select>'+
		                                      '</div>'+
		                                  '</div>'+
										  '<div class="col-md-6">'+
										  '<label for="doctorSalary" class="form-label">Doctor Salary</label>'+
										  '<div class="input-group">'+
										  '<span class="input-group-text"><i class="fa-solid fa-indian-rupee-sign"></i></span>'+
										  '<input type="number" class="form-control" id="doctorSalary" required name="doctorSalary">'+
										  '</div>'+
										  '</div>'+
		                              '</div>'+
		                              '<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">'+
		                                  '<button type="submit" class="btn btn-primary me-md-2">'+
		                                      '<i class="fas fa-plus-circle me-2"></i>Add Doctor'+
		                                  '</button>'+
		                              '</div>'+
		                          '</form>'+
		                      '</div>'+
		                  '</div>'+
		              '</div>'+
		          '</div>'+
		      '</div>'+
			  '<form method="POST" action="./deleteDoctor">'+
		      '<table class="table table-hover table-warning caption-top" id="table-rounded">' +
		      '<caption class="text-light fs-5">Patient Details</caption>' +
		      '<thead class="rounded">' +
		      '<tr class="rounded">' +
		      '<th scope="col"></th>' +
		      '<th scope="col">Doctor ID</th>' +
		      '<th scope="col">Doctor Name</th>' +
		      '<th scope="col">Age</th>' +
		      '<th scope="col">Doctor Speciality</th>' +
		      '<th scope="col">Doctor Joining Date</th>' +
		      '<th scope="col">Doctor Address</th>' +
		      '<th scope="col">Doctor Phone Number</th>' +
		      '<th scope="col">Doctor Salary</th>' +
		      "</tr>" +
		      "</thead>" +
		      '<tbody class="rounded">';
          onPageClickChange.innerHTML = "Doctor";
			  fetch('./DoctorData')
			  .then((response)=>response.json())
			  .then((data)=>
				data.forEach((index)=>{
					doctor+=`<tr class="rounded">` +
							 `<td scope="row"><div class="form-check">` +
							      `<input class="form-check-input" type="checkbox" value="${index.doctorId}" name="doctorId">` +
								  `</div>`+
							`</td>` +
								  `<th scope="row">${index.doctorId}</th>` +
							      `<td>${index.doctorName}</td>` +
							      `<td>${index.doctorAge}</td>` +
							      `<td>${index.doctorSpeciality}</td>` +
							      `<td>${index.doctorJoinedDate}</td>` +
							      `<td>${index.doctorAddress}</td>` +
							      `<td>${index.doctorPhnNo}</td>` +
							      `<td>${index.doctorSalary}</td>` +
							      `</tr>`;
								  console.log(data);
				})
			  ).then(()=>{
				doctor=doctor+
				'</tbody>'+
		      "</table>" +
			  '<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">'+
			  		                                  '<button type="submit" class="btn btn-danger me-md-2">'+
			  		                                      '<i class="fas fa-minus-circle me-2"></i>Delete Doctor'+
			  		                                  '</button>'+
			  		                              '</div>'+
			  '</form>'+
			  "</div>";
		  rightSection.innerHTML = doctor;
			  });
			  	setTimeout(()=>{					
				let doctorPhnNo = document.querySelector('#doctorPhNo');
				if (doctorPhnNo) {
					
				      doctorPhnNo.addEventListener("input", () => {
				        if (doctorPhnNo.value.length > 10) {
				          doctorPhnNo.value = doctorPhnNo.value.slice(0, 10);
				          alert("Please enter a 10-digit number.");
				        }
				      });
				    } else {
				      console.error("Doctor phone number input field not found.");
				    }
				},2000)
				  
          break;
        case 4:
          rightSection.innerHTML = "";
		  let employee =		  '<div class="container mt-5 w-100 ">'+
		         '<div class="row justify-content-center ">'+
		             '<div class="col-md-8 w-100">'+
		                 '<div class="card bg-primary-subtle">'+
		                     '<div class="card-header text-center">'+
		                         '<h2><i class="bi bi-person-plus-fill me-2"></i>Employee Details</h2>'+
		                     '</div>'+
		                     '<div class="card-body">'+
		                         '<form method="POST" action="./addStaff">'+
		                             '<div class="row mb-3">'+
		                                 '<div class="col-md-6 w-100">'+
		                                     '<label for="staffName" class="form-label"><i class="bi bi-person me-2"></i>Name</label>'+
		                                     '<input type="text" class="form-control" id="staffName" required name="staffName">'+
		                                 '</div>'+
		                             '</div>'+
		                             '<div class="row mb-3">'+
		                                 '<div class="col-md-6">'+
		                                     '<label for="staffAge" class="form-label"><i class="bi bi-calendar me-2"></i>Age</label>'+
		                                     '<input type="number" class="form-control" id="staffAge" required name="staffAge">'+
		                                 '</div>'+
		                                 '<div class="col-md-6">'+
		                                     '<label for="staffDesignation" class="form-label"><i class="bi bi-briefcase me-2"></i>Designation</label>'+
		                                     '<input type="text" class="form-control" id="staffDesignation" required name="staffDesignation">'+
		                                 '</div>'+
		                             '</div>'+
		                             '<div class="row mb-3">'+
		                                 '<div class="col-md-6">'+
		                                     '<label for="staffAdmitDate" class="form-label"><i class="bi bi-calendar-date me-2"></i>Admit Date</label>'+
		                                     '<input type="datetime-local" class="form-control" id="staffAdmitDate" required name="staffAdmitDate">'+
		                                 '</div>'+
		                                 '<div class="col-md-6">'+
		                                     '<label for="staffPhNo" class="form-label"><i class="bi bi-telephone me-2"></i>Phone No</label>'+
		                                     '<input type="tel" class="form-control" id="staffPhNo" required name="staffPhNo">'+
		                                 '</div>'+
		                             '</div>'+
									 '<div class="row mb-3">'+
									 '<div class="col-md-6">'+
									 '<label for="staffSalary" class="form-label"><i class="bi bi-calendar-date me-2"></i>Staff Salary</label>'+
									 	'<input type="number" class="form-control" id="staffSalary" required name="staffSalary">'+
									 	'</div>'+
									 '</div>'+
		                             '<div class="mb-3">'+
		                                 '<label for="staffAddress" class="form-label"><i class="bi bi-geo-alt me-2"></i>Address</label>'+
		                                 '<textarea class="form-control" id="staffAddress" rows="3" required name="staffAddress"></textarea>'+
		                             '</div>'+
		                             '<div class="d-grid gap-2 d-md-flex justify-content-md-end">'+
		                                 '<button type="submit" class="btn btn-primary me-md-2"><i class="bi bi-plus-circle me-2"></i>Add</button>'+
		                             '</div>'+
		                         '</form>'+
		                     '</div>'+
		                 '</div>'+
		             '</div>'+
		         '</div>'+
		     '</div>'+
			 '<form method="POST" action="./deleteStaff">'+
		  	 '<table class="table table-hover table-primary caption-top mt-5" id="table-rounded">' +
		     '<thead class="rounded">' +
		     '<tr class="rounded">' +
		     '<th scope="col"></th>' +
		     '<th scope="col">Staff ID</th>' +
		     '<th scope="col">Staff Name</th>' +
		     '<th scope="col">Age</th>' +
		     '<th scope="col">Staff Designation</th>' +
		     '<th scope="col">Staff Joined Date</th>' +
		     '<th scope="col">Staff Address</th>' +
		     '<th scope="col">Staff Phn No</th>' +
		     '<th scope="col">Staff Salary</th>' +
		     "</tr>" +
		     "</thead>" +
		     '<tbody class="rounded">';
          onPageClickChange.innerHTML = "Employee";
		  fetch("./StaffData")
		  .then((response)=>response.json())
		  .then((data)=>(
			data.forEach((index)=>{
				employee+=`<tr class="rounded"> `+
				`<td scope="row"><div class="form-check">` +
										      `<input class="form-check-input" type="checkbox" value="${index.staffId}" name="staffId">` +
											  `</div>`+
										`</td>` +
						     `<td scope="row">${index.staffId}</td>` +
						     `<td>${index.staffName}</td>` +
						     `<td>${index.staffAge}</td>` +
						     `<td>${index.staffDesignation}</td>` +
						     `<td>${index.staffJoinedDate}</td>` +
						     `<td>${index.staffAddress}</td>` +
						     `<td>${index.staffPhnNo}</td>` +
						     `<td>${index.staffSalary}</td>` +
						     `</tr>`;	
			})
		  ))
		  .then(()=>{			
		     employee+='</tbody>'+
			 '</table>' +
			 '<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">'+
			 	'<button type="submit" class="btn btn-danger me-md-2">'+
			 	'<i class="fas fa-minus-circle me-2"></i>Delete Employee'+
			 	'</button>'+
			 	'</div>'+
			 '</form>'+
			 '</div>';
          rightSection.innerHTML = employee;
		  })
		  setTimeout(()=>{					
		  				let staffPhnNo = document.querySelector('#staffPhNo');
		  				if (staffPhnNo) {
		  					
		  				      staffPhnNo.addEventListener("input", () => {
		  				        if (staffPhnNo.value.length > 10) {
		  				          staffPhnNo.value = staffPhnNo.value.slice(0, 10);
		  				          alert("Please enter a 10-digit number.");
		  				        }
		  				      });
		  				    } else {
		  				      console.error("Doctor phone number input field not found.");
		  				    }
		  				},2000)
		     
          
          break;
        case 5:
          rightSection.innerHTML = "";
		  let patientIds = [];
				fetch('./PatientData')
				.then((response)=>response.json())
				.then((data)=>(
								data.forEach((index)=>{						
						patientIds.push(index);
						
					})
				))
		      let ward = 
			  ' <div class="container-fluid d-flex justify-content-center align-items-center flex-wrap border border-dark-subtle text-light rounded w-100 p-4 ">'+
			  '<div class="container mt-5">'+
			  		          '<div class="row justify-content-center">'+
			  		              '<div class="col-lg-8 w-100 mb-3">'+
			  		                  '<div class="card bg-info-subtle">'+
			  		                      '<div class="card-header">'+
			  		                          '<h2 class="text-center mb-0">Ward Details</h2>'+
			  		                      '</div>'+
			  		                      '<div class="card-body">'+
			  		                          '<form id="registrationForm" method="POST" action="./assignWard">'+
			  		                              '<div class="row mb-3">'+
			  		                                  '<div class="col-md-6">'+
			  		                                      '<label for="wardId" class="form-label">Ward Id</label>'+
			  		                                      '<div class="input-group">'+
			  		                                          '<input type="text" class="form-control" id="wardId" required name="wardId">'+
			  		                                      '</div>'+
			  		                                  '</div>'+
			  										  '<div class="col-md-6">'+
			  										  	'<label for="patientId" class="form-label">Patient Id </label>'+
			  										  	'<div class="input-group">'+
			  										  	'<input type="text" class="form-control" id="patientId" required name="patientId">'+ 
			  										  	'</div>'+
			  										  	'</div>'+
			  		                              '</div>'+
			  		                              '<div class="row mb-3">'+
			  		                                  
			  		                                  '<div class="col-md-6">'+
			  		                                      '<label for="doctorId" class="form-label">Enter Doctor Id</label>'+
			  		                                      '<div class="input-group">'+
			  		                                          '<input type="text" class="form-control" id="doctorId" required name="doctorId">'+
			  		                                      '</div>'+
			  		                                  '</div>'+
			  										  '<div class="col-md-6">'+
			  										  	'<label for="staffId" class="form-label">Enter Staff Id</label>'+
			  		                                      '<div class="input-group">'+
			  		                                          '<input type="text" class="form-control" id="staffId" required name="staffId">'+
			  		                                      '</div>'+
			  		                              '</div>'+
			  		                              '<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">'+
			  		                                  '<button type="submit" class="btn btn-primary me-md-2">'+
			  		                                      '<i class="fas fa-plus-circle me-2"></i>Assign Ward'+
			  		                                  '</button>'+
			  		                              '</div>'+
			  		                          '</form>'+
			  		                      '</div>'+
			  		                  '</div>'+
			  		              '</div>'+
			  		          '</div>'+
			  		      '</div>'+
			'<form method="POST" action="./deassignWard">'+
			  '<table class="table table-hover table-info caption-top mt-3" id="table-rounded ">'+
		      '<thead class="rounded">'+
		      '<tr class="rounded">'+
		      '<th scope="col"></th>'+
			  '<th scope="col"></th>'+
		      '<th scope="col">Ward ID</th>'+
		      '<th scope="col">Floor No</th>'+
		      '<th scope="col">Ward Type</th>'+
		      '<th scope="col">Status</th>'+
		      '<th scope="col">Patient Id</th>'+
		      '<th scope="col">Doctor Id</th>'+
		      '<th scope="col">Staff Id</th>'+
		      '</tr>'+
		      '</thead>'+
		      '<tbody class="rounded">';
			  onPageClickChange.innerHTML = "Ward";
			  fetch('./WardData')
			  .then((response)=>response.json())
			  .then((data)=>(
				data.forEach((index)=>{
					ward+=`<tr class="rounded">`+
							 `<td scope="row">`+
							      `</td>`+
								  
								  `<td scope="row"><div class="form-check">` +
								  	`<input class="form-check-input" type="checkbox" value=${index.wardId} name="wardId" id="flexCheckIndeterminate">` +
								  	`</td>` +
							     	`<td scope="row">${index.wardId}<input type="text" value=${index.wardId}  hidden></td>`+
							      `<td>${index.FloorNo}</td>`+
							      `<td>${index.wardType}</td>`+
							      `<td>${index.wardIsAssigned===0 ?`<button type="submit" class="btn btn-success" role="button">Not Assigned </button>`:`<button type="button" class="btn btn-danger" disabled> Assigned </button>`}</td>`+
								  `<td>${index.patientId===null || index.patientId===0 ?
									`<p class="text-danger  fs-4">N/A</p>`
									:`<p class="text-success  fs-4"> ${index.patientId}</p>`
								}</td>`+
								`<td>${index.doctorId===null || index.doctorId===0 ?
								`<p class="text-danger  fs-4">N/A</p>`
								:`<p class="text-success  fs-4">${index.doctorId}</p>`
								}</td>`+
								`<td>${index.staffId===null || index.staffId===0 ?
							`<p class="text-danger  fs-4">N/A</p>`
							:`<p class="text-success  fs-4">${index.staffId}</p>`
						}</td>`+
							`</form>`+
							`</tr>`;
				})
			  ))
			  .then(()=>{
				ward+='</tbody>'+
		      '</table>'+
			  '<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">'+
			  	'<button type="submit" class="btn btn-danger me-md-2">'+
			  	'<i class="fas fa-minus-circle me-2"></i>Deassign Ward'+
			  	'</button>'+
			  	'</div>'+
			  	'</form>'+
		      '</div>';
          rightSection.innerHTML = ward;
			  });
		      
         
          break;
        case 6:
          rightSection.innerHTML = "";
		  let medicine = '<div class="container mt-5 p-4  border border-dark-subtle rounded">'+
		  	        '<h1 class="text-center mb-3"><i class="bi bi-capsule me-2"></i>Medicine Management</h1>'+
		  	        '<form method="POST" action="./addMedicine">'+
		  	            '<div class="row mb-3">'+
		  	                '<div class="col-md-6">'+
		  	                    '<label for="medicineName" class="form-label">Medicine Name</label>'+
		  	                    '<input type="text" class="form-control" id="medicineName" name="medicineName"required>'+
		  	                '</div>'+
		  	                '<div class="col-md-6">'+
		  	                    '<label for="medicineType" class="form-label">Medicine Type</label>'+
		  	                    '<select class="form-select" id="medicineType" required name="medicineType">'+
		  	                        '<option value="">Select type</option>'+
		  	                        '<option value="cough">Cough</option>'+
		  	                        '<option value="pain">Pain Relief</option>'+
		  	                        '<option value="antibiotic">Antibiotic</option>'+
		  	                        '<option value="antiviral">Antiviral</option>'+
		  	                        '<option value="antihistamine">Antihistamine</option>'+
		  	                        '<option value="vitamin">Vitamin</option>'+
		  	                    '</select>'+
		  	                '</div>'+
		  	            '</div>'+
		  	            '<div class="row mb-3">'+
		  	                '<div class="col-md-6">'+
		  	                    '<label for="quantity" class="form-label">Quantity</label>'+
		  	                    '<input type="number" class="form-control" id="quantity" name="quantity" required>'+
		  	                '</div>'+
		  	                '<div class="col-md-6">'+
		  	                    '<label for="expiryDate" class="form-label">Expiry Date</label>'+
		  	                    '<input type="datetime-local" class="form-control" id="expiryDate" name="expiryDate" required>'+
		  	                '</div>'+
		  	            '</div>'+
		  	            '<div class="d-flex justify-content-end">'+
		  	                '<button type="submit" class="btn btn-primary me-2"><i class="bi bi-plus-circle me-2"></i>Add</button>'+
		  	                
		  	            '</div>'+
		  	        '</form>'+
					'<form method="POST" action="./deleteMedicine">'+
		  	        '<table class="table table-striped table-hover">'+
		  	            '<thead>'+
		  	                '<tr>'+
							'<th scope="col"></th>'+
		  	                    '<th>Medicine Name</th>'+
		  	                    '<th>Type</th>'+
		  	                    '<th>Quantity</th>'+
		  	                    '<th>Expiry Date</th>'+
		  	                    '<th>Actions</th>'+
		  	                '</tr>'+
		  	            '</thead>'+
		  	            '<tbody>';
          onPageClickChange.innerHTML = "Medicine";
		  	                fetch('./MedicineData')
							.then((response)=>response.json())
							.then((data)=>(
							data.forEach((index)=>{
								medicine+=`<tr>`+
								`<td scope="row"><div class="form-check">` +
								`<input class="form-check-input" type="checkbox" value=${index.medicineId} name="medicineId" id="flexCheckIndeterminate">` +
								`</td>` +
										  `<td>${index.medicineName}</td>`+
										  `<td>${index.medicineType}</td>`+
										  `<td>${index.quantity}</td>`+
										  `<td>${index.expiryDate}</td>`+
										  `<td>`+
										  `<button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i>Delete</button>`+
										  `</td>`+
										  `</tr>`;
							})	
							))
							.then(()=>{
								
		  	            medicine+='</tbody>'+
		  	        			'</table>'+
								'</form>'+
		  	    				'</div>';
          rightSection.innerHTML = medicine;
		  })
		  	               
          break;
        case 7:
          rightSection.innerHTML = "";
		  let payments ='<form method="POST" action="">'+ 
		  			'<div class="container-fluid d-flex justify-content-center align-items-center flex-wrap border border-dark-subtle text-light rounded w-100 p-4 ">'+
		  		  '<table class="table table-hover table-danger caption-top" id="table-rounded">'+
		  		  '<h1 class="text-dark fs-2 text-center mb-3">Payment Details</h1>'+
		  		  '<thead class="rounded">'+
		  		  '<tr class="rounded">'+
		  		  '<th scope="col"></th>'+
		  		  '<th scope="col">Payment ID</th>'+
		  		  '<th scope="col">Patient Id</th>'+
		  		  '<th scope="col">Payment Status</th>'+
		  		  '<th scope="col">Ward Id</th>'+
		  		  '<th scope="col">Ward Type</th>'+
		  		  '<th scope="col">Fees Paid</th>'+
		  		  '<th scope="col">Fees Due</th>'+
		  		  '<th scope="col">Total Fees</th>'+
		  		  '</tr>'+
		  		  '</thead>'+
		  		  '<tbody class="rounded">';
          onPageClickChange.innerHTML = "Payments";
				  fetch('./PaymentData')
				  .then((response)=>response.json())
				  .then((data)=>{
					data.forEach((index)=>{
						payments+=`<tr class="rounded">`+
								  `<td scope="row"><div class="form-check">`+
								  `<input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">`+
								  `</div>`+	
								  `</td>`+
								  `<td scope="row">${index.paymentId}</td>`+
								  		  `<td>${index.patientId}</td>`+
								  		  `<td id="paymentStatusbg">${index.paymentStatus=="Payed"?'<p class="bg-success text-center text-white">Done</p>':'<p class="bg-danger bg-success text-center text-white">Not Done</p>'}</td>`+
								  		  `<td>${index.wardId}</td>`+
								  		  `<td>${index.wardType}</td>`+
								  		  `<td>${index.feesPaid}</td>`+
								  		  `<td>${index.feesDue}</td>`+
								  		  `<td>${index.totalFees}</td>`+
								  		  `</tr>`;
					})
				  }).then(()=>{
					payments=payments+
		  		  	'</tbody>'+
					'</table>'+
		  		  '<button type="button" class="btn btn-danger  mb-3 me-5 w-25">Delete Payment</button>'+
		  		  '</form>'+
				  '</div>';
          rightSection.innerHTML = payments;
				  })
         
          break;
		  case 8:
		/*	let results = "";
			rightSection.innerHTML="";
				let search = document.querySelector('#searchBar');
							search.addEventListener('input',()=>{
								results=search.value;
						console.log(results)		
						})
				
								let reports = '<table class="table table-dark table-borderless" id="reportTable">'+
											'<thead>'+
											    '<tr>'+
											      '<th scope="col">Patient Id</th>'+
											      '<th scope="col">Patient Name</th>'+
											      '<th scope="col">Patient Disease</th>'+
											      '<th scope="col">Patient Admitted On</th>'+
												  '<th scope="col">Doctor Id</th>'+
												  '<th scope="col">Doctor Name</th>'+
												  '<th scope="col">Doctor Speciality</th>'+
												  '<th scope="col">Ward Id</th>'+
												  '<th scope="col">Floor No</th>'+
												  '<th scope="col">Ward Type</th>'+
											    '</tr>'+
											  '</thead>'+
											  '<tbody class="table-group-divider">';
											    
												fetch('./PatientData')
															.then((response)=>response.json())
															.then((data)=>(
																data.forEach((index)=>{					
																	'<tr>'+
																`<th scope="row">${index.patientId}</th>`+
																`<td>Mark</td>`+
																`<td>Otto</td>`+
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																`<td>@mdo</td>`;
																
																console.log(index.patientId);
																
																})
															))
															.then(()=>{

																	 reports=reports+'</tr>'+
																	'</tbody>'+
																	'</table>';
																	console.log("In last then")
															rightSection.innerHTML=reports;
															});
																
											     
											
				
							
      }
    }*/
	case 8:
		rightSection.innerHTML = ""; // Clear existing content

		let newpatientTable =
		  '<form method="POST" action="./deletePatient">' +
		  '<div class="container-xl container-fluid d-flex justify-content-center align-items-center flex-wrap text-light rounded p-4 mt-1">' +
		  '<h1 class="text-dark fs-2 text-center mb-3" style="font-family:Roboto Condensed">Patient Details</h1>' +
		  '<table class="table table-hover table-success caption-top border border-dark-subtle w-100" id="table-rounded">' +
		  '<thead class="rounded">' +
		  '<tr class="rounded">' +
		  '<th scope="col">Patient ID</th>' +
		  '<th scope="col">Patient Name</th>' +
		  '<th scope="col">Age</th>' +
		  '<th scope="col">Patient Blood Type</th>' +
		  '<th scope="col">Patient Disease</th>' +
		  '<th scope="col">Patient Admitted On</th>' +
		  '<th scope="col">Patient Left On</th>' +
		  '<th scope="col">Ward Id</th>' +
		  '<th scope="col">Ward Type</th>' +
		  '<th scope="col">Doctor ID</th>' +
		  '<th scope="col">Doctor Name</th>' +
		  '<th scope="col">Doctor Designation</th>' +
		  '</tr>' +
		  '</thead>' +
		  '<tbody id="tableBody" class="rounded">';

		Promise.all([
		  fetch('./PatientData').then((res) => res.json()),
		  fetch('./WardData').then((res) => res.json()),
		  fetch('./DoctorData').then((res) => res.json()),
		])
		  .then(([patients, wards, doctors]) => {
		    let rows = "";

		    patients.forEach((patient) => {
		      // Find ward data for the current patient
		      const ward = wards.find((wd) => wd.patientId === patient.patientId) || {};
		      const doctor = doctors.find((doc) => doc.doctorId === ward.doctorId) || {};

		      // Construct the table row with all data
		      rows += `
		        <tr class="rounded">
		          <td>${patient.patientId}</td>
		          <td>${patient.patientName}</td>
		          <td>${patient.patientAge}</td>
		          <td>${patient.patientBloodType}</td>
		          <td>${patient.patientDisease}</td>
		          <td>${patient.patientAdmittedOn}</td>
		          <td>${patient.patientLeftOn}</td>
		          <td>${ward.wardId || "N/A"}</td>
		          <td>${ward.wardType || "N/A"}</td>
		          <td>${doctor.doctorId || "N/A"}</td>
		          <td>${doctor.doctorName || "N/A"}</td>
		          <td>${doctor.doctorSpeciality || "N/A"}</td>
		        </tr>`;
		    });

		    newpatientTable += rows + "</tbody></table>";
		    newpatientTable +=
		      '</form>' +
		      '</div>';

		    // Render the table
		    rightSection.innerHTML = newpatientTable;

		    // Add search functionality
		    const searchInput = document.getElementById("searchInput");
		    const tableBody = document.getElementById("tableBody");

		    searchInput.addEventListener("input", (event) => {
		      const filter = event.target.value.toLowerCase();
		      const rows = tableBody.querySelectorAll("tr");

		      rows.forEach((row) => {
		        const cells = row.querySelectorAll("td");
		        const rowText = Array.from(cells)
		          .map((cell) => cell.textContent.toLowerCase())
		          .join(" ");

		        if (rowText.includes(filter)) {
		          row.style.display = ""; // Show row
		        } else {
		          row.style.display = "none"; // Hide row
		        }
		      });
		    });
		  })
		  .catch((error) => {
		    console.error("Error fetching data:", error);
		    rightSection.innerHTML = "<p>Error loading data. Please try again later.</p>";
		  });

	    break;

	   }
	   }