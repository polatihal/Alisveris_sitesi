<?php 

$process = @get('process');
if(!$process){
go(admin);
}

switch($process){




case 'yeni':


if(isset($_POST['add'])){

$pname   = post('pname');
$purl    = post('purl');
if(!$purl){
$sef = sef_link($pname);
}else{
$sef = $purl;
}
$pcat    = post('pcat');
$pcode   = post('pcode');
$pprice  = post('pprice');
$pstock  = post('pstock');
$pseok   = post('pseok');
$pseod   = post('pseod');
$pv      = post('pv');
$pcontent   = $_POST['pcontent'];

if(!$pname  || !$pcat || !$pcode || !$pprice || !$pstock || !$pseok || !$pseod || !$pv || !$pcontent){
alert("Tüm alanları doldurunuz","danger");
}else{

$already = $db->prepare("SELECT urunsef,urunkodu FROM urunler WHERE urunsef=:k OR urunkodu=:kk");
$already->execute([':k' => $sef,':kk'=>$pcode]);
if($already->rowCount()){
alert("Bu ürün koduna ya da ürün seflinkine ait ürün zaten kayıtlı","danger");
}else{

require_once 'inc/class.upload.php';
$image = new upload($_FILES['pimage']);
if($image->uploaded){

    $rname = $sef."-".uniqid();
    $image->allowed = array("image/*");
    $image->image_convert = 'webp';
    $image->file_new_name_body = $rname;
    $image->file_max_size      = 1024 * 1024; //max 1 mb
    $image->process("../uploads/product/");

    if($image->processed){

        $add  = $db->prepare("INSERT INTO urunler SET
            urunkat     =:k,
            urunbaslik  =:b,
            urunsef     =:s,
            urunicerik  =:i,
            urunkapak   =:ka,
            urunfiyat   =:f,
            urunkodu    =:ko,
            urunstok    =:st,
            urunkeyw    =:ke,
            urundesc    =:de,
            urunekleyen =:ek,
            urunvitrin  =:vi
        ");

        $result = $add->execute([
            
            ':k'  => $pcat,
            ':b'  => $pname,
            ':s'  => $sef,
            ':i'  => $pcontent,
            ':ka' => $rname.'.webp',
            ':f'  => $pprice,
            ':ko' => $pcode,
            ':st' => $pstock,
            ':ke' => $pseok,
            ':de' => $pseod,
            ':ek' => $aid,
            ':vi' => $pv,

        ]);

        if($result){

            alert("Ürün eklendi","success");
            go(admin."/products.php",2);

        }else{
            alert("Hata oluştu","danger");
            print_r($add->errorInfo());
        }

    }else{
        alert("Resim yüklenemedi","danger");
        print_r($image->error);
    }

}else{
    alert("Resim seçmediniz","danger");
    print_r($image->error);
}



}

}

}

}
?>