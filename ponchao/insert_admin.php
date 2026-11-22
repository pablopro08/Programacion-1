<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="estilos.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insertar Admin</title>
              <link rel="icon" href="imagenes/plano.png" type="image/x-icon" style="width:60px;">

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
        .btn-submit{
            
            width: 12%;
            padding: 12px;
            background: #d45f24ea;
            border: none;
            color: black;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-submit:hover{
            background: #ad4917ff;
        }
        #textbox{
    width: 200px;
    background: #3c2618e0;
    padding:15px;
    margin: 120px auto;
    border-radius: 20px;
    box-shadow: 0 0 12px #00000070;
    text-align: center;
}


#textbox h2{
    color: #ffdfc9;
    margin-bottom: 25px;
 
}


#textbox input{
    display: block;
    width: 80%;
    margin: 12px auto;
    padding: 12px;
    border-radius: 10px;
    border: none;
    background: #fff4ec;
    font-size: 16px;
}


#textbox button{
    margin-top: 18px;
    width: 85%;
    padding: 12px;
    border-radius: 10px;
    border: none;
    font-size: 18px;
    font-weight: bold;
    background: #ff944d;
    color: #3a1f12;
    cursor: pointer;
    transition: 0.2s;
   margin: 12px auto;
}

#textbox button:hover{
    background: #ffb07a;
    transform: scale(1.05);
}

.error{
    color: #ff8b7a;
    margin-bottom: 10px;
    font-weight: bold;

}
#confirm{
        margin-top: 18px;
    width: 100px;
    padding: 12px;
    border-radius: 10px;
    border: none;
    font-size: 18px;
    font-weight: bold;
    background: #ff944d;
    color: #3a1f12;
    cursor: pointer;
    transition: 0.2s;
   margin: 20px auto;
}
  </style>
</head>
<body>
<div class="inicio">
    <button onclick="location.href='index.html'" style="margin-left:250px;">Inicio</button>
       <button onclick="location.href='adminpane.html'">Regresar</button>
    <button onclick="location.href='menu.php'">Menú</button>
    <button onclick="location.href='promociones.php'">Promociones</button>

   <img src="imagenes/plano.png" style="width:114px; float: right; margin-top:-95px; margin-right: 1184px;">
    <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-130px; margin-right: 993px;">
</div>
<body>
    <button onclick="location.href='adminpane.html'" id = "confirm">Volver</button>

  <div class="form-container">
   <img src="imagenes/admin.png" style="padding:10px; width:169px; float: right; margin-top:-56px; margin-right: 474px">
    
   <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
         <br>
   <label for="campo1">Usuario:</label>
      <input type="text" id="textbox" name="us" required>

      <label for="campo2">Contraseña:</label>
      <input type="text" id="textbox" name="pw" required>

      <button type="submit" class="btn-submit">Enviar</button>

    </form>
    <br><br>



  <br>
  </div>
  
</head>


  
</body>
<h6 style= "color:rgb(73, 49, 27); text-align: center;">
PONCHAOS MANAGMENT SYSTEM©.
Todos Los Derechos Reservados.
</h6>
</html>
<?php
require_once 'conexiones/config.php';
if($_SERVER['REQUEST_METHOD']=='POST'){
  $nombre = mysqli_real_escape_string($conn,$_POST['us']);
  $pass = mysqli_real_escape_string($conn,$_POST['pw']);
  mysqli_query($conn,"INSERT INTO admin (nombre,contraseña) VALUES ('$nombre','$pass')");
}
?>
