<?php

$servidor = "localhost";
$usuario = "eduardo";
$senha = "senha123";
$banco = "crud_dinamico";

$conn = new mysqli($servidor, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Falha na conexão ". $conn->connect_error);
}
