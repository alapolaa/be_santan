<?php
include 'koneksi.php';

$sql = "SELECT t.id_tanaman, t.nama_tanaman, t.deskripsi, t.gambar, m.nama_musim
        FROM Tanaman t
        INNER JOIN Musim m ON t.id_musim = m.id_musim";
$result = $conn->query($sql);
?>


<!DOCTYPE html>
<html>

<head>
    <title>Data Tanaman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        img {
            max-width: 100px;
            height: auto;
        }

        .action-links {
            white-space: nowrap;
        }

        .action-links a {
            margin-right: 5px;
        }

        .btn-primary {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }

        .btn-primary:hover {
            background-color: #45a049;
            border-color: #45a049;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Data Tanaman</h2>

        <div class="mb-3">
            <a href="add_tanaman.php" class="btn btn-primary">Tambah Data Tanaman</a>
            <a href="saran.php" class="btn btn-primary">Lihat Saran Tanaman</a>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Tanaman</th>
                        <th>Deskripsi</th>
                        <th>Gambar</th>
                        <th>Musim</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result->num_rows > 0) {
                        $no = 1;
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $no . "</td>";
                            echo "<td>" . $row["nama_tanaman"] . "</td>";
                            echo "<td>" . $row["deskripsi"] . "</td>";
                            echo "<td><img src='images/" . $row["gambar"] . "' alt='" . $row["nama_tanaman"] . "'></td>";
                            echo "<td>" . $row["nama_musim"] . "</td>";
                            echo "<td class='action-links'>
                                    <a href='edit_tanaman.php?id=" . $row["id_tanaman"] . "' class='btn btn-sm btn-primary'>Edit</a>
                                    <a href='delete_tanaman.php?id=" . $row["id_tanaman"] . "' class='btn btn-sm btn-danger' onclick=\"return confirm('Apakah Anda yakin ingin menghapus tanaman ini?')\">Hapus</a>
                                    <a href='detail_tanaman.php?id=" . $row["id_tanaman"] . "' class='btn btn-sm btn-info'>Detail</a>
                                  </td>";
                            echo "</tr>";
                            $no++;
                        }
                    } else {
                        echo "<tr><td colspan='6'>Tidak ada data tanaman.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>