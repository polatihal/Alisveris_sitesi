<?php 
define('security',true);

require_once 'inc/header.php';

if( @$_SESSION['kullanici'] != @sha1(md5(IP().$kcode)) ){
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
<h2>Profilim</h2>
</div>
<div class="breadcumbs pb-15">
<ul>
    <li><a href="#">Ana Sayfa</a></li>
    <li>Üye Profili</li>
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
    <li><a href="<?php echo site."/profilim?process=uyeprofil";?>"><span>Üye profil Bilgileri</span></a></li> 
    
    <li><a href="<?php echo site."/profilim?process=changepassword";?>"><span>Şifremi Değiştir</span></a></li>       
              
    <li><a href="<?php echo site."/profilim?process=order";?>"><span>Siparişlerim</span></a></li>         
    <li><a href="<?php echo site."/profilim?process=address";?>"><span>Adreslerim</span></a></li>    
         
    <li><a href="<?php echo site."/cart.php";?>"><span>Sepetim</span></a></li>         
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

   


   
case 'order':

    $orders = $db->prepare("SELECT * FROM siparisler
        INNER JOIN durumkodlari ON durumkodlari.durumkodu = siparisler.siparisdurum
    WHERE siparisbayi=:b");
    $orders->execute([':b' => $kcode]);

    ?>
        <div class="shop-content mt-tab-30 mb-30 mb-lg-0">
    <div class="product-option mb-30 clearfix">
        <!-- Nav tabs -->
        <ul class="nav d-block shop-tab">
            <li>Siparişlerim ( <?php echo $orders->rowCount(); ?> )</li>
        </ul>
    </div>
    <!-- Tab panes -->
    
    <div class="login-area">
    <div class="container">
        <div class="row">
                
            <div class="table-responsive">

                <?php 
                   
                    if($orders->rowCount()){
                        
                    
                ?>
                <table class="table table-hover" id="b2btable">
                    <thead>
                        <tr>
                        <th>KOD</th>
                        <th>DURUM</th>
                        <th>TUTAR</th>
                        <th>ÖDEME TÜRÜ</th>
                        <th>TARİH</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($orders as $order){ ?>
                            <tr>
                                <td><a href="<?php echo site."/profilim?process=orderdetail&code=".$order['sipariskodu']; ?>" title="Sipariş detayı"><?php echo $order['sipariskodu'];?></a></td>
                                <td><?php echo $order['durumbaslik'];?></td>
                                <td><?php echo $order['siparistutar'];?> ₺</td>
                                <td><?php echo $order['siparisodeme'] == 1 ? 'Havale' : 'Kredi Kartı';?></td>
                                <td><?php echo dt($order['siparistarih'])." | ".$order['siparissaat'];?></td>

                            </tr>        
                        <?php } ?>
                    </tbody>
                </table>
                    
                <?php }else{
                    alert('Siparişiniz bulunmuyor','danger');
                } ?>
            </div>

        </div>
    </div>
    </div>
        

    <!-- Pagination start -->
    
    <!-- Pagination end -->
</div>
    <?php 
break;


case 'orderdetail':

    $code   = get('kcode');
    if(!$code){
        go(site);
    }

    $orders = $db->prepare("SELECT * FROM siparis_urunler
        INNER JOIN siparisler ON siparisler.sipariskodu = siparis_urunler.sipkodu
    WHERE siparisbayi=:b AND sipariskodu=:kcode");
    $orders->execute([':k' => $kcode,':kcode' => $code]);

    ?>
        <div class="shop-content mt-tab-30 mb-30 mb-lg-0">
    <div class="product-option mb-30 clearfix">
        <!-- Nav tabs -->
        <ul class="nav d-block shop-tab">
            <li><?php echo $code." nolu siparişime ait ürünler (".$orders->rowCount().")";?></li>
            <li><a href='<?php echo site;?>/profile?process=order' style="font-size:14px">Listeye dön</a></li>
        </ul>
    </div>
    <!-- Tab panes -->
    
    <div class="login-area">
    <div class="container">
        <div class="row">
                
            <div class="table-responsive">

                <?php 
                   
                    if($orders->rowCount()){
                        
                    
                ?>
                <table class="table table-hover" id="b2btable">
                    <thead>
                        <tr>
                        <th>ÜRÜN ADI</th>
                        <th>ÜRÜN FİYAT</th>
                        <th>ÜRÜN ADET</th>
                        <th>TOPLAM FİYAT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($orders as $order){ ?>
                            <tr>
                                
                                <td><?php echo $order['sipurunadi'];?></td>
                                <td><?php echo $order['sipbirim'];?> ₺</td>
                                <td><?php echo $order['sipadet'];?></td>
                                <td><?php echo $order['siptoplam'];?> ₺</td>

                            </tr>        
                        <?php } ?>
                    </tbody>
                </table>
                    
                <?php }else{
                    alert('Siparişinize ait ürün bulunmuyor','danger');
                } ?>
            </div>

        </div>
    </div>
    </div>
        

    <!-- Pagination start -->
    
    <!-- Pagination end -->
</div>
    <?php 
break;


case 'addressdelete':
    $id = get('kullanici_id');
    if(!$id){
        go(site);
    }

    $query = $db->prepare("SELECT * FROM bayi_adresler
    WHERE adresbayi=:b AND id=:id");
    $query->execute([':k' => $kcode,':id' => $id]);

    if($query->rowCount()){

        $delete = $db->prepare("UPDATE bayi_adresler SET adresdurum=:d WHERE adresbayi=:b AND id=:id");
        $delete->execute([':d'=>2,':b' => $bcode,':id' => $id]);
        if($delete){
            alert("Adres pasife alındı","success");
            go(site."/profile?process=address",2);
        }else{
            alert("Hata oluştu","danger");
        }

    }else{
        go(site);
    }
break;


case 'newaddress':
?>


<form action="" method="POST" onsubmit="return false;" id="newaddressform">	
<div class="customer-login text-left">
    <h4 class="title-1 title-border text-uppercase mb-30">YENİ ADRES EKLE</h4>
    <input type="text" placeholder="Adres başlık" name="title">
    <input type="text" placeholder="Adres tarif" name="content">
    <button type="submit" onclick="newaddress();" id="newaddres" class="button-one submit-button mt-15">ADRES EKLE</button>
</div>		
</form>


<?php 
break;

case 'addressedit':

    $id = get('id');
    if(!$id){
        go(site);
    }

    $query = $db->prepare("SELECT * FROM bayi_adresler
    WHERE adresbayi=:b AND id=:id");
    $query->execute([':b' => $bcode,':id' => $id]);
    if($query->rowCount()){

        $row = $query->fetch(PDO::FETCH_OBJ);

       
        ?>  

<form action="" method="POST" onsubmit="return false;" id="addressform">	
		<div class="customer-login text-left">
			<h4 class="title-1 title-border text-uppercase mb-30"><?php echo $row->adresbaslik;?> | ADRESİNİ DÜZENLE</h4>
			<input type="text" value="<?php echo $row->adresbaslik;?>" placeholder="Adres başlık" name="title">
			<input type="text" value="<?php echo $row->adrestarif;?>" placeholder="Adres tarif" name="content">

            <select name="status">
                <option value="1" <?php echo $row->adresdurum == 1 ? 'selected' : null;?>>Aktif</option>
                <option value="2" <?php echo $row->adresdurum == 2 ? 'selected' : null;?>>Pasif</option>
            </select>
            <input type="hidden" value="<?php echo $row->id;?>" name="addressid" />
			<button type="submit" onclick="addressbutton();" id="addressbuton" class="button-one submit-button mt-15">ADRES GÜNCELLE</button>
		</div>		
		</form>

        <?php 

    }else{
        go(site);
    
    }

break;

case 'address':

    $address = $db->prepare("SELECT * FROM bayi_adresler
    WHERE adresbayi=:b");
    $address->execute([':b' => $bcode]);

    ?>
        <div class="shop-content mt-tab-30 mb-30 mb-lg-0">
    <div class="product-option mb-30 clearfix">
        <!-- Nav tabs -->
        <ul class="nav d-block shop-tab">
            <li>Adreslerim ( <?php echo $address->rowCount(); ?> ) | </li>
            <li><a href="<?php echo site;?>/profile?process=newaddress">[Yeni Adres Ekle]</a></li>
        </ul>
    </div>
    <!-- Tab panes -->
    
    <div class="login-area">
    <div class="container">
        <div class="row">
                
            <div class="table-responsive">

                <?php 
                   
                    if($address->rowCount()){
                        
                    
                ?>
                <table class="table table-hover" id="b2btable">
                    <thead>
                        <tr>
                        <th>ID</th>
                        <th>BAŞLIK</th>
                        <th>AÇIK ADRES</th>
                        <th>DURUM</th>
                        <th>İŞLEM</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($address as $order){ ?>
                            <tr>
                                
                                <td><?php echo $order['id'];?></td>
                                <td><?php echo $order['adresbaslik'];?></td>
                                <td><?php echo $order['adrestarif'];?></td>
                                <td><?php echo $order['adresdurum'] == 1 ? 'Aktif' : 'Pasif';?>
                                <td>
                                    <a href="<?php echo site;?>/profile?process=addressedit&id=<?php echo $order['id'];?>" title="Adres düzenle"><i style="font-size:20px" class="zmdi zmdi-edit"></i></a>
                                    |
                                    <a href="<?php echo site;?>/profile?process=addressdelete&id=<?php echo $order['id'];?>"  title="Adresi pasife al"><i style="font-size:20px" class="zmdi zmdi-close"></i></a>
                                </td>
                            </td>

                            </tr>        
                        <?php } ?>
                    </tbody>
                </table>
                    
                <?php }else{
                    alert('Adres bulunmuyor','danger');
                } ?>
            </div>

        </div>
    </div>
    </div>
        

    <!-- Pagination start -->
    
    <!-- Pagination end -->
</div>
    <?php 
break;

case 'uyeprofil';
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

            <label>Kullanıcı Kodu:</label>
            <input type="text" disabled value="<?php echo $kcode;?>" name="eposta">

            <label>Kullanıcı Adı:</label>
            <input type="text"value="<?php echo $kname;?>" name="kname" placeholder="Kullanıcı adı ">

            <label>Kullanıcı Mail:</label>
            <input type="text"value="<?php echo $kmail;?>" name="kmail" placeholder="Kullanıcı mail ">

            <label>Kullanıcı Telefon:</label>
            <input type="text"value="<?php echo $kphone;?>" name="kphone" placeholder="Kullanıcı telefon ">

           
            
            
            
            <button type="submit" onclick="uyeprofilbutton();" id="profilebuton" class="button-one submit-button mt-15">PROFİLİMİ GÜNCELLE</button>
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
<!-- PRODUCT-AREA END -->
<?php require_once 'inc/footer.php'; ?>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

<script>
$(document).ready(function() {
    $('#b2btable').DataTable();
} );
</script>