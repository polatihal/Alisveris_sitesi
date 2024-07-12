<?php
define('security',true);
session_start();
require_once 'inc/header.php'; 

if( @$_SESSION['kullanici'] == @sha1(md5(IP().$kcode)) ){
    go(site);
}
?>

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
			<h2> KULLANICI GİRİŞ / KAYIT</h2>
		</div>
		<div class="breadcumbs pb-15">
			<ul>
				<li><a href="<?php echo site;?>">ANA SAYFA</a></li>
				<li> KULLANICI GİRİŞ / KAYIT</li>
			</ul>
		</div>
	</div>
</div>
</div>
</div>
</div>
<!-- HEADING-BANNER END -->
<!-- SHOPPING-CART-AREA START -->
<div class="login-area  pt-80 pb-80">
<div class="container">
<div class="row">



	<div class="col-lg-6">

	<form action="" method="POST" onsubmit="return false;" id="kloginform">	
		<div class="customer-login text-left">
			<h4 class="title-1 title-border text-uppercase mb-30">KULLANICI GİRİŞ</h4>
			<input type="text" placeholder="E-posta ya da kullanıcı adı" name="eposta">
			<input type="password" placeholder="Kullanıcı şifre" name="kpass">
			
			<p><a href="<?php echo site;?>/password-recovery" class="text-gray">Şifremi unuttum</a></p>
			<button type="submit" onclick="kloginbutton();" id="kloginbuton" class="button-one submit-button mt-15">GİRİŞ YAP</button>
		</div>		
		</form>			
	</div>




		<div class="col-lg-6">

			<form action="" method="POST" onsubmit="return false;" id="kregisterform">	

			<div class="customer-login text-left">
				<h4 class="title-1 title-border text-uppercase mb-30">KULLANICI KAYIT</h4>
			
				<input type="text" placeholder="Kullanıcı Adı" name="kname">
				<input type="text" placeholder="Kullanıcı e-posta" name="kmail">
				<input type="password" placeholder="Kullanıcı şifresi" name="kpass">
				<input type="password" placeholder="Kullanıcı şifresi tekrar" name="kpass2">
				<input type="text" placeholder="Kullanıcı telefon" name="kphone">
				

				<button type="submit" id="kregisterbuton" onclick="kregisterbutton();" class="button-one submit-button mt-15">KAYIT OL</button>
			</div>
			</form>
			
			
		</div>
	


</div>

</div>
</div>
<!-- SHOPPING-CART-AREA END -->
<!-- FOOTER START -->
<?php require_once 'inc/footer.php'; ?>
