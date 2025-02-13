<?php
header('Content-Type: application/json');

include '../koneksi.php';

$sql = "SELECT * FROM wilayah";
$result = mysqli_query($conn, $sql);

$data = array();
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = array(
            "id_wilayah" => $row["id_wilayah"],
            "nama_wilayah" => $row["nama_wilayah"],
            "latitude" => $row["latitude"],
            "longitude" => $row["longitude"]
        );
    }
    echo json_encode($data);
} else {
    echo json_encode(array("message" => "Tidak ada data wilayah."));
    http_response_code(404); // Not Found
}

mysqli_close($conn);
