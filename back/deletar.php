<?php

include 'conexao.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    //mudar
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
