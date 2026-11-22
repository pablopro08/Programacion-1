<?php
require_once 'conexiones/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['id_burro']) && !isset($_POST['id_size'])) {

    $id_burro = intval($_POST['id_burro']);

    $burro = $conn->query("SELECT nombre, precio FROM burros WHERE id = $id_burro")->fetch_assoc();

    $sizes  = $conn->query("SELECT id, tamaño FROM size");
    $sucs   = $conn->query("SELECT id, sucursal FROM sucursal");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ponchao Pedido</title>
</head>
            <link rel="icon" href="imagenes/plano.png" type="image/x-icon" style="width:60px;">

<body>
<style> 
      @import url('https://fonts.googleapis.com/css2?family=Fira+Sans+Condensed&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
 body {
         margin: 0;
         background: repeating-linear-gradient(
          to right,
         #fdd6c6 -14px,
         #fdd6c6 21px,
         #7c4b4b 20px,
         #7c4b4b 23px);
        } div {
            background: rgba(0, 0, 0, 1);
            padding: 50px;
            border-radius: 0px;
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
        .menu1 {
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

    
    section {
    display: flex;
    width: 530px;
    height: 255px;
  
    }
    section img{
    width: 0px;
    flex-grow:1;
    object-fit: cover;96 
    opacity: .7;
    transition: 2s ease;

    }
    section img:hover{
    cursor: crosshair;
    width: 300px;
    opacity: 1;
    filter: contrast(120%);
    }
    .secmenu{
     background: rgba(255, 255, 255, 0.88);
    background-color: #fff1e9af; 
    color: white;
    border: none;
    padding: 17px 20px;
    border-radius: 20px;
    margin-top: 0rem;
    width: 48%;       
     margin-left: auto;
     margin-right: 450px;  
     }
     h2{
         font-family: "Fira Sans Condensed", sans-serif;
    color: white;
     }
     p{
    color: white;    
    font-family: "Fira Sans Condensed", sans-serif;
        font-size: 22px;
        text-align: justify;
     }
     <style>
  .form-container {
    background: rgba(0, 0, 0, 0.884);
    background-color: #1f1d1d93; 
    color: white;
    border: none;
    padding: 30px 0px;
    border-radius: 10px;
    margin-top: -1rem;
    width: 60%;       
    margin: 10px;
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
    width: 100px;
    background: #3c2618e0;
    padding: 10px;
    margin: 10px auto;
    border-radius: 15px;
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
   margin: 12px auto
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
   margin: 20px auto;
}
#pedido{
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
    <div id = "form">
               <img src="imagenes/burro.png" style="width:114px; float: right; margin-top:-80px; margin-right: 650px;">
               <br><br><br> 
       <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-10px; margin-right: 600px; ">
<h2 id = "warn">Estás pidiendo: <?= $burro['nombre'] ?></h2>
<h2 id = "warn">Precio base: $<?= $burro['precio'] ?></h2>
</div>
<div id = "pedido">
<form action="insert_pedido.php" method="POST">

    <input type="hidden" name="id_burro" value="<?= $id_burro ?>">
    <label>Nombre del cliente</label>
    <input type="text" name="name_cliente" id= "textbox" required>

    <label>Dirección</label>
    <input type="text" name="direccion" id= "textbox" required>
    <br><br>

        <label>Tamaño</label>
    <select name="id_size" required>
        <?php while($s = mysqli_fetch_assoc($sizes)){ ?>
            <option value="<?= $s['id'] ?>"><?= $s['tamaño'] ?></option>
        <?php } ?>
    </select>

    <label>Sucursal</label>
    <select name="id_sucursal" required>
        <?php while($su = mysqli_fetch_assoc($sucs)){ ?>
            <option value="<?= $su['id'] ?>"><?= $su['sucursal'] ?></option>
        <?php } ?>
    </select>
<br><br>
    <button type="submit" id = "confirm">Confirmar pedido</button>

</form>
    <button onclick="location.href='menu.php'"id = "confirm">Cancelar</button>
</div>
</body>
</html>

<?php
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $id_burro    = intval($_POST['id_burro']);
    $id_size     = intval($_POST['id_size']);
    $id_sucursal = intval($_POST['id_sucursal']);
    $cliente     = mysqli_real_escape_string($conn, $_POST['name_cliente']);
    $direccion   = mysqli_real_escape_string($conn, $_POST['direccion']);

    $sqlCliente = "INSERT INTO cliente (nombre, direccion)
                   VALUES ('$cliente', '$direccion')";
    mysqli_query($conn, $sqlCliente);
    $id_cliente = mysqli_insert_id($conn);

    $sqlPedido = "INSERT INTO pedidos (id_burro, id_size, id_sucursal, id_cliente)
                  VALUES ($id_burro, $id_size, $id_sucursal, $id_cliente)";

if (mysqli_query($conn, $sqlPedido)) {

    $id_pedido = mysqli_insert_id($conn);

    echo '
    <form id="redir" action="ticket.php" method="POST">
        <input type="hidden" name="id_pedido" value="'.$id_pedido.'">
        <input type="hidden" name="id_burro" value="'.$id_burro.'">
        <input type="hidden" name="id_size" value="'.$id_size.'">
        <input type="hidden" name="id_sucursal" value="'.$id_sucursal.'">
        <input type="hidden" name="cliente" value="'.$cliente.'">
        <input type="hidden" name="direccion" value="'.$direccion.'">
    </form>

    <script>
    document.getElementById("redir").submit();
    </script>';
    exit;

} else {
    echo "Error: " . mysqli_error($conn);
}
}

?>