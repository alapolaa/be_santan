<?php
include '../koneksi.php';

// Set header untuk response JSON
header('Content-Type: application/json');

if (isset($_GET['id'])) {
    $id_tanaman = $_GET['id'];

    // Ambil nama gambar sebelum dihapus
    $sql_get_gambar = "SELECT gambar FROM Tanaman WHERE id_tanaman = $id_tanaman";
    $result_gambar = $conn->query($sql_get_gambar);

    if ($result_gambar->num_rows > 0) {
        $row_gambar = $result_gambar->fetch_assoc();
        $nama_gambar = $row_gambar['gambar'];

        $sql = "DELETE FROM Tanaman WHERE id_tanaman = $id_tanaman";

        if ($conn->query($sql) === TRUE) {
            // Hapus gambar dari folder jika ada
            if (!empty($nama_gambar) && file_exists("images/" . $nama_gambar)) {
                unlink("images/" . $nama_gambar);
            }
            $response = array('status' => 'success', 'message' => 'Data tanaman berhasil dihapus');
        } else {
            $response = array('status' => 'error', 'message' => 'Error: ' . $sql . "<br>" . $conn->error);
        }
    } else {
        $response = array('status' => 'error', 'message' => 'Data tanaman tidak ditemukan');
    }
} else {
    $response = array('status' => 'error', 'message' => 'ID tanaman tidak ditemukan');
}

echo json_encode($response);

$conn->close();
