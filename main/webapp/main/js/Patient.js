let phoneNo = document.getElementById("phoneNo");
phoneNo.addEventListener('input',()=>{
	let phoneNoValue=phoneNo.value;
	if(phoneNoValue.length > 10)
		{
			console.log(phoneNoValue)
			phoneNo.value = phoneNoValue.slice(0,10);
			window.alert("Please Enter A 10 Digit Number")
		}
		
})
