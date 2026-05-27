<?php

$servidor = "localhost";
$usuario = "root";
$senha = "";
$banco = "mypc";

$conn = new mysqli($servidor, $usuario, $senha, $banco);

if ($conn->connect_error) {
    $senha = "senha123";
    $conn = new mysqli($servidor, $usuario, $senha, $banco);

    if ($conn->connect_error) {
        die("Falha na conexão ". $conn->connect_error);
    }
}
