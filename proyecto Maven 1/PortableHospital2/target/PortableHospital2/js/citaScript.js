
 function guardarCita(e){
	e.preventDefault();
	
	var fecha = document.getElementById("fecha").value;
	var idPaciente = document.getElementById("cedulaPersona").value;
	var tarjetaProfesional = document.getElementById("tarjetaProfesional").value;
	
	var unaCita = {
		fecha_cita: fecha,
		idPaciente: idPaciente,
		tarjetaProfesional: tarjetaProfesional
		
	};
	
fetch("http://localhost:8080/PortableHospital2/services/cita", {
	method: "POST",
	headers: {"Content-type": "application/json; charset=UTF-8",
	        "Access-Control-Allow-Origin": "*"
},

	body: JSON.stringify(unaCita),
})
.then(response => response.json)
.then(data => console.log(data))
.catch(err => console.log(err));
	
}

