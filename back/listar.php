<?php

include "conexao.php";

header('Content-Type: aplication/json');

$sql = "SELECT * FROM usuarios";
$resultado = $conn->query($sql);
$dados = [];
if ($resultado->num_rows > 0) {
    while ($linha = $resultado->fetch_assoc()) {
        $dados[] = $linha;
    }
}
echo json_encode($dados);
$conn->close();
