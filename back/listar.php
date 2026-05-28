<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');

include "conexao.php";

$tabela = isset($_GET['tabela']) ? trim($_GET['tabela']) : '';

$tabelasPermitidas = ['fontes', 'gabinetes', 'gpu', 'placamae', 'processadores', 'ram', 'ssd'];

$tabelaLower = mb_strtolower($tabela, 'UTF-8');

if (!in_array($tabelaLower, $tabelasPermitidas)) {
    http_response_code(400);
    echo json_encode(["erro" => "Tabela '$tabela' nao e permitida ou invalida."]);
    exit();
}

$tabelaNormalizada = ucfirst($tabelaLower);
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

if ($id) {
    $sql = "SELECT * FROM " . $conn->real_escape_string($tabelaNormalizada) . " WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $resultado = $stmt->get_result();
} else {
    $sql = "SELECT * FROM " . $conn->real_escape_string($tabelaNormalizada);
    $resultado = $conn->query($sql);
}
$sql = "SELECT * FROM " . $conn->real_escape_string($tabelaNormalizada);

if (!$resultado) {
    http_response_code(500);
    echo json_encode(["erro" => "Falha na consulta SQL: " . $conn->error]);
    exit();
}

$dados = [];

if ($resultado->num_rows > 0) {
    while ($linha = $resultado->fetch_assoc()) {
        $dados[] = $linha;
    }
}

echo json_encode($dados, JSON_UNESCAPED_UNICODE);

$conn->close();
