<?php
  include_once('BD.php');
  $arreglo = array();
  $sql = "SELECT * FROM peliculas ";
  $result= mysqli_query($conn, $sql);
  $cant_peliculas = mysqli_num_rows($result);
  $cant_paginas = ceil($cant_peliculas/2);
  if(isset($_GET['pagina'])){
      if ($_GET['pagina'] == 1){
        header("Location: index.php");
      }
      else{
        $pagina_act= $_GET['pagina'];}
  }
  else {
    $pagina_act = 1;
  }
  $desde = ($pagina_act - 1)* 10;
  if(isset($_POST['button'])){
    $sql2 = "SELECT * FROM peliculas WHERE ";
    $ordenar=$_POST['ordenar'];
    $previo=false;
    if(!empty($_POST['nombre'])){
      $nombre=$_POST['nombre'];
      $sql2.="nombre LIKE '%$nombre%' ";
      $previo=true;
      }
    if(!empty($_POST['anio'])){
      $anio=$_POST['anio'];
      if($previo!=true){
        $sql2.="anio= '$anio'";
        $previo=true;
      }
      else {
        $sql2.=" AND anio='$anio'";
      }
    }
    if(!empty($_POST['genero'])){
      $genero=$_POST['genero'];
      if($previo!=true){
        $sql2.="generos_id = '$genero'";
        $previo=true;
      }
      else {
        $sql2.=" AND generos_id= '$genero'";
      }
    }
    $result=mysqli_query($conn,$sql2);

  }
  elseif(!isset($_POST['button']) || (empty($_POST['nombre']) && empty($_POST['anio']) && empty($_POST['genero']))) {
    $sql.="LIMIT $desde, 10 ";
    $result=mysqli_query($conn,$sql);
  }
  while($row = mysqli_fetch_assoc($result)) {
    array_push($arreglo," <div class='tres'>
               <a href='#'></a>
               <div class='infoPelis'>
                 <div class='titleAndYear'>
                   <a href='#'><h2>".$row['nombre']."</h2></a>
                   <h3>".$row['anio']."</h3>
                 </div>
                 <p>".$row['sinopsis']."</p>
                 <span class='fa fa-star checked'></span>
                 <span class='fa fa-star checked'></span>
                 <span class='fa fa-star checked'></span>
                 <span class='fa fa-star'></span>
                 <span class='fa fa-star'></span>
               </div>
             </div>");
    }

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="../css/estilosv2.css">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
  </head>
  <title>ManaosReviews</title>
	<body>

		<header>
      <div id="nombre">
        <a href="#"><img src="logo.png" alt=""></a>
      </div>

      <div id="login">
        <form action="" method="post">
          <input type="text" placeholder="Usuario" name="username">
          <input type="text" placeholder="Password" name="psw">
          <button type="submit">Login</button>
        </form>
      </div>

    </header>

    <div class="filtro">
      <form class="" action="index.php" method="post">

      <h2>Peliculas</h2>
      <div class="ordenarPor">
        <select id="ordenar" name="ordenar">
          <option value="Estreno">Estreno</option>
          <option value="Alfabeticamente">Alfabeticamente</option>
        </select>
      </div>
      <div id="searchbox">
          <input type="text" placeholder="Nombre" name="nombre" value="">
      </div>
      <div id=buscarPorAnio>
            <input type="text" placeholder="Año" name="anio" value="">
      </div>
      <div id=buscarPorGenero>
            <input type="text" placeholder="Genero" name="genero" value="">
      </div>
      <br>
      <br>
      <button type="submit" name="button"><i class="fa fa-search"></i></button>
    </form>
    </div>

		<div id="main">

      <?php
        foreach ($arreglo as $key) {
          echo "$key";
        }
       ?>
    </div>
    <div class="page-change">
      <div class="SeleccionPagina">
        <?php
          for ($i = 1; $i <= $cant_paginas; $i++){
            echo("<a href= '?pagina=". $i . "'>". $i . "</a> ");
          }
        ?>
      </div>
    </div>
		<footer>
      <p>Juan Cruz Gutierrez - Gonzalo</p>
    </footer>
	</body>
</html>
