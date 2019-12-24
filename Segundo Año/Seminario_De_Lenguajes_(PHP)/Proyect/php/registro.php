<?php
  include_once('auth.php');
  require_once('BD.php');
  $auth=new auth();
  if(isset($_POST['registrar'])){
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $email=$_POST['email'];
    $username=$_POST['username'];
    $password=$_POST['psw'];
    $passwordRepetido=$_POST['psw-repeat'];
    if(strlen($username)>5 && !empty($apellido) && strlen($password)>5  && !empty($nombre) && !empty($email)){
      $id=$auth->usuarioRegistrar($nombre,$apellido,$email,$username,$password,$passwordRepetido,$conn);
      if($id){
        $_SESSION['usuario']=$username;
        $_SESSION['nombre']=$nombre;
        header('Location: index.php'); //Redireccion a la pagina de inicio aka HOME
      }
    }
  }
 ?>
