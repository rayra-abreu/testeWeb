<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Banco Pedido</title>
</head>
<body>
  <?php
    $servername="localhost";
    $username="root";
    $password="usbw";
    $dbname="db_pedido";

    $conn=new mysqli($servername, $username, $password);

    if($conn->connect_error){
      die("Falha na conexão: ".$conn->connect_error.". ");
    }

    echo "Conectado com sucesso. ";

    $sql="CREATE DATABASE db_pedido";

    if($conn->query($sql)===TRUE){
      echo "Banco de dados criado. ";
    }else{
      echo "Erro ao criar o banco de dados: ".$conn->error.". ";
    }

    $conn=new mysqli($servername, $username, $password, $dbname);

    if($conn->connect_error){
      die("Falha na conexão com o banco de dados: ".$conn->connect_error.". ");
    }

    echo "Conectado ao banco de dados. ";

    $conn->close();
  ?>
</body>
</html>
