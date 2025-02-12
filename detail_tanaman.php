<?php
include 'koneksi.php';

if (isset($_GET['id'])) {
    $id_tanaman = $_GET['id'];

    $sql = "SELECT t.id_tanaman, t.nama_tanaman, t.deskripsi, t.gambar, m.nama_musim
            FROM Tanaman t
            INNER JOIN Musim m ON t.id_musim = m.id_musim
            WHERE t.id_tanaman = '$id_tanaman'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
    } else {
        echo "Data tidak ditemukan.";
        exit();
    }
} else {
    echo "ID tidak valid.";
    exit();
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Detail Data Tanaman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            max-width: 1000px;
        }

        .detail-label {
            font-weight: bold;
        }

        img {
            max-width: 100%;

            height: auto;
            display: block;

            margin: 10px auto;

        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Detail Data Tanaman</h2>
        <div class="card">
            <div class="card-body">

                <div class="row">
                    <div class="col-md-4">
                        <p class="detail-label">Nama Tanaman:</p>
                    </div>
                    <div class="col-md-8">
                        <p><?php echo $row['nama_tanaman']; ?></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <p class="detail-label">Deskripsi:</p>
                    </div>
                    <div class="col-md-8">
                        <p><?php echo $row['deskripsi']; ?></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <p class="detail-label">Gambar:</p>
                    </div>
                    <div class="col-md-8">
                        <img src="images/<?php echo $row['gambar']; ?>" alt="<?php echo $row['nama_tanaman']; ?>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <p class="detail-label">Musim:</p>
                    </div>
                    <div class="col-md-8">
                        <p><?php echo $row['nama_musim']; ?></p>
                    </div>
                </div>
                <a href="tanaman.php" class="btn btn-secondary">Kembali</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>