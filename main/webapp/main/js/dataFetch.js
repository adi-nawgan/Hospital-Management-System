const div = document.querySelector("#data");

	fetch("../Demo")
		.then((response)=>response.json())
		.then((data)=>{
			 let length = data.length;
			 console.log(data)
			 let tableHTML='<div class="container-fluid d-flex justify-content-center align-items-center flex-wrap border border-dark-subtle text-light rounded w-100 p-4">' +
		      '<table class="table table-hover table-success caption-top" id="table-rounded">' +
		      '<caption class="text-light fs-5">Patient Details</caption>' +
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
			data.forEach((index,value)=>{
				tableHTML+=
				`<tr class="rounded">`+
					`<td scope="row">`+
				`<div class="form-check">` +
				      `<input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">`+
				      `</td>`+
					  `</div>`+
			      `<td scope="row" class="text-dark">${index.patientId }</td>` +
			      `<td>${index.patientName}</td>`+
			      `<td>${index.patientAge}</td>` +
			      `<td>${index.patientPhnNo}</td>` +
			      `<td>${index.patientEmail}</td>` +
			      `<td>${index.patientBloodType}</td>` +
			      `<td>${index.patientAddress}</td>` +
			      `<td>${index.patientDisease}</td>` +
			      `<td>${index.patientAdmittedOn}</td>` +
			      `<td>${index.patientLeftOn}</td>` +
			      `<td>${index.patientWardType}</td>` +
			      `<td></td>` +
				  `<td></td>` +
				  `<td></td>`;
			     console.log(index.patientId )
			     console.log(index.patientName.toString());
			})		
		
			tableHTML+='</tr>'+
			      '</table>'
				'<button type="button" class="btn btn-success mb-3 me-5 w-25">Add Patient</button>' +
		      '<button type="button" class="btn btn-danger  mb-3 me-5 w-25">Delete Patient</button>' +
		      "</div>";
			  
			  div.innerHTML=tableHTML;
		});



