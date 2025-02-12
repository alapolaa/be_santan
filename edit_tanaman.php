<?php
include 'koneksi.php';

if (isset($_GET['id'])) {
    $id_tanaman = $_GET['id'];

    $sql = "SELECT t.id_tanaman, t.nama_tanaman, t.deskripsi, t.gambar, m.id_musim
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

$sql_musim = "SELECT id_musim, nama_musim FROM Musim";
$result_musim = $conn->query($sql_musim);

if (isset($_POST['submit'])) {
    $nama_tanaman = $_POST['nama_tanaman'];
    $deskripsi = $_POST['deskripsi'];
    $id_musim = $_POST['id_musim'];

    $target_dir = "images/";
    $new_image_name = "";

    if ($_FILES["gambar"]["error"] == 0) {
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
            $new_image_name = basename($target_file);
        } else {
            echo "Maaf, terjadi kesalahan saat mengupload gambar atau validasi gagal.";
            exit();
        }
    }


    $sql_update = "UPDATE Tanaman SET 
                    nama_tanaman = '$nama_tanaman',
                    deskripsi = '$deskripsi',
                    id_musim = '$id_musim'";

    if (!empty($new_image_name)) {
        $sql_update .= ", gambar = '$new_image_name'";
    }

    $sql_update .= " WHERE id_tanaman = '$id_tanaman'";


    if ($conn->query($sql_update) === TRUE) {
        header("Location: tanaman.php");
        exit();
    } else {
        echo "Error: " . $sql_update . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Edit Data Tanaman</title>
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
        <h2>Edit Data Tanaman</h2>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="nama_tanaman">Nama Tanaman:</label>
                <input type="text" class="form-control" id="nama_tanaman" name="nama_tanaman" value="<?php echo $row['nama_tanaman']; ?>" required>
            </div>
            <div class="form-group">
                <label for="deskripsi">Deskripsi:</label>
                <textarea class="form-control" id="deskripsi" name="deskripsi" required><?php echo $row['deskripsi']; ?></textarea>
            </div>
            <div class="form-group">
                <label for="gambar">Gambar:</label>
                <input type="file" class="form-control-file" id="gambar" name="gambar" accept="image/*">
                <?php if (!empty($row['gambar'])): ?>
                    <img src="images/<?php echo $row['gambar']; ?>" alt="<?php echo $row['nama_tanaman']; ?>" width="100">
                <?php endif; ?>
            </div>
            <div class="form-group">
                <label for="id_musim">Musim:</label>
                <select class="form-control" id="id_musim" name="id_musim">
                    <?php
                    if ($result_musim->num_rows > 0) {
                        while ($row_musim = $result_musim->fetch_assoc()) {
                            $selected = ($row_musim["id_musim"] == $row["id_musim"]) ? "selected" : "";
                            echo "<option value='" . $row_musim["id_musim"] . "' $selected>" . $row_musim["nama_musim"] . "</option>";
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