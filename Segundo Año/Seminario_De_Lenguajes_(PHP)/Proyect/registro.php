<?php
  session_start();
  include_once('php/BD.php');
  include_once('php/auth.php');
  include_once('php/registro.php');
 ?>
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Registro</title>
    <link rel="stylesheet" href="css/registro.css">
    <script type="text/javascript" src="javascript/funciones.js">
    </script>
  </head>
  <body>
    <header>
      <div id="nombreDos">
        <a href="#"><img src="logo.png" alt=""></a>
      </div>
    </header>

    <form action="registro.php" onsubmit="return validar()" method="post" required>
    <div class="container">
     <h1>Registro</h1>
     <hr>
     <label for="nombre"><b>Nombre<br></b></label>
     <input type="text" placeholder="Ingrese su nombre" id='nombre' name="nombre" required>

     <label for="apellido"><b>Apellido</b></label>
     <input type="text" placeholder="Ingrese su apellido" name="apellido" id="apellido" required>

     <label for="username"><b>Nombre de Usuario</b></label>
     <input type="text" placeholder="Ingrese su nombre de usuario" name="username" id="username" required>

     <label for="psw"><b>Contraseña</b></label>
     <input type="password" placeholder="Ingrese su contraseña" name="psw" id='psw' required>

     <label for="psw-repeat"><b>Repetir Contraseña</b></label>
     <input type="password" placeholder="Repita la contraseña" name="psw-repeat" id="psw-repeat" required>

     <label for="email"><b>Correo Electrónico</b></label>
     <input type="text" placeholder="Ingrese su correo" name="email" id="email" required>

     <hr>
     <?php
     if ($auth->getError() != null){
       foreach ($auth->getError() as $value){
         echo "<p>$value</p>";
       }
     }
      ?>
     <button type="submit" name="registrar" class="registerbtn">Registrame!</button>
   </div>
</form>
<footer>
  <p>Juan Cruz Gutierrez - Gonzalo</p>
</footer>
  </body>
</html>
