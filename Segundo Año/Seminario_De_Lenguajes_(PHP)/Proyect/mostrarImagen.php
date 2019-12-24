<?php
  $id = $_GET['idPelicula'];
  include_once('php/BD.php');

    // se recupera la información de la imagen
    $sql = "SELECT contenidoimagen, tipoimagen FROM peliculas WHERE id=$id";

    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    mysqli_close($conn);
    // se imprime la imagen y se le avisa al navegador que lo que se está
    // enviando no es texto, sino que es una imagen de un tipo en particular
    header("Content-type: " . $row['tipoimagen']);
	   echo $row['contenidoimagen'];
?>
