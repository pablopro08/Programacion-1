<?php
require_once 'conexiones/config.php';
function getTabla($conn, $tabla) {

    switch ($tabla) {

        case "pedidos":
            return mysqli_query($conn, "
                SELECT 
                    pedidos.id,
                    burros.nombre AS burro,
                    size.tamaño AS size,
                    sucursal.sucursal AS sucursal,
                    cliente.nombre AS cliente
                FROM pedidos
                JOIN burros   ON pedidos.id_burro = burros.id
                JOIN size     ON pedidos.id_size = size.id
                JOIN sucursal ON pedidos.id_sucursal = sucursal.id
                JOIN cliente  ON pedidos.id_cliente = cliente.id
            ");

        case "sugerencias":
            return mysqli_query($conn, "
                SELECT 
                    sugerencias.id,
                    sugerencias.sugerencia,
                    cliente.nombre  AS cliente,
                    sucursal.sucursal AS sucursal
                FROM sugerencias
                JOIN cliente  ON sugerencias.id_cliente  = cliente.id
                JOIN sucursal ON sugerencias.id_sucursal = sucursal.id
            ");

        default:
            return mysqli_query($conn, "SELECT * FROM $tabla");
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PONCHAOS MANAGMENT SYSTEM</title>
    <style>
        body {
            margin: 0;
            background: repeating-linear-gradient(
                to right,
                #fdd6c6 -14px,
                #fdd6c6 21px,
                #7c4b4b 20px,
                #7c4b4b 23px
            );
            font-family: "Fira Sans Condensed", sans-serif;
        }

        h1 {
            text-align: center;
            color: white;
            background: rgba(0, 0, 0, 0.80);
            padding: 20px;
            letter-spacing: 3px;
        }

        h2 {
            font-family: "Fira Sans Condensed", sans-serif;
            color: white;
            text-align: center;
            letter-spacing: 2px;
            margin-top: 60px;
            background: rgba(0,0,0,0.65);
            width: 60%;
            padding: 12px;
            border-radius: 12px;
            margin-left: auto;
            margin-right: auto;
        }

        /* TABLAS ESTILO SCOREBOARD */
        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            font-family: "Fira Sans Condensed", sans-serif;
            background: rgba(0, 0, 0, 0.60);
            border-radius: 12px;
            overflow: hidden;
            backdrop-filter: blur(4px);
            color: white;
        }

        table th {
            background: #64280cff;
            color: #fff;
            padding: 15px 10px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 18px;
            border-bottom: 3px solid #fdd6c6;
        }

        table tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.05);
        }

        table tr:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        table td {
            padding: 14px 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.15);
            font-size: 17px;
        }

        table button {
            background: #d45f24ea;
            border: none;
            padding: 8px 12px;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            margin: 2px;
            transition: 0.2s ease;
        }

        table button:hover {
            background: #C44A0C;
            transform: scale(1.05);
        }

        .volver {
            margin-left: 30px;
            margin-top: 20px;
            padding: 10px 20px;
            background: #d45f24ea;
            border: none;
            color: white;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }
        .volver:hover {
            background: #C44A0C;
        }
    </style>
</head>
            <link rel="icon" href="imagenes/plano.png" type="image/x-icon" style="width:60px;">

<body>

<h1>.:: welcome to P.M.S. ::.</h1>

<button class="volver" onclick="location.href='adminpane.html'">Volver</button>
       <img src="imagenes/plano.png" style="width:114px; float: right; margin-top:-130px; margin-right: 1184px;">
       <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-160px; margin-right: 993px; ">
<br><br><br>

<?php

$tablas = [
    "burros",
    "cliente",
    "pedidos",
    "size",
    "sucursal",
    "sugerencias"
];

foreach ($tablas as $tabla) {

    $result = getTabla($conn, $tabla);

    echo "<h2>Tabla: $tabla</h2>";

    echo "<table><tr>";

    /* TITULOS DE COLUMNAS */
    $fields = mysqli_fetch_fields($result);
    foreach ($fields as $f) {
        echo "<th>{$f->name}</th>";
    }
    echo "<th>Acciones</th>";
    echo "</tr>";

    /* FILAS */
    mysqli_data_seek($result, 0);

    while ($row = mysqli_fetch_assoc($result)) {

        echo "<tr>";

        foreach ($row as $col) {
            echo "<td>" . htmlspecialchars($col) . "</td>";
        }

        echo "<td>
                <button onclick=\"location.href='delete.php?tabla=$tabla&id=" . $row['id'] . "'\">Eliminar</button>
                <button onclick=\"location.href='update.php?tabla=$tabla&id=" . $row['id'] . "'\">Editar</button>
              </td>";

        echo "</tr>";
    }

    echo "</table><br>";
}

?>

</body>
<h6 style= "color:rgb(73, 49, 27); text-align: center;">
PONCHAOS MANAGMENT SYSTEM©.
Todos Los Derechos Reservados.
</h6>
</html>
