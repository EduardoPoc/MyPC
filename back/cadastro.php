<?php

include 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];

    $sql = 'INSERT INTO usuarios (nome, email) VALUES (?, ?)';

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $nome, $email);
    if ($stmt->execute()) {
        header("location: ../index.html");
    } else {
        echo "Erro: ". $stmt->error;
    }

    $stmt->close();

}
$conn->close();
