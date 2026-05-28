<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'conexao.php';

$id = (isset($_POST['id']) && $_POST['id'] !== '') ? (int)$_POST['id'] : null;
$categoria = $_POST['categoria'];
$nome      = $_POST['nome'];
$preco     = $_POST['preco'];
$descricao = $_POST['descricao'] ?? '';

$pasta = 'img/' . $categoria . '/';

if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
    $foto = $pasta . basename($_FILES['foto']['name']);
    move_uploaded_file($_FILES['foto']['tmp_name'], '../' . $foto);
} else {
    $foto = $_POST['foto_atual'] ?? '';
}

switch ($categoria) {

    case 'processador':
        $marca   = $_POST['marca'];
        $soquete = $_POST['soquete'];
        if ($id) {
            $sql  = "UPDATE Processadores SET nome=?, marca=?, soquete=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdssi", $nome, $marca, $soquete, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO Processadores (nome, marca, soquete, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdss", $nome, $marca, $soquete, $preco, $foto, $descricao);
        }
        break;

    case 'placamae':
        $soquete = $_POST['soquete'];
        $ddr     = $_POST['ddr'];
        if ($id) {
            $sql  = "UPDATE PlacaMae SET nome=?, soquete=?, ddr=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdssi", $nome, $soquete, $ddr, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO PlacaMae (nome, soquete, ddr, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdss", $nome, $soquete, $ddr, $preco, $foto, $descricao);
        }
        break;

    case 'ram':
        $ddr        = $_POST['ddr'];
        $capacidade = $_POST['capacidade'];
        if ($id) {
            $sql  = "UPDATE Ram SET nome=?, ddr=?, capacidade=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdssi", $nome, $ddr, $capacidade, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO Ram (nome, ddr, capacidade, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdss", $nome, $ddr, $capacidade, $preco, $foto, $descricao);
        }
        break;

    case 'gpu':
        $marca = $_POST['marca'];
        if ($id) {
            $sql  = "UPDATE GPU SET nome=?, marca=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssdssi", $nome, $marca, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO GPU (nome, marca, preco, foto, descricao) VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssdss", $nome, $marca, $preco, $foto, $descricao);
        }
        break;

    case 'ssd':
        $capacidade = $_POST['capacidade'];
        $tipo       = $_POST['tipo'];
        if ($id) {
            $sql  = "UPDATE Ssd SET nome=?, capacidade=?, tipo=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdssi", $nome, $capacidade, $tipo, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO Ssd (nome, capacidade, tipo, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdss", $nome, $capacidade, $tipo, $preco, $foto, $descricao);
        }
        break;

    case 'fonte':
        $marca    = $_POST['marca'];
        $potencia = $_POST['potencia'];
        if ($id) {
            $sql  = "UPDATE Fontes SET nome=?, marca=?, potencia=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssidssi", $nome, $marca, $potencia, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO Fontes (nome, marca, potencia, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssidss", $nome, $marca, $potencia, $preco, $foto, $descricao);
        }
        break;

    case 'gabinete':
        $marca = $_POST['marca'];
        $tipo  = $_POST['tipo'];
        if ($id) {
            $sql  = "UPDATE Gabinetes SET nome=?, marca=?, tipo=?, preco=?, foto=?, descricao=? WHERE id=?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdssi", $nome, $marca, $tipo, $preco, $foto, $descricao, $id);
        } else {
            $sql  = "INSERT INTO Gabinetes (nome, marca, tipo, preco, foto, descricao) VALUES (?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssdss", $nome, $marca, $tipo, $preco, $foto, $descricao);
        }
        break;

    default:
        die("Categoria inválida.");
}

$stmt->execute();
header("Location: ../index.html");
$conn->close();
