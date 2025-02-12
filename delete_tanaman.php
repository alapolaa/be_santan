<?php
include 'koneksi.php';

if (isset($_GET['id'])) {
    $id_tanaman = $_GET['id'];

    $sql = "DELETE FROM Tanaman WHERE id_tanaman = '$id_tanaman'";

    if ($conn->query($sql) === TRUE) {
        header("Location: tanaman.php");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "ID tidak valid.";
    exit();
}
