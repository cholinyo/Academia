/**
 * 
 */
function initMap() {
  var uluru = {lat: 39.9652, lng: -0.26};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 7,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}
function existePassword(){
	if (password1 == ""){
		alert("Complete la Contraseña");
		return (false);
}
}


function comprobarPassword(){  //Coprueba que password1 y passord2 sean iguales;
	password1 = document.getElementById("password").value;
	password2 = document.getElementById("password2").value;
	if (password1 == ""){
	alert("Complete la Contraseña");
	return (false);
	}
	if (password1 < 4){
	alert("La contraseña debe ser mayor de 4 digitos")
	return (false);
	}

	if (password2 == ""){
	alert("Debe confirmar la contraseña");
	return (false);
	} 

	if (password1 != password2){
	alert("La contraseña confirmada no concuerda con la contraseña escrita");
	return (false);
	}
} 

function pregunta(){
    if (confirm('¿Estas seguro de enviar este formulario?')){
       document.NOMBREDELFORMULARIO.submit()
    }
}
	