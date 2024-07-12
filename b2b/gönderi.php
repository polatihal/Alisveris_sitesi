<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aliyavuz";

// Veritabanına bağlantı oluşturma
$conn = new mysqli($servername, $username, $password, $dbname);

// Bağlantıyı kontrol et
if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

// Formdan gelen verileri al
$baslik = $_POST['baslik'];
$icerik = $_POST['icerik'];

// Dosya yükleme işlemi
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["resim"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Dosya türünü kontrol et
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["resim"]["tmp_name"]);
    if($check !== false) {
        echo "Dosya bir resim - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "Dosya bir resim değil.";
        $uploadOk = 0;
    }
}

// Dosyayı yükle
if ($uploadOk == 1 && move_uploaded_file($_FILES["resim"]["tmp_name"], $target_file)) {
    echo "Dosya başarıyla yüklendi: " . htmlspecialchars(basename($_FILES["resim"]["name"]));
} else {
    echo "Dosya yüklenirken bir hata oluştu.";
}

// SQL sorgusu oluşturma
$sql = "INSERT INTO gonderiler (baslik, icerik, resim_yolu) VALUES (?, ?, ?)";

// Hazırlanan ifade kullanma
if ($stmt = $conn->prepare($sql)) {
    $stmt->bind_param("sss", $baslik, $icerik, $target_file);

    // Sorguyu çalıştırma
    if ($stmt->execute()) {
        echo "<script>alert('Gönderi başarıyla yüklendi.'); window.location.href = 'sosyalkayıt.php';</script>";
        exit();
    } else {
        echo "Hata: " . $stmt->error;
    }

    // Hazırlanan ifadeyi kapatma
    $stmt->close();
} else {
    echo "Hata: " . $conn->error;
}

// Bağlantıyı kapatma
$conn->close();
?>
