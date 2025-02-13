<?php
include 'koneksi.php';

function get_musim($id_wilayah)
{
    global $conn;

    $sql_cuaca = "SELECT suhu, kelembapan, curah_hujan FROM Data_Cuaca WHERE id_wilayah = '$id_wilayah'";
    $result_cuaca = $conn->query($sql_cuaca);

    $total_suhu = 0;
    $total_kelembapan = 0;
    $total_curah_hujan = 0;
    $jumlah_data = 0;

    while ($row_cuaca = $result_cuaca->fetch_assoc()) {
        $total_suhu += $row_cuaca['suhu'];
        $total_kelembapan += $row_cuaca['kelembapan'];
        $total_curah_hujan += $row_cuaca['curah_hujan'];
        $jumlah_data++;
    }

    if ($jumlah_data > 0) {
        $rata_rata_suhu = $total_suhu / $jumlah_data;
        $rata_rata_kelembapan = $total_kelembapan / $jumlah_data;
        $rata_rata_curah_hujan = $total_curah_hujan / $jumlah_data;

        $nama_musim = ($rata_rata_suhu < 27 && $rata_rata_kelembapan < 70 && $rata_rata_curah_hujan < 134) ? "Kemarau" : "Penghujan";

        $sql_musim = "SELECT id_musim FROM Musim WHERE nama_musim = '$nama_musim'";
        $result_musim = $conn->query($sql_musim);
        $row_musim = $result_musim->fetch_assoc();
        $id_musim = $row_musim['id_musim'];

        return array("id_musim" => $id_musim, "nama_musim" => $nama_musim);
    } else {
        return "Tidak ada data cuaca.";
    }
}

$id_wilayah = 1;
$musim_data = get_musim($id_wilayah);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saran Tanaman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .img-fluid {
            max-width: 100px;
            height: auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <?php
        if ($musim_data != "Tidak ada data cuaca.") {
            $id_musim = $musim_data["id_musim"];
            $nama_musim = $musim_data["nama_musim"];

            $sql = "SELECT * FROM Tanaman WHERE id_musim = '$id_musim'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<h2>Saran Tanaman untuk Musim " . $nama_musim . "</h2>";
                echo "<div class='table-responsive'>";
                echo "<table class='table table-bordered table-hover'>";
                echo "<thead class='thead-dark'>";
                echo "<tr><th>No</th><th>Nama Tanaman</th><th>Deskripsi</th><th>Gambar</th></tr>";
                echo "</thead>";
                echo "<tbody>";
                $no = 1;
                while ($row = $result->fetch_assoc()) {
                    $warna_baris = ($no % 2 == 0) ? "table-light" : "";
                    echo "<tr class='" . $warna_baris . "'>";
                    echo "<td>" . $no . "</td>";
                    echo "<td>" . $row['nama_tanaman'] . "</td>";
                    echo "<td>" . $row['deskripsi'] . "</td>";
                    echo "<td><img src='images/" . $row['gambar'] . "' alt='" . $row['nama_tanaman'] . "' width='100' class='img-fluid'></td>";
                    echo "</tr>";
                    $no++;
                }
                echo "</tbody>";
                echo "</table>";
                echo "</div>";
            } else {
                echo "Tidak ada data tanaman yang sesuai untuk musim " . $nama_musim . ".";
            }
        } else {
            echo $musim_data;
        }
        ?>
        <div class="mt-3">
            <?php
            if (isset($_SERVER['HTTP_REFERER'])) {
                // echo "<a href='" . $_SERVER['HTTP_REFERER'] . "' class='btn btn-secondary'>Kembali</a>";
            } else {
            }
            ?>
        </div>
    </div>
</body>

</html>