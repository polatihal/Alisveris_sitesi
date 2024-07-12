<?php 

require_once '../system/function.php';

if( @$_SESSION['kullanici'] == @sha1(md5(IP().$kcode)) ){
    go(site);
}
if($_POST){

    $kname  = post('kname');
    $kmail  = post('kmail');
    $kpass  = post('kpass');
    $kpass2 = post('kpass2');
    $kphone = post('kphone');
    

    $kcode  = uniqid();
    $crypto = sha1(md5($kpass));

    if(!$kname || !$kmail ||!$kpass || !$kpass2 || !$kphone ){

        echo 'empty';

    }else{
        if(!filter_var($kmail,FILTER_VALIDATE_EMAIL)){
            echo 'format';
        }else{

            if($kpass != $kpass2){
                echo 'match';
            }else{

                $already = $db->prepare("SELECT email FROM kullanicilar WHERE email=:e");
                $already->execute([':e'=> $kmail]);
                if($already->rowCount()){
                    echo 'already';
                }else{

                    $result = $db->prepare("INSERT INTO kullanicilar SET
                        kullanici_kodu=:kcode,
                        kullanici_adi     =:kname,
                        email    =:kmail,
                        parola   =:kpass,
                        kullanici_telefon =:kphone
                       

                    ");

                    $result->execute([
                        ':kcode' => $kcode,
                        ':kname' => $kname,
                        ':kmail' => $kmail,
                        ':kpass' => $crypto,
                        ':kphone'=> $kphone
                        
                    ]);
                    echo 'ok';
                    

                }
               
            }

        }}}

?>