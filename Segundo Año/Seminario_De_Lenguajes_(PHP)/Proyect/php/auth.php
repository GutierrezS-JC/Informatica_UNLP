<?php
include_once('BD.php');

class auth
{
  private $error = array();

  private function setError($e){
    $this->error[] = $e;
  }

  public function getError(){
    return $this->error;
  }

  private function verificar_nombre($nombre){
    if (!empty($nombre) && ctype_alpha(str_replace(' ', '', $nombre))){
      return true;
    }
    else{
      $this->setError('Verifica el nombre');
      return false;
    }
  }
  private function verificar_apellido($apellido){
    if (!empty($apellido) && preg_match('/^[a-z\s]*$/i', $apellido)){
      return true;
    }
    else{
      $this->setError('Verificar apellido');
      return false;
    }
  }
  private function verificar_contrasenia($contrasenia,$contraseniaRepetida){
      $uppercase = preg_match('@[A-Z]@', $contrasenia);
      $lowercase = preg_match('@[a-z]@', $contrasenia);
      $specialChars = preg_match('@[^\w]@', $contrasenia);
      $number = preg_match('@[0-9]@', $contrasenia);
      if($lowercase && $uppercase && ($number || $specialChars) && strlen($contrasenia)>5 && ($contrasenia==$contraseniaRepetida)) {
      //if (!strlen($contrasenia)>5 || !preg_match('/^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])$/', $contrasenia)){
        //$this->setError('Verificar contraseña');
        return true;
      }
      else{
        $this->setError('Verificar contraseña');
        return false;
      }
    }
  private function verificar_email($email){
    if ( !empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)){
      return true;
    }
    else{
      $this->setError('Verificar el email');
      return false;
    }
  }
  public function usuarioRegistrar($nombre,$apellido,$email,$nombreUsuario,$contrasenia,$contraseniaRepetida,$conn){
    if($this->verificar_nombre($nombre) && $this->verificar_apellido($apellido) && $this->verificar_contrasenia($contrasenia,$contraseniaRepetida) && $this->verificar_email($email)) {
      $query=mysqli_query($conn,"SELECT nombreusuario FROM usuarios WHERE nombreusuario='$nombreUsuario'");
      $nume_rows=mysqli_num_rows($query);
      if($nume_rows==1){
        $this->setError("El nombre de usuario no esta disponible");
        return false;
      }
      else {
        $query=mysqli_query($conn,"INSERT INTO usuarios (id,nombreusuario,email,password,nombre,apellido) VALUES ('','$nombreUsuario','$email','$contrasenia','$nombre','$apellido')");
        return true;
      }
    }
    else{
      return false;
    }
  }
  /*public function usuarioRegistrar($nombre,$apellido,$email,$nombreUsuario,$contrasenia,$conn){
    if(empty($nombreUsuario)|| !strlen($nombreUsuario)>5 || empty($nombre) || empty($apellido) || empty($contrasenia) || !strlen($contrasenia)>5 || empty($email)) {
      $this->setError("Verifique los datos");
      return false;
    }
    else {
      $query=mysqli_query($conn,"SELECT nombreusuario FROM usuarios WHERE nombreusuario='$nombreUsuario'");
      $nume_rows=mysqli_num_rows($query);
      if($nume_rows==1){
        $this->setError("El nombre de usuario no esta disponible");
        return false;
      }
      else {
        $query=mysqli_query($conn,"INSERT INTO usuarios (id,nombreusuario,email,password,nombre,apellido) VALUES ('','$nombreUsuario','$email','$contrasenia','$nombre','$apellido')");
        return true;
      }
    }
  }*/

  public function inicioSesion($conn){
        $usuario=$_POST['username'];
        $password=$_POST['psw'];
        if(strlen($usuario)<6 || strlen($password)<6){
          $this->setError("Verifique los datos");
          return false;
        }
        else {
          //$query="SELECT * from usuarios WHERE nombreusuario='$usuario' AND password='$password'";
          $result=mysqli_query($conn,"SELECT * from usuarios WHERE nombreusuario='$usuario' AND password='$password'");
          $num_rows=mysqli_num_rows($result);
          $columna=mysqli_fetch_array($result,MYSQLI_ASSOC);
          $nombre=$columna['nombre'];
          if($num_rows==1){
            $_SESSION['usuario']=$usuario;
            $_SESSION['nombre']=$nombre;
            return true;
          }
          else {
            $this->setError("Vuelva a ingresar sus datos");
            return false;
          }
        }
  }
}
?>
