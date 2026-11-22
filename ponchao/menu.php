<?php
require_once 'conexiones/config.php';

if (isset($_GET['info'])) {
    $id = intval($_GET['info']);
    $q = $conn->query("SELECT nombre, ingredientes, precio FROM burros WHERE id=$id");

    if ($q->num_rows > 0) {
        echo json_encode($q->fetch_assoc());
    } else {
        echo json_encode(["error" => "No encontrado"]);
    }
    exit; // importante: detiene la carga del HTML
}
?>



<!DOCTYPE html>
<html>
        <link rel="icon" href="imagenes/burro.png" type="image/x-icon" style="width:60px;">

<head>
   <meta charset="UTF-8">
   <title>Ponchao Menú</title>
</head>
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
    </style>
<script>
function cargarPlatillo(id) {
    fetch("menu.php?info=" + id)
        .then(response => response.json())
        .then(data => {

            if (data.error) {
                console.log("Error:", data.error);
                return;
            }

            let cont = document.getElementById("info-platillo");
            cont.style.display = "block";

            cont.innerHTML = `
                <h2>${data.nombre}</h2>
                <p><strong>Ingredientes:</strong> ${data.ingredientes}</p>
                <p><strong>Precio:</strong> $${data.precio}</p>

                <form action="insert_pedido.php" method="POST">
                    <input type="hidden" name="id_burro" value="${id}">
                    <button type="submit" style="
                        background:#d45f24;
                        color:black;
                        padding:10px 15px;
                        border-radius:10px;
                        border:none;
                        cursor:pointer;
                        font-weight:bold;">
                        Pedir este burro
                    </button>
                </form>
            `;
        })
        .catch(err => console.log("Fetch error:", err));
}


</script>

<body>
  <div>

        <button onclick="location.href='index.html'"  style="margin-left:250px;">Inicio</button>
         <button onclick="location.href='promociones.php'" >Promociones</button>
          <button onclick="location.href='sugerencias.php'" >Sugerencias</button>

       <img src="imagenes/burro.png" style="width:114px; float: right; margin-top:-95px; margin-right: 1184px;">
       <img src="imagenes/logo.png" style="width:205px; float: right; margin-top:-130px; margin-right: 993px; ">
 
    </div>

    
<div class= menu1>
   
<img src="imagenes/menu.png" style="width:185px; float: right; margin-top:-35px; margin-right: 150px">

<div class= secmenu>
    
    <section>
    <img src="imagenes/menu1.png" onclick="cargarPlatillo(1)">
    <img src="imagenes/menu2.png" onclick="cargarPlatillo(2)">
    <img src="imagenes/menu3.png" onclick="cargarPlatillo(3)">
    <img src="imagenes/menu4.png" onclick="cargarPlatillo(4)">
    <img src="imagenes/menu5.png" onclick="cargarPlatillo(5)">
    <img src="imagenes/menu6.png" onclick="cargarPlatillo(6)">


   </section>
  
</div>
 <div id="info-platillo"
  style="
    background:rgba(0, 0, 0, 0);
    text-color:white;
    border-radius:15px;
    display:none;
    text-align:left;
    color:black;
    width:305px;
     float: right; 
     margin-top:-305px; 
     margin-right: 20px

  ">
  </div>
    </div>
    <h6 style= "color:rgb(73, 49, 27); text-align: center;">
Creado por: Carrillo Valeria, Salcido Sebastian, Tirado Cameron<br>
Para mas información, dudas, etc. Envíanos correo!!!<br>
mranttenna@gmail.com
</h6>
</body>
</html>