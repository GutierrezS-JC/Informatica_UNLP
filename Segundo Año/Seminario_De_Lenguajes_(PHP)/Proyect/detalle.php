<?php
  include_once('php/BD.php');
  include_once('php/auth.php');
  session_start();
  $id=$_GET['idPelicula'];
  if(!isset($_SESSION["usuario"])){
   $strLogin= "<div id='login'>
           <form action='detalle.php?idPelicula=".$id."'"."method='post'>
             <input type='text' placeholder='Usuario' name='username'>
             <input type='password' placeholder='Password' name='psw'>
             <button type='submit' name='loguearse'>Login</button>
           </form>
         </div>";
  }
  if(isset($_POST['loguearse'])){
    $auth= new auth();
    $loguear= $auth->inicioSesion($conn);
    if($loguear!=true){
      foreach ($auth->getError() as $value) {
        $error=$auth->getError();
      }
    }
  }

  //$id=$_GET['idPelicula'];
  $sql="SELECT peliculas.*,generos.genero FROM peliculas inner join generos ON generos.id=peliculas.generos_id where peliculas.id=$id";
  $result=mysqli_query($conn,$sql);
  $row=mysqli_fetch_assoc($result);

  $sqlDos="SELECT comentarios.*,usuarios.nombreusuario,usuarios.nombre,usuarios.apellido from comentarios inner join usuarios on usuarios.id=comentarios.usuarios_id  WHERE peliculas_id=$id ORDER BY fecha DESC";
  $resultDos=mysqli_query($conn,$sqlDos);
  $arregloComentarios=[];
  while($rowDos=mysqli_fetch_assoc($resultDos)){
    $esDestacado=$rowDos["usuarios_id"];
    $sqlDestacado="SELECT * from usuarios where id='$esDestacado'";
    $resultDestacado=mysqli_query($conn,$sqlDestacado);
    $rowDestacado=mysqli_fetch_assoc($resultDestacado);
    if($rowDestacado["destacado"]==1){
      $string ="<div class='posteo'>
        <div class='thead'>
          <p class='fecha'>".$rowDos['fecha']."</p>
          <p>ES DESTACADO</p>
        </div>
        <div class='imgDatos'>
          <br>
          <p class='nombreUsuario'>".$rowDos['nombre']." ".$rowDos['apellido']."</p>
          <br>
        </div>
        <div class='contenidoPosteo'>
          <p class='textoPosteov2'>".$rowDos['comentario']." </p>";
      for ($i=0;$i<$rowDos['calificacion'];$i++) {
        $string.=" <span class='fa fa-star checked'></span>";
      };
      $string.="</div>
    </div>";
      array_push($arregloComentarios,$string);
    }
    else {
      $string ="<div class='posteo'>
        <div class='thead'>
          <p class='fecha'>".$rowDos['fecha']."</p>
        </div>
        <div class='imgDatos'>
          <br>
          <p class='nombreUsuario'>".$rowDos['nombre']." ".$rowDos['apellido']."</p>
          <br>
        </div>
        <div class='contenidoPosteo'>
          <p class='textoPosteov2'>".$rowDos['comentario']." </p>";
      for ($i=0;$i<$rowDos['calificacion'];$i++) {
        $string.=" <span class='fa fa-star checked'></span>";
      };
      $string.="</div>
    </div>";
      array_push($arregloComentarios,$string);
    }
  }
  if(isset($_SESSION['usuario'])){
    include_once('php/comentario.php');
  }
 ?>
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/detalles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="javascript/funciones.js">
    </script>
    <title>Detalles</title>

  </head>
  <body>

    <header>
      <div id="nombre">
        <a href="index.php"><img src="logo.png" alt=""></a>
      </div>
      <div id="login">
        <?php
          if(!isset($_SESSION['usuario'])){
            echo $strLogin;
          }
          else {
            echo "<p style='color:white;font-size:20px;margin-right:20px;margin-top:25px;'>"."Bienvenido ".$_SESSION['usuario'];
            echo "<form action='desloguear.php'><input type='submit' name='desloguear' value='Cerrar Sesion'></form";
          }
        ?>
        <?php
        if(isset($_POST['loguearse'])){
          if($loguear!=true){
            foreach ($auth->getError() as $error) {
             echo "<p style='color:white;'>".$error."</p>";
           }
          }
        }
        ?>
      </div>
    </header>

    <div class="comentariosMainv2">
      <div>
        <?php
          $pelicula=$_GET['idPelicula'];
          $imagen="mostrarImagen.php?idPelicula=$pelicula";
         ?>
        <a href="#"><img src="<?php echo $imagen ?>" alt="Blops"></a>
      </div>
      <div class="datos">
        <?php echo "<h2>".$row['nombre']."</h2>"; ?>
        <?php echo "<h3>".$row['anio']."</h3>"; ?>
        <?php echo "<h3>".$row['genero']."</h3>"; ?>
        <?php echo "<p>".$row['sinopsis']."</p>"; ?>
      </div>
    </div>
<?php
  if(isset($_SESSION['usuario'])){
    if(!$yaComento){
    echo "<div class='boxComentar'>
      <div class='coment'>
        <h2>Deja un Comentario!</h2>
      <form class='cajaComentarios' action='detalle.php?".'idPelicula='.$id."' method='post' onsubmit='return chequearVacio();'>
        <textarea placeholder='Escribe tu comentario...' name='comentario'  id='comentario' rows='8' cols='80'></textarea>
        <select id='ordenar' name='puntuacion'>
          <option value='1'>1</option>
          <option value='2'>2</option>
          <option value='3'>3</option>
          <option value='4'>4</option>
          <option value='5'>5</option>
        </select>
        <input type='submit' name='enviarComentario' value='Enviar Comentario'>
      </form>
    </div>
  </div>";
  echo $error;
}
}
?>
    <div class="comentariosMain">
      <?php
        foreach ($arregloComentarios as $key) {
          echo "$key";
        }
       ?>
    </div>
    <footer>
      <p>Juan Cruz Gutierrez - Gonzalo</p>
    </footer>
  </body>
</html>
