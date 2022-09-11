
 function guardarConsulta(){
	var motivo = document.getElementById("motivo").value;
	var enfermedadActual = document.getElementById("enfermedadActual").value;
	var anamnesis = document.getElementById("anamnesis").value;
	var diagnostico = document.getElementById("diagnostico").value;
	
	let fecha = new Date();
	let fechaFormateada = fecha.getFullYear()+"-"+fecha.getMonth()+1+"-"+fecha.getDay();
	var unaConsulta = {
		fecha: fechaFormateada,
		motivo: motivo,
		enfermedadActual: enfermedadActual,
		anamnesis: anamnesis,
		diagnostico: diagnostico,
		idHistoriaClinica: 1,
		Medico_tarjetaProfesional: 1
		
	};
	
fetch("http://localhost:8080/PortableHospital2/services/consulta", {
	method: "POST",
	headers: {"Content-type": "application/json; charset=UTF-8",
	        "Access-Control-Allow-Origin": "*"
},

	body: JSON.stringify(unaConsulta),
})
.then(response => response.json)
.then(data => console.log(data))
.catch(err => console.log(err));
	
}

