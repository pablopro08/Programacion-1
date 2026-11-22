<?php
require_once 'conexiones/config.php';

if(!isset($_GET['tabla']) || !isset($_GET['id'])){
    die("Faltan parámetros.");
}

$tabla = $_GET['tabla'];
$id = intval($_GET['id']);

$pk = "id";

if ($tabla == "burros"){
mysqli_query($conn, "DELETE FROM pedidos WHERE id_burro = $id");
}
mysqli_query($conn, "DELETE FROM $tabla WHERE $pk = $id");

header("Location: tables.php");
exit;
?>
