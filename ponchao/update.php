<?php
require_once 'conexiones/config.php';

if(!isset($_GET['tabla']) || !isset($_GET['id'])){
    die("Faltan parámetros.");
}

$tabla = $_GET['tabla'];
$id = intval($_GET['id']);

$pk = "id";

$sql = "SELECT * FROM $tabla WHERE $pk = $id";
$res = mysqli_query($conn, $sql);
$data = mysqli_fetch_assoc($res);

if(!$data){
    die("Registro no encontrado.");
}

if($_SERVER["REQUEST_METHOD"]=="POST"){
    $updates = [];
    foreach($data as $col => $val){
        if($col == $pk) continue;
        $nuevo = mysqli_real_escape_string($conn, $_POST[$col]);
        $updates[] = "$col='$nuevo'";
    }

    $set = implode(",", $updates);

    mysqli_query($conn, "UPDATE $tabla SET $set WHERE $pk=$id");

    header("Location: tables.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
<title>Edicion de Registro</title>
</head>
            <link rel="icon" href="imagenes/plano.png" type="image/x-icon" style="width:60px;">

<body>
<style>
       body {
         margin: 0;
         background: repeating-linear-gradient(
          to right,
         #fdd6c6 -14px,
         #fdd6c6 21px,
         #7c4b4b 20px,
         #7c4b4b 23px);
        }
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
    text-align:center;
    width: 700px;
    background: #3c2618e0;
    padding:15px;
    margin: 10px auto;
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
        margin-top: 20px;
        margin-left: 270px;
    width: 300px;
    padding: 12px;
    border-radius: 10px;
    border: none;
    font-size: 18px;
    font-weight: bold;
    background: #ff944d;
    color: #3a1f12;
    cursor: pointer;
    transition: 0.2s;
}
head{
text-align:center;    
}
</style>
<h2 id = "head">Editando tabla: <?= htmlspecialchars($tabla) ?></h2>

<div class="form-container">

<form method="POST" style="width:70%; margin:auto;">

<?php foreach($data as $col => $val): ?>
    <?php if($col == $pk) continue; ?>

    <div id="textbox" style="margin-bottom:40px;">

        <label style="color:#ffdfc9; font-size:20px; font-weight:bold;">
            <?= htmlspecialchars($col) ?>
        </label>

        <?php if(strlen($val) > 120): ?>

            <textarea 
                name="<?= $col ?>" 
                style="
                    width:90%;
                    height:120px;
                    margin-top:12px;
                    padding:12px;
                    border-radius:10px;
                    border:none;
                    background:#fff4ec;
                    font-size:16px;
                    resize:none;
                "
            ><?= htmlspecialchars($val) ?></textarea>

        <?php else: ?>

            <input 
                type="text"
                name="<?= $col ?>" 
                value="<?= htmlspecialchars($val) ?>"
                style="
                    display:block;
                    width:90%;
                    margin-top:12px;
                    padding:12px;
                    border-radius:10px;
                    border:none;
                    background:#fff4ec;
                    font-size:16px;
                "
            >

        <?php endif; ?>

    </div>

<?php endforeach; ?>

    <button type="submit" id="confirm">
        Guardar cambios
    </button>

</form>

</div>


</body>
<h6 style= "color:rgb(73, 49, 27); text-align: center;">
PONCHAOS MANAGMENT SYSTEM©.
Todos Los Derechos Reservados.
</h6>
</html>
