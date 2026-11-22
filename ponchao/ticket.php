<?php
require_once 'conexiones/config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id_pedido   = intval($_POST['id_pedido']);
    $id_burro    = intval($_POST['id_burro']);
    $id_size     = intval($_POST['id_size']);
    $id_sucursal = intval($_POST['id_sucursal']);
    $cliente     = htmlspecialchars($_POST['cliente']);
    $direccion   = htmlspecialchars($_POST['direccion']);

    $bq = $conn->query("SELECT nombre, precio FROM burros WHERE id = $id_burro");
    $burro = $bq->fetch_assoc();

    $sq = $conn->query("SELECT tamaño, multiplicador FROM size WHERE id = $id_size");
    $size = $sq->fetch_assoc();

    $suq = $conn->query("SELECT sucursal, direccion FROM sucursal WHERE id = $id_sucursal");
    $suc = $suq->fetch_assoc();


    $total = $burro['precio'] * $size['multiplicador'];

    date_default_timezone_set('America/Mazatlan');
    $fecha = date("Y-m-d");
    $hora  = date("h:i A");
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket</title>

    <style>
       body {
         margin: 0;
         background: repeating-linear-gradient(
          to right,
         #fdd6c6 -14px,
         #fdd6c6 21px,
         #7c4b4b 20px,
         #7c4b4b 23px);
         margin: 0;
         background: repeating-linear-gradient(
          to right,
         #fdd6c6 -14px,
         #fdd6c6 21px,
         #7c4b4b 20px,
         #7c4b4b 23px);
        }

        .ticket {
            width: 330px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #00000060;
        }

        .ticket h2 {
            text-align: center;
            margin-bottom: 5px;
        }

        .logo {
            width: 120px;
            display: block;
            margin: auto;
        }

        .line {
            border-bottom: 1px dashed #000;
            margin: 10px 0;
        }

        .dato {
            font-size: 16px;
            margin: 4px 0;
        }

        .total {
            font-size: 20px;
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }

        .btn-print {
            background: #d45f24;
            padding: 10px;
            border: none;
            color: black;
            width: 100%;
            margin-top: 20px;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-print:hover {
            background: #ad4917;
        }
    </style>
</head>

<body>

    <div class="ticket">

        <img src="imagenes/logo.png" class="logo">

        <h2>Ticket de Pedido</h2>

        <div class="dato">Fecha de pedido: <strong><?= $fecha ?></strong></div>
        <div class="dato">Hora: <strong><?= $hora ?></strong></div>

        <div class="line"></div>

        <div class="dato"><strong>Pedido #<?= $id_pedido ?></strong></div>
        <div class="dato">Cliente: <?= $cliente ?></div>
        <div class="dato">Dirección: <?= $direccion ?></div>

        <div class="line"></div>

        <div class="dato">Burro: <strong><?= $burro['nombre'] ?></strong></div>
        <div class="dato">Tamaño: <strong><?= $size['tamaño'] ?></strong></div>
        <div class="dato">Precio base: $<?= $burro['precio'] ?></strong></div>

        <div class="line"></div>

        <div class="dato">Sucursal: <strong><?= $suc['sucursal'] ?></strong></div>
        <div class="dato">Dirección sucursal: <?= $suc['direccion'] ?></div>

        <div class="line"></div>

        <div class="total">TOTAL: $<?= number_format($total, 2) ?></div>

        <button class="btn-print" onclick="location.href='index.html'">Volver</button>

    </div>

</body>
</html>
