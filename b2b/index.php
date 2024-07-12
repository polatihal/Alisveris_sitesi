<?php 
define('security',true);
require_once 'inc/header.php'; ?>
<!-- WRAPPER START -->
<div class="wrapper bg-dark-white">

<!-- HEADER-AREA START -->
<?php require_once 'inc/menu.php'; ?>
<!-- HEADER-AREA END -->
<!-- Mobile-menu start -->
<?php require_once 'inc/mobilemenu.php'; ?>
<!-- Mobile-menu end -->
<!-- HEADING-BANNER START --> 
<style>
body {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
 
.fadein { 
position:relative; height:350px; width:100%px; margin:0 auto;
background: whitesmoke;
padding: 4px;
 }
.fadein img{
	position:absolute;
	width: 100%;
    height: 360px;
    object-fit: scale-down;
}
</style>
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$(function(){
	$('.fadein img:gt(0)').hide();
	setInterval(function(){$('.fadein :first-child').fadeOut().next('img').fadeIn().end().appendTo('.fadein');}, 3000);
});
</script>
<div class="fadein">
<?php 
// display images from directory
// directory path
$dir = "./uploads/slider/";
 
$scan_dir = scandir($dir);
foreach($scan_dir as $img):
	if(in_array($img,array('.','..')))
	continue;
?>
<img src="<?php echo $dir.$img ?>" alt="<?php echo $img ?>">
<?php endforeach; ?>
</div>

<nav style="padding-top: 20px; " class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li   style="padding-left: 50px; margin-left:213px;" class="nav-item">
        <a class="nav-link " href="category/elektronik-esya"> <strong>Elektronik</strong> </a>
      </li>
     <li  style="padding-left: 50px;" class="nav-item">
        <a class="nav-link" href="category/moda-giyim"> <strong>Moda</strong> </a>
      </li>
      <li  style="padding-left: 50px;" class="nav-item">
        <a class="nav-link" href="category/ev-yasam-kirtasiye"> <strong>Ev,Yaşam,Kırtasiye</strong> </a>
      </li>
	  <li  style="padding-left: 50px;" class="nav-item">
        <a class="nav-link" href="category/bahce-yapi-hirdavat"> <strong>Bahçe,Yapı,Hırdavat</strong> </a>
      </li>
	  <li  style="padding-left: 50px;" class="nav-item">
        <a class="nav-link" href="category/kozmetik-kisiselbakim"> <strong>Kozmetik,Kişisel bakım</strong> </a>
      </li>
	  <li  style="padding-left: 50px;" class="nav-item">
        <a class="nav-link" href="category/kitap-film-hobi"> <strong>Kitap,Film,Hobi</strong> </a>
      </li>
	  
      
    </ul>
  </div>
</nav>







<!-- HEADING-BANNER END -->
<!-- PRODUCT-AREA START -->
<div class="product-area pt-20 pb-80 product-style-2">
<div  style="max-width: 1600px;" class="container">
<div class="row">

<?php require_once 'inc/sidebar.php'; ?>

<?php 

	$s = @intval(get('s'));
	if(!$s){
		$s = 1;
	}

	$plist = $db->prepare("SELECT * FROM urunler WHERE urundurum=:d AND urunvitrin=:v ORDER BY uruntarih DESC");
	$plist->execute([':d'=>1,':v'=>1]);

	$total = $plist->rowCount();
	$lim   = 9;
	$show  = $s * $lim - $lim;


	$plist = $db->prepare("SELECT * FROM urunler WHERE urundurum=:d AND urunvitrin=:v ORDER BY uruntarih DESC LIMIT :show,:lim");

	$plist->bindValue(':d',(int) 1,PDO::PARAM_INT);
	$plist->bindValue(':v',(int) 1,PDO::PARAM_INT);
	$plist->bindValue(':show',(int) $show,PDO::PARAM_INT);
	$plist->bindValue(':lim',(int) $lim,PDO::PARAM_INT);
	$plist->execute();

	if($s > ceil($total / $lim)){
		$s = 1;
	}





?>

<div  class="col-lg-9 order-1 order-lg-2">
	<!-- Shop-Content End -->
	<div class="shop-content mt-tab-30 mb-30 mb-lg-0">
		<div class="product-option mb-30 clearfix">

			<p class="mb-0">Ürün Listesi (<?php echo $total;?>)</p>

		</div>
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active" id="grid-view">							
				<div class="row">
					
					<?php if($plist->rowCount()){ 
					
					$price  = 0;
					foreach($plist as $row){

					
					if(@$bgift > 0){

						$calc  = $row['urunfiyat'] * $bgift / 100;
						$price = $row['urunfiyat'] - $calc;

					}else{
						$price = $row['urunfiyat'];
					}
					
					?>

					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<span class="pro-price-2"><?php echo $price." ₺";?></span>
								<a href="<?php echo site."/product/".$row['urunsef'];?>">
									<img width="270" height="270" src="<?php echo site."/uploads/product/".$row['urunkapak'];?>" alt="<?php echo $row['urunbaslik'];?>" />
								</a>
							</div>
							<div class="product-info clearfix text-center">
								<div class="fix">
									<h4 class="post-title"><a href="<?php echo site."/product/".$row['urunsef'];?>"><?php echo $row['urunbaslik'];?></a></h4>
								</div>
								<div class="product-action">
									<a href="<?php echo site."/product/".$row['urunsef'];?>"  title="Ürün detayına git"><i class="zmdi zmdi-arrow-right"></i> Ürün Detayı </a>  
								
								
								</div>
							</div>
						</div>
					</div>

					<?php 

					}
					

					}else{ 

						alert('Ürün bulunmuyor','danger');

						}?>

					

				</div>
			</div>
		
		</div>


		<!-- Pagination start -->
		<div class="shop-pagination text-center">
			<div class="pagination">
				<ul>
					<?php 
						if($total > $lim){
							pagination($s, ceil($total/$lim),'?s=');
						}
					?>	
				</ul>
			</div>
		</div>					
		<!-- Pagination end -->


	</div>
	<!-- Shop-Content End -->
</div>
</div>
</div>
</div>
<!-- PRODUCT-AREA END -->


<?php require_once 'inc/footer.php'; ?>
