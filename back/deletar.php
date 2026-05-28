<?php
include 'conexao.php';

if (isset($_GET['id']) && isset($_GET['tabela'])) {
    $id    = (int)$_GET['id'];
    $table = $_GET['tabela'];
    $foto  = $_GET['foto'] ?? '';

    // deleta do banco
    $sql  = "DELETE FROM $table WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        // verifica se mais algum produto usa a mesma foto
        if ($foto) {
            $sql2  = "SELECT COUNT(*) as total FROM $table WHERE foto = ?";
            $stmt2 = $conn->prepare($sql2);
            $stmt2->bind_param("s", $foto);
            $stmt2->execute();
            $result = $stmt2->get_result()->fetch_assoc();

            if ($result['total'] == 0) {
                if (file_exists('../' . $foto)) {
                    unlink('../' . $foto);
                }
            }
        }
        echo "ok";
    } else {
        echo "Erro: " . $stmt->error;
    }

    $stmt->close();
}