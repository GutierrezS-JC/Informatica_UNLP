<?php
include_once('php/BD.php');
$resultados_por_pagina=2;
$sql="SELECT * FROM peliculas LIMIT 0,2";
$result=mysqli_query($conn,$sql);
$numero_resultados=mysqli_num_rows($result);
while($row=mysqli_fetch_array($result)){
  echo $row['nombre'];
  echo "<br>";
}
$numero_paginas= ceil($numero_resultados/$resultados_por_pagina);
if(!isset($_GET['pagina'])){
  $pagina=1;
}
else {
  $pagina=$_GET['pagina'];
}

 ?>
