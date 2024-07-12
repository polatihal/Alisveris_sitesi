<?php 
define('security',true);

require_once 'inc/header.php';

if( @$_SESSION['login'] != @sha1(md5(IP().$bcode)) ){
go(site);
}
?>



<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" />
<style>

.pagination {
     background: transparent!important;
     display:flex!important;
     padding:20px!important;
  
}
</style>
<!-- WRAPPER START -->
<div class="wrapper bg-dark-white">

<!-- HEADER-AREA START -->
<?php require_once 'inc/menu.php'; ?>
<!-- HEADER-AREA END -->
<!-- Mobile-menu start -->
<?php require_once 'inc/mobilemenu.php'; ?>
<!-- Mobile-menu end -->
<!-- HEADING-BANNER START -->
<div class="heading-banner-area overlay-bg" style="background: rgba(0, 0, 0, 0) url(<?php echo site;?>/uploads/general.webp) no-repeat scroll center center / cover;">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="heading-banner">
<div class="heading-banner-title">
<h2>Sosyal Hesap Profili</h2>
</div>
<div class="breadcumbs pb-15">
<ul>
    <li><a href="#">Ana Sayfa</a></li>
    <li>Sosyal Hesap Profili</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- HEADING-BANNER END -->




<!-- PRODUCT-AREA START -->
<div class="product-area pt-30 pb-80 product-style-2">
<div class="container">
<div class="row">
<div class="col-lg-3 order-2 order-lg-1">
<!-- Widget-Search start -->

<!-- Widget-search end -->
<!-- Widget-Categories start -->
<aside class="widget widget-categories  mb-30">
<div class="widget-title">
<h4>Menü</h4>
</div>
<div id="cat-treeview"  class="widget-info product-cat boxscrol2">
<ul>
    <li><a href="<?php echo site."/sosyalkayıt?process=profile";?>"><span>Sosyal Profil Bilgileri</span></a></li> 
  
    <li><a href="<?php echo site."/sosyalkayıt?process=changepassword";?>"><span>Şifremi Değiştir</span></a></li>       
    <li><a href="<?php echo site."/sosyalkayıt?process=logo";?>"><span>Logo Düzenle</span></a></li>           
      
           
    <li><a href="<?php echo site."/logout.php";?>"><span>Çıkış</span></a></li>         
    
</ul>
</div>
</aside>

<!-- Widget-banner end -->
</div>
<div class="col-lg-9 order-1 order-lg-2">

<?php 

$process = get('process');

switch($process){

    case 'logo':

        if(isset($_POST['logoupdate'])){

            require_once 'inc/class.upload.php';

            $image  = new Upload($_FILES['logoimage']);
            if($image->uploaded){

                $rname = $bcode."-".uniqid();
                $image->allowed = array("image/*");
                $image->image_convert = 'webp';
                $image->file_new_name_body = $rname;
              //  $image->file_max_size      = 1024; //max 1 mb
                $image->process("uploads/customer");

                if($image->processed){

                    $up = $db->prepare("UPDATE bayiler SET bayilogo=:logo WHERE bayikodu=:k");
                    $up->execute([':logo' => $rname.'.webp',':k'=>$bcode]);
                    if($up){
                        alert("Logonuz başarıyla güncellendi","success");
                        go(site."/profile?process=logo",2);
                    }else{
                        alert("Hata oluştu","danger");
                    }

                }else{
                    alert("Resim yüklenemedi","danger");
                }

            }else{
                alert("Resim seçmediniz","danger");
            }

        }

        ?>

            

        <form action="" method="POST" enctype="multipart/form-data">	
        <div class="customer-login text-left">
            <h4 class="title-1 title-border text-uppercase mb-30">LOGO GÜNCELLE</h4>
            <img src="<?php echo site."/uploads/customer/".$blogo;?>" width="100" height="100" alt="<?php echo $bcode;?>" />
            <input type="file" placeholder="Bayi logo" name="logoimage">
            <button type="submit" name="logoupdate" class="button-one submit-button mt-15">LOGO GÜNCELLE</button>
        </div>		
        </form>

        <?php 
    break;






case 'profile';
    ?>
    <div class="shop-content mt-tab-30 mb-30 mb-lg-0">
    <div class="product-option mb-30 clearfix">
        <!-- Nav tabs -->
        <ul class="nav d-block shop-tab">
            <li>Profil Bilgileri</li>
        </ul>
    </div>
    <!-- Tab panes -->
    
    <div class="login-area">
    <div class="container">
        <div class="row">

        <form action="" method="POST" onsubmit="return false;" id="profileform">	
        <div class="customer-login">

            <label>Bayi Kodu:</label>
            <input type="text" disabled value="<?php echo $bcode;?>" name="bec">

            <label>Bayi Adı:</label>
            <input type="text"value="<?php echo $bname;?>" name="bname" placeholder="Bayi adı ">

            <label>Bayi Mail:</label>
            <input type="text"value="<?php echo $bmail;?>" name="bmail" placeholder="Bayi mail ">

            <label>Bayi Telefon:</label>
            <input type="text"value="<?php echo $bphone;?>" name="bphone" placeholder="Bayi telefon ">

        
            
            
            <button type="submit" onclick="profilebutton();" id="profilebuton" class="button-one submit-button mt-15">PROFİLİMİ GÜNCELLE</button>
        </div>		
        </form>	

        </div>
    </div>
    </div>
        

    <!-- Pagination start -->
    
    <!-- Pagination end -->
</div>
    <?php 
break;



case 'changepassword';
?>
<div class="shop-content mt-tab-30 mb-30 mb-lg-0">
<div class="product-option mb-30 clearfix">
    <!-- Nav tabs -->
    <ul class="nav d-block shop-tab">
        <li>Şifremi Değiştir</li>
    </ul>
</div>
<!-- Tab panes -->

<div class="login-area">
<div class="container">
    <div class="row">

    <form action="" method="POST" onsubmit="return false;" id="passwordform">	
    <div class="customer-login">

        <label>Yeni şifreniz:</label>
        <input type="password" name="password" placeholder="Yeni şifreniz">

        <label>Yeni şifreniz tekrar:</label>
        <input type="password" name="password2" placeholder="Yeni şifrenizi tekrar giriniz">

        
        
        <button type="submit" onclick="passwordbutton();" id="passwordbuton" class="button-one submit-button mt-15">ŞİFREMİ GÜNCELLE</button>
    </div>		
    </form>	

    </div>
</div>
</div>
    

<!-- Pagination start -->

<!-- Pagination end -->
</div>
<?php 
break;

}

?>

</div>
</div>
</div>
</div>

<div  class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Gönderi Yükle</h2>
                        <form action="gönderi.php" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="baslik">Başlık:</label>
                                <input type="text" class="form-control" id="baslik" name="baslik" required>
                            </div>
                            <div class="form-group">
                                <label for="icerik">İçerik:</label>
                                <textarea class="form-control" id="icerik" name="icerik" rows="4" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="resim">Resim Seç:</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="resim" name="resim">
                                    <label class="custom-file-label" for="resim">Resim dosyası seçin...</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Gönderi Yükle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



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

// Gönderileri veritabanından çekme sorgusu
$sql = "SELECT * FROM gonderiler ORDER BY olusturma_tarihi DESC";
$result = $conn->query($sql);

// Eğer veri varsa, gönderileri listeleyelim
if ($result->num_rows > 0) {

    ?>
             <div class="container mt-5">
            <div class="row">
                <?php while($row = $result->fetch_assoc()) { ?>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="<?php echo htmlspecialchars($row['resim_yolu']); ?>" class="card-img-top" alt="Gönderi Resmi">
                            <div class="card-body">
                                <h5 class="card-title"><?php echo htmlspecialchars($row['baslik']); ?></h5>
                                <p class="card-text"><?php echo htmlspecialchars($row['icerik']); ?></p>
                                <p class="card-text"><small class="text-muted"> <?php echo htmlspecialchars($row['olusturma_tarihi']); ?></small></p>
                                <button type="button" class="btn btn-light emoji-btn" onclick="begen('<?php echo $row['id']; ?>')"><i class="far fa-thumbs-up"></i> <span class="emoji-count">0</span></button>
                                <button type="button" class="btn btn-light emoji-btn" onclick="yorum('<?php echo $row['id']; ?>')"><i class="far fa-comment"></i></button>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
        <!-- Bootstrap JS ve diğer gerekli kütüphaneler -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Font Awesome -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script>
            function begen(gonderiId) {
                // Burada AJAX kullanarak beğeni işlemini gerçekleştirebilirsiniz
                // Örneğin:
                // $.post("begen.php", { gonderi_id: gonderiId }, function(data) {
                //     if (data.success) {
                //         // Beğeni sayısını güncelle
                //         var count = parseInt($("#begeni-count-" + gonderiId).text());
                //         $("#begeni-count-" + gonderiId).text(count + 1);
                //     }
                // }, "json");
            }

            function yorum(gonderiId) {
                // Burada yorum eklemek için bir form veya modal gösterebilirsiniz
                // Örneğin:
                // $("#yorum-modal").modal("show");
                // $("#yorum-gonderi-id").val(gonderiId); // Yorum gönderisi için gizli input içine gonderiId değerini atayabilirsiniz
            }
        </script>
    </body>
    </html>
    <?php
} else {
    echo "Henüz hiç gönderi yok.";
}

// Bağlantıyı kapatma
$conn->close();
?>
<!-- PRODUCT-AREA END -->
<?php require_once 'inc/footer.php'; ?>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

<script>
$(document).ready(function() {
    $('#b2btable').DataTable();
} );
</script>