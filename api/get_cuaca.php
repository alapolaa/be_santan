<?php
header('Content-Type: application/json');

include '../koneksi.php';

$sql = "SELECT * FROM data_cuaca";
$result = mysqli_query($conn, $sql);

$data = array();
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
}

echo json_encode($data);

mysqli_close($conn);
