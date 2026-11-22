<?php
require_once 'conexiones/config.php';


$clientes = mysqli_query($conn, "SELECT id, nombre FROM cliente");
$sucs     = mysqli_query($conn, "SELECT id, sucursal FROM sucursal");


if($_SERVER['REQUEST_METHOD']=='POST'){
  $sug = mysqli_real_escape_string($conn,$_POST['sugerencia']);
  $id_cliente = intval($_POST['id_cliente']);
  $id_sucursal = intval($_POST['id_sucursal']);

  mysqli_query($conn,
    "INSERT INTO sugerencias (sugerencia,id_cliente,id_sucursal)
     VALUES ('$sug',$id_cliente,$id_sucursal)"
  );

  header('Location: index.html');
  exit;
}
?>
<!DOCTYPE html>
<html>
       <link rel="icon" href="imagenes/burro.png" type="image/x-icon" style="width:60px;">

<head>
   <meta charset="UTF-8">
   <title>Ponchao Sugerencias</title>

   <style> 
    @import url('https://fonts.googleapis.com/css2?family=Fira+Sans+Condensed&family=Fira+Sans:wght@100..900&display=swap');

    body {
        margin: 0;
        background: repeating-linear-gradient(
          to right,
         #fdd6c6 -14px,
         #fdd6c6 21px,
         #7c4b4b 20px,
         #7c4b4b 23px);
    }
    .inicio {
        background: rgba(0, 0, 0, 1);
        padding: 50px;
        border-radius: 0;
        text-align: center;
        color:white;
    }
    button {
        background: transparent;
        border: none;
        color: white;
        font-size: 22px;
        cursor: pointer;
        font-weight: bold;
        letter-spacing: 2px;
        margin-right:90px;  
    }
    .textito{
        background: #1f1d1d93; 
        color: white;
        padding: 60px 0;
        border-radius: 20px;
        width: 80%;       
        margin: 80px auto; 
    }
    p{
        font-family: "Fira Sans Condensed", sans-serif;
        font-size: 22px;
        text-align: justify;
        padding: 10px 20px;
    }
    .formu{
        background: #1f1d1d93;
        color: white;
        padding: 60px 0px;
        border-radius: 20px;
        width: 95%;
        margin: 10px auto;
    }
   </style>
</head>

<body>

<div class="inicio">
    <button onclick="location.href='index.html'" style="margin-left:250px;">Inicio</button>
    <button onclick="location.href='menu.php'">Menú</button>
    <button onclick="location.href='promociones.php'">Promociones</button>

    <img src="imagenes/burro.png" style="width:114px; float: right; margin-top:-95px; margin-right: 1184px;">
    <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-130px; margin-right: 993px;">
</div>

<div class="textito">
    <img src="imagenes/suge.png" style="width:460px; float:right; margin-top:-50px; margin-right: 350px">

    <p>
        Porque nos gusta leerte y mejorar siempre nuestro servicio. 
        Siéntete con toda confianza en escribir tus sugerencias o si 
        también lo deseas tus opiniones sobre Ponchao’ de hambre. 
        Con esto nos ayudas bastante así que siéntete con toda confianza.
    </p>

<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
  <div class="formu">

    <div style=" width:60%; margin-top:-50px; float:right; margin-right: 400px">
        <label style="font-size:22px; font-family:'Fira Sans Condensed';">Cliente:</label><br>
        <select name="id_cliente" required
            style="width:60%; padding:10px; border-radius:10px; font-size:18px; background-color: #fdd6c6cb;">
            <option value="">Identifícate</option>

            <?php while($c = mysqli_fetch_assoc($clientes)){ ?>
                <option value="<?= $c['id'] ?>">
                    <?= htmlspecialchars($c['nombre']) ?>
                </option>
            <?php } ?>

        </select>
    </div>

    <div style=" width:60%; margin-top:-71px; float:left; margin-left: 590px">
        <label style="font-size:22px; font-family:'Fira Sans Condensed';">Sucursal:</label><br>
        <select name="id_sucursal" required
            style="width:60%; padding:10px; border-radius:10px; font-size:18px; background-color: #fdd6c6cb;">
            
            <option value="">Selecciona una sucursal</option>

            <?php while($s = mysqli_fetch_assoc($sucs)){ ?>
                <option value="<?= $s['id'] ?>">
                    <?= htmlspecialchars($s['sucursal']) ?>
                </option>
            <?php } ?>

        </select>
    </div>

    <div style="width:88%; margin-top:10px; float:right; margin-right:75px">
        <label style="font-size:22px; font-family:'Fira Sans Condensed';">Tu sugerencia:</label><br>
        <textarea name="sugerencia" maxlength="1000" required
            placeholder="Escribe tu sugerencia aquí…"
            style="width:100%; height:120px; border-radius:10px; padding:10px; font-size:18px; background-color: #cb9d7c;"></textarea>
    </div>   

    <div style="margin-top:140px; text-align:center;">
        <button type="submit"
           style="background:black; padding:12px 25px; border-radius:10px; border:none; font-size:20px; font-weight:bold; cursor:pointer; width:30%;">
           Enviar sugerencia
        </button>
    </div>

  </div>
</form>

</div>
<h6 style= "color:rgb(73, 49, 27); text-align: center;">
Creado por: Carrillo Valeria, Salcido Sebastian, Tirado Cameron<br>
Para mas información, dudas, etc. Envíanos correo!!!<br>
mranttenna@gmail.com
</h6>
</body>
</html>
