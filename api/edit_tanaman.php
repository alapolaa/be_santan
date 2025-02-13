<?php
include '../koneksi.php';

header('Content-Type: application/json');

$target_dir = "images/";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['action']) && $_POST['action'] == 'add') { // Check for 'add' action

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
    } elseif (isset($_POST['action']) && $_POST['action'] == 'edit') { // Edit action

        if (isset($_POST['id_tanaman'], $_POST['nama_tanaman'], $_POST['deskripsi'], $_POST['id_musim'])) {
            $id_tanaman = $_POST['id_tanaman'];
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

            $sql = "UPDATE Tanaman SET nama_tanaman=?, deskripsi=?, id_musim=?";
            $params = array($nama_tanaman, $deskripsi, $id_musim);

            if ($gambar !== null) {
                $sql .= ", gambar=?";
                $params[] = $gambar;
            }

            $sql .= " WHERE id_tanaman=?";
            $params[] = $id_tanaman;


            $stmt = $conn->prepare($sql);
            $stmt->bind_param(str_repeat("s", count($params)), ...$params);

            if ($stmt->execute()) {
                $response = array('status' => 'success', 'message' => 'Data berhasil diupdate.');
            } else {
                $response = array('status' => 'error', 'message' => 'Error: ' . $stmt->error);
            }

            $stmt->close();
        } else {
            $response = array('status' => 'error', 'message' => 'Data tidak lengkap untuk edit.');
        }

        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Action tidak valid.');
        echo json_encode($response);
    }
} else {
    $response = array('status' => 'error', 'message' => 'Metode bukan POST.');
    echo json_encode($response);
}

$conn->close();
