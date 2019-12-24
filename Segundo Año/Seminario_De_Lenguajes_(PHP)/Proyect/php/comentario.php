<?php
  include_once('BD.php');
  $error="";
  $destacado=false;
  $idPelicula=$_GET['idPelicula'];
  if(isset($_SESSION['usuario'])){
  $nombreUsuario=$_SESSION['usuario'];
  $sqlUsuario="SELECT * FROM usuarios where nombreusuario='$nombreUsuario'";
  $datosUsuario= mysqli_query($conn,$sqlUsuario);
  $rowUsuario=mysqli_fetch_assoc($datosUsuario);
  $idUsuario=$rowUsuario['id'];

  $sqlComentarios="SELECT * FROM comentarios where usuarios_id='$idUsuario' AND peliculas_id=$idPelicula";
  $datosComentarios=mysqli_query($conn,$sqlComentarios);
  if(mysqli_num_rows($datosComentarios)>0){
    $yaComento=true;
  }
  else {
    $yaComento=false;
  if(isset($_POST['enviarComentario'])){
    if(!empty($_POST['comentario'])){
      $fecha= date('Y-m-d');
      $puntuacion=$_POST['puntuacion'];
      //$nombreUsuario=$_SESSION['usuario'];
      $comentario=$_POST['comentario'];
    /*  $sqlUsuario="SELECT * FROM usuarios where nombreusuario=$nombreUsuario";
      $datosUsuario= mysqli_query($conn,$sqlUsuario);
      $rowUsuario=mysqli_fetch_assoc($datosUsuario);
      $idUsuario=$rowUsuario['id'];*/
      $nombrePelicula=$row['nombre'];
      $sqlPeliculas="SELECT * FROM peliculas where nombre='$nombrePelicula'";
      $datosPeliculas=mysqli_query($conn,$sqlPeliculas);
      $rowPeliculas=mysqli_fetch_assoc($datosPeliculas);
      $idPelicula=$rowPeliculas['id'];

      //ACTIVIDAD COLOQUIO
      $usuario_Destacado="SELECT usuarios_id, COUNT(*) as cant FROM comentarios GROUP BY usuarios_id HAVING COUNT(*) >= 3";

          //  $sqlPeliculas="UPDATE `usuarios` SET `destacado` = '1' WHERE `usuarios`.`id` = $idUsuario";
      $datosDestacado=mysqli_query($conn,$usuario_Destacado);
      //$rowDestacado=mysqli_fetch_assoc($datosDestacado);
      while($rowDestacado = mysqli_fetch_assoc($datosDestacado)){
        $id=$rowDestacado["usuarios_id"];
        if($id==$idUsuario){
          if($rowDestacado["cant"]>=3){
            $destacado=true;
          }
        }
      }
      if($destacado==true){
        $sql="INSERT INTO comentarios (id,comentario,fecha,peliculas_id,usuarios_id,calificacion) values (null,'$comentario','$fecha',$idPelicula,$idUsuario,$puntuacion)";
        $sqlInsertarPeliculas=mysqli_query($conn,$sql);
        //$sqlInsertarDestacado="INSERT INTO usuarios(destacado) VALUES(1) WHERE id='$idUsuario'";
        $sqlInsertarDestacado="UPDATE usuarios SET destacado = 1 WHERE usuarios.id = '$idUsuario'";
        $sqlInsertarDestacado=mysqli_query($conn,$sqlInsertarDestacado);
        header('Location: detalle.php?idPelicula='.$_GET['idPelicula']);
      }
      else{
      if($destacado==false){
        $sql="INSERT INTO comentarios (id,comentario,fecha,peliculas_id,usuarios_id,calificacion) values (null,'$comentario','$fecha',$idPelicula,$idUsuario,$puntuacion)";
        $sqlInsertarPeliculas=mysqli_query($conn,$sql);
        header('Location: detalle.php?idPelicula='.$_GET['idPelicula']);
      }
    }
    }
    else {
      $error="El comentario no puede estar vacio";
    }
  }
}

}


 ?>
