<?php
  include_once('php/BD.php');
  include_once('php/auth.php');
  session_start();
  if(!isset($_SESSION["usuario"])){
   $strLogin= "<div id='login'>
           <form action='index.php' method='post'>
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
  $arreglo=[];
  $resultados_por_pagina=2; //Cantidad resultados por pagina
  if (!isset($_GET['button']) && empty($_GET['nombre']) && empty($_GET['anio']) && empty($_GET['genero'])) {
    $opc=1;
    $sql="SELECT * FROM peliculas ORDER by anio DESC";
    $result=mysqli_query($conn,$sql);
    $arreglo=[];
    $numero_resultados=mysqli_num_rows($result);
    $numero_paginas=ceil($numero_resultados/$resultados_por_pagina);
    if(!isset($_GET['pagina'])){
      $pagina=1;
    }
    else {
      $pagina=$_GET['pagina'];
    }
    $pagina_resultado=($pagina-1)*$resultados_por_pagina;
    $sql="SELECT * FROM peliculas ORDER BY anio DESC LIMIT ". $pagina_resultado . ',' .$resultados_por_pagina;
    $result=mysqli_query($conn,$sql);
    if($numero_resultados>0){
      while($row = mysqli_fetch_assoc($result)) {
        //$stripped = str_replace(' ', '_', $row['nombre']);
        $pelicula=$row['id'];
        $sqlPromedio="SELECT round(AVG(calificacion)) as promedio FROM comentarios WHERE peliculas_id='$pelicula'";
        $resultPromedio=mysqli_query($conn,$sqlPromedio);
        $rowPromedio=mysqli_fetch_assoc($resultPromedio);
        //<a href='detalle.php?idPelicula=".$row['id']."''"."'><img src=".$stripped.".".$row['tipoimagen']."></a>
        $stringPromedio="<div class='tres'>
                 <a href='detalle.php?idPelicula=".$row['id']."''"."'><img src=mostrarImagen.php?idPelicula=".$pelicula."></a>
                 <div class='infoPelis'>
                   <div class='titleAndYear'>
                     <a href="."'detalle.php?idPelicula=".$row['id']."'"."><h2>".$row['nombre']."</h2></a>
                     <h3>".$row['anio']."</h3>
                   </div>
                   <p>".$row['sinopsis']."</p>";
                   for ($i=0; $i <$rowPromedio['promedio'] ; $i++) {
                     $stringPromedio.=" <span class='fa fa-star checked'></span>";
                   }
                   $stringPromedio.=   "</div>
                    </div>";

               array_push($arreglo,$stringPromedio);
      }
    }
  }

  elseif(isset($_GET['button'])){
    $opc=2;
    $sql="SELECT * FROM peliculas";
    $ordenar=$_GET['ordenarPrimero'];
    $previo=false;
    if(!empty($_GET['nombre'])){
      $nombre=$_GET['nombre'];
      $sql.=" WHERE nombre LIKE '%$nombre%'";
      $previo=true;
    }
    else {
      $nombreVacio=true;
    }
    if(!empty($_GET['anio'])){
      $anio=$_GET['anio'];
      if($previo!=true){
        $sql.=" WHERE anio= '$anio'";
        $previo=true;
      }
      else {
        $sql.="AND anio='$anio'";
      }
    }
    if(!empty($_GET['genero'])){
      $genero=$_GET['genero'];
      if($previo!=true){
        $sql.=" WHERE generos_id= '$genero'";
        $previo=true;
      }
      else {
        $sql.="AND generos_id='$genero'";
      }
    }
    $result=mysqli_query($conn,$sql);
    $numero_resultados=mysqli_num_rows($result);
    $numero_paginas=ceil($numero_resultados/$resultados_por_pagina);
    if(!isset($_GET['paginaBusqueda'])){
      $paginaBusqueda=1;
    }
    else {
      $paginaBusqueda=$_GET['paginaBusqueda'];
    }
    $pagina_resultado=($paginaBusqueda-1)*$resultados_por_pagina;
    $sql.= ' ORDER BY '.$ordenar. ' ASC'. " LIMIT ". $pagina_resultado . ',' .$resultados_por_pagina;
    $result=mysqli_query($conn,$sql);
    if(mysqli_num_rows($result)>0){
      while($row = mysqli_fetch_assoc($result)) {
        $pelicula=$row['id'];
        $sqlPromedio="SELECT round(AVG(calificacion)) as promedio FROM comentarios WHERE peliculas_id='$pelicula'";
        $resultPromedio=mysqli_query($conn,$sqlPromedio);
        $rowPromedio=mysqli_fetch_assoc($resultPromedio);
        //<a href='detalle.php?idPelicula=".$row['id']."''"."'><img src=".$stripped.".".$row['tipoimagen']."></a>
        $stringPromedio="<div class='tres'>
                 <a href='detalle.php?idPelicula=".$row['id']."''"."'><img src=mostrarImagen.php?idPelicula=".$pelicula."></a>
                 <div class='infoPelis'>
                   <div class='titleAndYear'>
                     <a href="."'detalle.php?idPelicula=".$row['id']."'"."><h2>".$row['nombre']."</h2></a>
                     <h3>".$row['anio']."</h3>
                   </div>
                   <p>".$row['sinopsis']."</p>";
                   for ($i=0; $i <$rowPromedio['promedio'] ; $i++) {
                     $stringPromedio.=" <span class='fa fa-star checked'></span>";
                   }
                   $stringPromedio.=   "</div>
                    </div>";

               array_push($arreglo,$stringPromedio);
      }
    }
}

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="css/estilosv2.css">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
  </head>
  <title>ManaosReviews</title>
	<body>

		<header>
      <div id="nombre">
        <a href="index.php"><img src="logo.png" alt=""></a>
      </div>

      <div id="login">
        <?php
          if(!isset($_SESSION['usuario'])){
            echo $strLogin;
            echo "<a href='registro.php'><button> Resgitrarme! </button></a>";
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

    <div class="filtro">
      <form class="" action="index.php" method="get">

      <h2>Peliculas</h2>
      <div class="ordenarPor">
        <select id="ordenar" name="ordenarPrimero">
          <option value="anio">Estreno</option>
          <option value="nombre">Alfabeticamente</option>
        </select>
      </div>
      <div id="searchbox">
          <input type="text" placeholder="Nombre" name="nombre" value="">
      </div>
      <div id=buscarPorAnio>
            <input type="text" placeholder="Año" name="anio" value="">
      </div>
      <div class="ordenarPor">
        <select id="genero" name="genero">
          <option value="">-</option>
          <option value="2">Accion</option>
          <option value="3">Aventura</option>
          <option value="4">Terror</option>
          <option value="5">Drama</option>
        </select>
      </div>
      <br>
      <br>
      <input type="submit" name="button"><i class="fa fa-search"></i></button>
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
          if($opc==1){
            for ($pagina=1; $pagina<=$numero_paginas; $pagina++) {
              echo '<a href="index.php?pagina='.$pagina.'">'.$pagina.'</a>';
            }
          }
          elseif($opc==2) {
              for ($paginaBusqueda=1; $paginaBusqueda<=$numero_paginas; $paginaBusqueda++){
              echo '<a href="index.php?ordenarPrimero='.$_GET['ordenarPrimero'].'&'.'genero='.$_GET['genero'].'&'.'nombre='.$_GET['nombre'].'&'.'anio='.$_GET['anio'].'&'.'paginaBusqueda='.$paginaBusqueda.'&button=Enviar+Consulta'.'">'.$paginaBusqueda.'</a>';
            }
          }
         ?>
      </div>
    </div>
		<footer>
      <p>Juan Cruz Gutierrez - Gonzalo</p>
    </footer>
	</body>
</html>
