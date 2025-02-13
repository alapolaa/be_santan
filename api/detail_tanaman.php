<?php
include '../koneksi.php';

header('Content-Type: application/json');

if (isset($_GET['id'])) {
    $id_tanaman = $_GET['id'];

    $sql = "SELECT t.id_tanaman, t.nama_tanaman, t.deskripsi, t.gambar, m.nama_musim
            FROM Tanaman t
            INNER JOIN Musim m ON t.id_musim = m.id_musim
            WHERE t.id_tanaman = '$id_tanaman'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();


        $data = array(
            "id_tanaman" => $row['id_tanaman'],
            "nama_tanaman" => $row['nama_tanaman'],
            "deskripsi" => $row['deskripsi'],
            "gambar" => "images/" . $row['gambar'],
            "nama_musim" => $row['nama_musim']
        );

        echo json_encode($data);
    } else {
        echo json_encode(array("message" => "Data tidak ditemukan."));
        http_response_code(404);
        exit();
    }
} else {
    echo json_encode(array("message" => "ID tidak valid."));
    http_response_code(400);
    exit();
}

$conn->close();
