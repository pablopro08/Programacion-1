<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario</title>
</head>
  <link rel="stylesheet" href="estilos.css">
<style>
  .form-container {
    background: rgba(0, 0, 0, 0.884);
    background-color: #1f1d1d93; 
    color: white;
    border: none;
    padding: 50px 0px;
    border-radius: 20px;
    margin-top: -1rem;
    width: 80%;       
    margin: 80px auto;
        } 
  </style>
</head>
<body>
<div class="inicio">
    <button onclick="location.href='index.html'" style="margin-left:250px;">Inicio</button>
       <button onclick="location.href='adminpane.html'">Regresar</button>
    <button onclick="location.href='menu.php'">Menú</button>
    <button onclick="location.href='promociones.php'">Promociones</button>

    <img src="imagenes/burro.png" style="width:114px; float: right; margin-top:-95px; margin-right: 1184px;">
    <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-130px; margin-right: 993px;">
</div>
</head>
<body>

  <div class="form-container">
    <h2>Formulario</h2>
    <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
  <label>Burro</label>
  <select name="id_burro">
    <?php while($b=mysqli_fetch_assoc($burros)){ ?>
      <option value="<?= $b['id'] ?>"><?= htmlspecialchars($b['nombre']) ?></option>
    <?php } ?>
  </select><br>

  <label>Tamaño</label>
  <select name="id_tamano">
    <?php while($s=mysqli_fetch_assoc($sizes)){ ?>
      <option value="<?= $s['id'] ?>"><?= htmlspecialchars($s['tamaño']) ?></option>
    <?php } ?>
  </select><br>

  <label>Días</label><input type="text" name="dias"><br>
  <button class="btn-verde">Guardar Promo</button>
    </form>
    <br><br><br>
  </div>
  
</head>


  
</body>
</html>

<?php
require_once 'includes/config.php';
if($_SERVER['REQUEST_METHOD']=='POST'){
  $id_burro = intval($_POST['id_burro']);
  $id_tamano = intval($_POST['id_tamano']);
  $dias = mysqli_real_escape_string($conn,$_POST['dias']);
  mysqli_query($conn,"INSERT INTO promos (id_burro,id_tamano,dias) VALUES ($id_burro,$id_tamano,'$dias')");
}
