<?php
include '../koneksi.php';

header('Content-Type: application/json');

$target_dir = "../images/";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['nama_tanaman'], $_POST['deskripsi'], $_POST['id_musim'])) {
        $nama_tanaman = $_POST['nama_tanaman'];
        $deskripsi = $_POST['deskripsi'];
        $id_musim = $_POST['id_musim'];


        $gambar = null;
        if (isset($_FILES["gambar"])) {
            $target_file = $target_dir . basename($_FILES["gambar"]["name"]);
            $uploadOk = 1;
            $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));



            if ($uploadOk == 1 && move_uploaded_file($_FILES["gambar"]["tmp_name"], $target_file)) {
                $gambar = basename($target_file);
            } else {
                $response = array('status' => 'error', 'message' => 'Gagal upload gambar.');
                echo json_encode($response);
                exit;
            }
        }

        // Prepared statements untuk keamanan
        $stmt = $conn->prepare("INSERT INTO Tanaman (nama_tanaman, deskripsi, gambar, id_musim) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("sssi", $nama_tanaman, $deskripsi, $gambar, $id_musim);

        if ($stmt->execute()) {
            $response = array('status' => 'success', 'message' => 'Data berhasil ditambahkan.');
        } else {
            $response = array('status' => 'error', 'message' => 'Error: ' . $stmt->error);
        }

        $stmt->close();
    } else {
        $response = array('status' => 'error', 'message' => 'Data tidak lengkap.');
    }

    echo json_encode($response);
} else {
    $response = array('status' => 'error', 'message' => 'Metode bukan POST.');
    echo json_encode($response);
}

$conn->close();
