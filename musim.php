<?php

include 'koneksi.php';
$sql = "SELECT * FROM Musim";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>";
    echo "<div class='container'>";
    echo "<h2>Data Musim</h2>";
    echo "<table class='table table-bordered table-hover'>";
    echo "<thead class='thead-dark'>";
    echo "<tr><th>No</th><th>Nama Musim</th></tr>";
    echo "</thead>";
    echo "<tbody>";
    $no = 1;
    while ($row = $result->fetch_assoc()) {
        $warna_baris = ($no % 2 == 0) ? "table-light" : "";
        echo "<tr class='" . $warna_baris . "'>";
        echo "<td>" . $no . "</td>";
        echo "<td>" . $row["nama_musim"] . "</td>";
        echo "</tr>";
        $no++;
    }
    echo "</tbody>";
    echo "</table>";
    echo "</div>";
} else {
    echo "Tidak ada data musim.";
}
