<?php
include 'koneksi.php';

$sql_musim = "SELECT id_musim, nama_musim FROM Musim";
$result_musim = $conn->query($sql_musim);

if (isset($_POST['submit'])) {
    $nama_tanaman = $_POST['nama_tanaman'];
    $deskripsi = $_POST['deskripsi'];
    $id_musim = $_POST['id_musim'];

    $target_dir = "images/";
    $target_file = $target_dir . basename($_FILES["gambar"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    $check = getimagesize($_FILES["gambar"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File bukan gambar.";
        $uploadOk = 0;
    }

    if ($uploadOk == 1 && move_uploaded_file($_FILES["gambar"]["tmp_name"], $target_file)) {
        $sql_insert = "INSERT INTO Tanaman (nama_tanaman, deskripsi, gambar, id_musim)
                       VALUES ('$nama_tanaman', '$deskripsi', '" . basename($target_file) . "', '$id_musim')";

        if ($conn->query($sql_insert) === TRUE) {
            header("Location: tanaman.php");
            exit();
        } else {
            echo "Error: " . $sql_insert . "<br>" . $conn->error;
        }
    } else {
        echo "Maaf, terjadi kesalahan saat mengupload gambar atau validasi gagal.";
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Tambah Data Tanaman</title>
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
            max-width: 600px;
        }

        label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
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
        <h2>Tambah Data Tanaman</h2>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="nama_tanaman">Nama Tanaman:</label>
                <input type="text" class="form-control" id="nama_tanaman" name="nama_tanaman" required>
            </div>
            <div class="form-group">
                <label for="deskripsi">Deskripsi:</label>
                <textarea class="form-control" id="deskripsi" name="deskripsi" required></textarea>
            </div>
            <div class="form-group">
                <label for="gambar">Gambar:</label>
                <input type="file" class="form-control-file" id="gambar" name="gambar" accept="image/*">
            </div>
            <div class="form-group">
                <label for="id_musim">Musim:</label>
                <select class="form-control" id="id_musim" name="id_musim">
                    <?php
                    if ($result_musim->num_rows > 0) {
                        while ($row_musim = $result_musim->fetch_assoc()) {
                            echo "<option value='" . $row_musim["id_musim"] . "'>" . $row_musim["nama_musim"] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Simpan</button>
            <a href="tanaman.php" class="btn btn-secondary">Kembali</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>