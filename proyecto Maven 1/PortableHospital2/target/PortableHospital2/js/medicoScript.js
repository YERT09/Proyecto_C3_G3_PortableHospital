
 function guardarMedico(e){
	e.preventDefault();
	var tarjetaProfesional = document.getElementById("tarjetaProfesional").value;
	var especialidad = document.getElementById("especialidad").value;
	var salario = document.getElementById("salario").value;
	var cedulaPersona = document.getElementById("Persona_cedula").value;
	var unMedico = {
		tarjetaProfesional: tarjetaProfesional,
		especialidad: especialidad,
		salario: salario,
		cedulaPersona: cedulaPersona
		
	};

fetch("http://localhost:8080/PortableHospital2/services/medico.html", {
	method: "POST",
	headers: {"Content-type": "application/json; charset=UTF-8",
		        "Access-Control-Allow-Origin": "*",
		         "accept": 'application/json',


	},
	body: JSON.stringify(unMedico),

})
.then(response => response.json)
.then(data => console.log(data))
.catch(err => console.log(err));

}

