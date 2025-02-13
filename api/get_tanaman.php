<?php
include '../koneksi.php';


header('Content-Type: application/json');


$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':

        $sql = "SELECT t.id_tanaman, t.nama_tanaman, t.deskripsi, t.gambar, m.nama_musim
                FROM Tanaman t
                INNER JOIN Musim m ON t.id_musim = m.id_musim";
        $result = $conn->query($sql);

        $data = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {

                $row['gambar'] = 'images/' . $row['gambar'];
                $data[] = $row;
            }
        }

        echo json_encode($data);
        break;

    default:

        $response = array('status' => 'error', 'message' => 'Method tidak diizinkan');
        echo json_encode($response);
        break;
}

$conn->close();
