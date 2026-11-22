<?php
require_once 'conexiones/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $user = mysqli_real_escape_string($conn, $_POST["admin"]);
    $pw = mysqli_real_escape_string($conn, $_POST["pw"]);

    $sql = "SELECT * FROM `admin` WHERE nombre = '$user' LIMIT 1";
    $res = mysqli_query($conn, $sql);

    if (!$res) {
        die("Error en consulta: " . mysqli_error($conn));
    }

    if (mysqli_num_rows($res) == 1) {
        $row = mysqli_fetch_assoc($res);

        if (trim($row["contraseña"]) == trim($pw)) {
            header("Location: ../ponchao/adminpane.html");
            exit();
        } else {
            $error = "Contraseña incorrecta.";
        }
    } else {
        $error = "El usuario no existe.";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
            <link rel="icon" href="imagenes/plano.png" type="image/x-icon" style="width:60px;">

<title>..::: P.M.S. LOGIN :::..</title>
<link rel="stylesheet" href="estilos.css">
<style>




.login-box{
    width: 420px;
    background: #3c2618e0;
    padding: 40px;
    margin: 120px auto;
    border-radius: 20px;
    box-shadow: 0 0 12px #00000070;
    text-align: center;
}


.login-box h2{
    color: #ffdfc9;
    margin-bottom: 25px;
 
}


.login-box input{
    display: block;
    width: 80%;
    margin: 12px auto;
    padding: 12px;
    border-radius: 10px;
    border: none;
    background: #fff4ec;
    font-size: 16px;
}


.login-box button{
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

.login-box button:hover{
    background: #ffb07a;
    transform: scale(1.05);
}

.error{
    color: #ff8b7a;
    margin-bottom: 10px;
    font-weight: bold;

}




</style>
</head>

<body>

<div>
        <button onclick="location.href='index.html'"  style="margin-left:250px;color:white;">Regresar</button>

        <button onclick="location.href='menu.php'" >Menú</button>
         <button onclick="location.href='promociones.php'" >Promociones</button>
          <button onclick="location.href='sugerencias.php'" >Sugerencias</button>
       <img src="imagenes/plano.png" style="width:114px; float: right; margin-top:-85px; margin-right: 1230px;">
       <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-110px; margin-right: 1040px; ">
 
    </div>


<div class="login-box">
    <h2>ADMIN LOGIN</h2>

    <?php if(!empty($error)){ ?>
        <div class="error"><?= $error ?></div>
    <?php } ?>

    <form method="POST">
        <input type="text" name="admin" placeholder="Usuario" required>
        <input type="password" name="pw" placeholder="Contraseña" required>
        <button type="submit">Entrar</button>
    </form>
</div>

</body>
</html>
