<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');

include "conexao.php";

$tabela = isset($_GET['tabela']) ? trim($_GET['tabela']) : '';
$tabelasPermitidas = ['fontes', 'gabinetes', 'gpu', 'placamae', 'processadores', 'ram', 'ssd'];
$tabelaLower = mb_strtolower($tabela, 'UTF-8');

$ordemRecebida = isset($_GET['ordem']) ? $_GET['ordem'] : 'relevancia';
switch ($ordemRecebida) {
    case 'menor':
        $direcaoOrdem = 'preco ASC';
        break;
    case 'maior':
        $direcaoOrdem = 'preco DESC';
        break;
    case 'alfabeto':
        $direcaoOrdem = 'nome ASC';
        break;
    default:
        $direcaoOrdem = "id ASC";
        break;
}

if (!in_array($tabelaLower, $tabelasPermitidas)) {
    http_response_code(400);
    echo json_encode(["erro" => "Tabela '$tabela' nao e permitida ou invalida."]);
    exit();
}

$tabelaNormalizada = ucfirst($tabelaLower);
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

if ($tabelaLower === 'placamae') {
    $tabelaNormalizada = 'PlacaMae';
} elseif ($tabelaLower === 'gpu') {
    $tabelaNormalizada = 'GPU';
}

$tabelaSegura = $conn->real_escape_string($tabelaNormalizada);

$busca = isset($_GET['busca']) ? trim($_GET['busca']) : '';
$buscaSegura = $conn->real_escape_string($busca);

$soquete = isset($_GET['soquete']) ? $conn->real_escape_string(trim($_GET['soquete'])) : '';
$ddr = isset($_GET['ddr']) ? $conn->real_escape_string(trim($_GET['ddr'])) : '';

if ($id !== null) {
    $sql = "SELECT * FROM " . $tabelaSegura . " WHERE id = " . $id;
} else {
    $sql = "SELECT * FROM " . $tabelaSegura;
    $filtros = [];
    
    if (!empty($buscaSegura)) {
        $filtros[] = "LOWER(nome) LIKE LOWER('%" . $buscaSegura . "%')";
    }
    
    if (!empty($soquete) && in_array($tabelaLower, ['placamae', 'processadores'])) {
        $filtros[] = "soquete = '" . $soquete . "'";
    }

    if (!empty($ddr) && in_array($tabelaLower, ['placamae', 'ram'])) {
        $filtros[] = "ddr = '" . $ddr . "'";
    }

    if (count($filtros) > 0) {
        $sql .= " WHERE " . implode(" AND ", $filtros);
    }
}

$sql .= " ORDER BY " . $direcaoOrdem . ";";

$resultado = $conn->query($sql);

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
