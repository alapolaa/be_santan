<?php
header('Content-Type: application/json');

include '../koneksi.php';

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
        return null; // Mengembalikan null jika tidak ada data cuaca
    }
}

// Mendapatkan id_wilayah dari parameter query
$id_wilayah = isset($_GET['id_wilayah']) ? $_GET['id_wilayah'] : 1; // Default id_wilayah = 1

$musim_data = get_musim($id_wilayah);

if ($musim_data) {
    $id_musim = $musim_data["id_musim"];
    $nama_musim = $musim_data["nama_musim"];

    $sql = "SELECT * FROM Tanaman WHERE id_musim = '$id_musim'";
    $result = $conn->query($sql);

    $tanaman_data = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $tanaman_data[] = array(
                "id_tanaman" => $row['id_tanaman'],
                "nama_tanaman" => $row['nama_tanaman'],
                "deskripsi" => $row['deskripsi'],
                "gambar" => "../images/" . $row['gambar'] // Sertakan path gambar
            );
        }
    }

    echo json_encode(array("musim" => $musim_data, "tanaman" => $tanaman_data));
} else {
    echo json_encode(array("message" => "Tidak ada data cuaca untuk wilayah ini."));
    http_response_code(404); // Kode status 404 Not Found
}

$conn->close();
