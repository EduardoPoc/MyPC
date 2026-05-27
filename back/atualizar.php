<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'conexao.php';
$categoria = $_POST['categoria'];
$nome      = $_POST['nome'];
$preco     = $_POST['preco'];
$descricao = $_POST['descricao'] ?? '';

$pasta = 'img/' . $categoria . '/';
$foto  = $pasta . basename($_FILES['foto']['name']);
move_uploaded_file($_FILES['foto']['tmp_name'], '../' . $foto);

switch ($categoria) {

    case 'processador':
        $marca   = $_POST['marca'];
        $soquete = $_POST['soquete'];
        $sql  = "INSERT INTO Processadores (nome, marca, soquete, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssdss", $nome, $marca, $soquete, $preco, $foto, $descricao);
        break;

    case 'placamae':
        $soquete = $_POST['soquete'];
        $ddr     = $_POST['ddr'];
        $sql  = "INSERT INTO PlacaMae (nome, soquete, ddr, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssdss", $nome, $soquete, $ddr, $preco, $foto, $descricao);
        break;

    case 'ram':
        $ddr        = $_POST['ddr'];
        $capacidade = $_POST['capacidade'];
        $sql  = "INSERT INTO Ram (nome, ddr, capacidade, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssdss", $nome, $ddr, $capacidade, $preco, $foto, $descricao);
        break;

    case 'gpu':
        $marca = $_POST['marca'];
        $sql  = "INSERT INTO GPU (nome, marca, preco, foto, descricao) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssdss", $nome, $marca, $preco, $foto, $descricao);
        break;

    case 'ssd':
        $capacidade = $_POST['capacidade'];
        $tipo       = $_POST['tipo'];
        $sql  = "INSERT INTO Ssd (nome, capacidade, tipo, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssdss", $nome, $capacidade, $tipo, $preco, $foto, $descricao);
        break;

    case 'fonte':
        $marca    = $_POST['marca'];
        $potencia = $_POST['potencia'];
        $sql  = "INSERT INTO Fontes (nome, marca, potencia, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssidss", $nome, $marca, $potencia, $preco, $foto, $descricao);
        break;

    case 'gabinete':
        $marca = $_POST['marca'];
        $tipo  = $_POST['tipo'];
        $sql  = "INSERT INTO Gabinetes (nome, marca, tipo, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssdss", $nome, $marca, $tipo, $preco, $foto, $descricao);
        break;

    default:
        die("Categoria inválida.");
}

$stmt->execute();
header("Location: ../index.html");
