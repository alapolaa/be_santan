<?php
include 'koneksi.php';

$sql = "SELECT * FROM Data_Cuaca";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>";
    echo "<div class='container'>";
    echo "<h2>Data Cuaca</h2>";
    echo "<table class='table table-bordered'>";
    echo "<thead class='thead-dark'>";
    echo "<tr><th>No</th><th>Tanggal</th><th>Suhu</th><th>Kelembapan</th><th>Curah Hujan</th></tr>";
    echo "<tbody>";
    $no = 1;
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $no . "</td>";
        echo "<td>" . $row["tanggal"] . "</td>";
        echo "<td>" . $row["suhu"] . " °C</td>";
        echo "<td>" . $row["kelembapan"] . " %</td>";
        echo "<td>" . $row["curah_hujan"] . " mm</td>";
        echo "</tr>";
        $no++;
    }
    echo "</tbody>";
    echo "</table>";
    echo "</div>";
} else {
    echo "Tidak ada data cuaca.";
}
