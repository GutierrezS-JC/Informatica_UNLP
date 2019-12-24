function chequearVacio(){
  if(document.getElementById('comentario').value==""){
    alert('No se permiten comentarios sin contenido');
    return false;
  }
  else {
    return true;
  }
}


function chequearAlfanumericos(){
  var AlfaNumerico= /[0-9a-zA-Z]/;
    for(let i=0; i < document.getElementById('comentario').value.length; i++){
      if ((!(cadena[i].match(AlfaNumerico))) && (!(cadena[i]=" "))){
        alert("Por favor, use solo caracteres alfanumericos");
        return false;
      }
    }
    //completo el for por lo que todos cumplen
    return true;
  }

/*function chequearLongitud(){
    if(document.getElementById('comentario').value.length>5){
      return false;
      alert("Por favor, no supere el limite maximo de caracteres");
    }
    else {
      return true;
    }
  }
*/
/*function validar(cadena){
  if(chequearVacio() && chequearAlfanumericos(cadena) && chequearLongitud(cadena)){
    return true;
    alert("Publicacion realizada con exito")
  }
  else {
    return false;
  }
}*/



/*==================================REGISTRO========================================*/
var Abecedario= /[a-zA-Z]/;
var AbecedarioMinus= /[a-z]/;
var AbecedarioMayus= /[A-Z]/;
var AlfaNumerico= /[0-9a-zA-Z]/;
var caracteresEspeciales=/[!"#$%&'()*+,-./:;<=>?@[^_`{|}~]/;
var numeros=/[0-9]/;

function validarAlfabeticosDos(cadena){
    for(let i=0; i < cadena.length; i++){
      if (!(cadena[i].match(Abecedario)) && !(cadena[i]==" ")){
        return false;
      }
    }
    //completo el for por lo que todos cumplen
    return true;
}

function chequearUser(){
  /*let name=document.getElementById('nombre').value;*/
  /*let apellido=document.getElementById('apellido').value;*/
  if(document.getElementById('nombre').value=="" || !validarAlfabeticosDos(document.getElementById('nombre').value)){
    alert("nombre o apellido no valido,use solo caracteres alfabeticos");
    return false;
  }
  else
    if (document.getElementById('apellido').value=="" || !validarAlfabeticosDos(document.getElementById('apellido').value)) {
      alert("nombre o apellido no valido,use solo caracteres alfabeticos");
      return false
    }
    else
      return true;
}

function validarPsw(cadena){
  var mayusculas= false;
	var minusculas= false;
	var numeroOSimbolo= false;
  for(let i=0;i < cadena.length; i++){
    if(cadena[i].match(caracteresEspeciales) || cadena[i].match(numeros)){
      numeroOSimbolo= true;
    }
    if(cadena[i].match(AbecedarioMinus)){
      minusculas= true;
    }
    if(cadena[i].match(AbecedarioMayus)){
      mayusculas= true;
    }
  }
  if (mayusculas==true && minusculas==true && numeroOSimbolo==true){
    return true;
  }
  else {
    return false;
  }
}

function pswCoinciden(clave1,clave2){
		if (clave1 == clave2){
			return true;
    }
		else{
			return false;
	  }
}

function chequearPsw(){
  let psw=document.getElementById('psw').value;
  let pswConfirm=document.getElementById('psw-repeat').value;

  if(psw.length<6 || !validarPsw(psw) || !pswCoinciden(psw,pswConfirm)){
    alert('Verifique la contraseña');
    return false;
  }
  else {
    return true;
  }
}
function chequearUsername(){
  let cadena=document.getElementById('username').value;
	if (cadena != ""){
		if (cadena.length > 5){
			for(let i=0;i< cadena.length;i++){
				if (!cadena[i].match(AlfaNumerico)){
          alert("El nombre de usuario solo puede ser alfanumerico");
					return false;
				}
			}
    }
		else{
      alert("El nombre de usuario debe ser mayor a 5");
			return false;
		}
  }
	return true;
}
function validarEmail() {
  emailRegex = /^(?:[^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*|"[^\n"]+")@(?:[^<>()[\].,;:\s@"]+\.)+[^<>()[\]\.,;:\s@"]{2,63}$/i;
  let cadena=document.getElementById('email').value;
  if (emailRegex.test(cadena)) {
    return true;
  } else {
    alert('El email es invalido')
    return false;
  }
}

function validar(){
  if(chequearUser() && chequearPsw() && chequearUsername()&& validarEmail()){
    return true;
  }
  else {
    return false;
  }
}
