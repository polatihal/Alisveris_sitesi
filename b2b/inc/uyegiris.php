<?php 

require_once '../system/function.php';

if( @$_SESSION['kullanici'] == @sha1(md5(IP().$kcode)) ){
    go(site);
}


if($_POST){

   
    $eposta    = post('eposta');
    $kpass  = post('kpass');
    $crypto = sha1(md5($kpass));

    if(!$eposta || !$kpass){
        echo 'empty';
    }else{

        $login = $db->prepare("SELECT * FROM kullanicilar WHERE (kullanici_adi=:k AND parola=:p) OR (email=:e AND parola=:pp)");

        $login->execute([
            ':k' => $eposta,
            ':p' => $crypto,
            ':e' => $eposta,
            ':pp'=> $crypto
        ]);

       
        if($login->rowCount()){

            $parr = $login->fetch(PDO::FETCH_OBJ);
            if($parr->kullanicidurum == 1){

                $log = $db->prepare("INSERT INTO kullanicilog SET
                    logkullanici    =:kl,
                    logkullanici_ip       =:i,
                    aciklamalog =:a
                ");
                $log->execute([
                    ':kl'   => $parr->kullanici_kodu,
                    ':i'   => IP(),
                    ':a'   => "Giriş yapıldı"
                ]);

                $encode = sha1(md5(IP().$parr->kullanici_kodu));
                $_SESSION['kullanici'] = $encode;
                $_SESSION['kullanici_id']    = $parr->kullanici_id;
                $_SESSION['kcode']  = $parr->kullanici_kodu;

               echo 'ok';

             

            }else{
                echo 'passive';
            }

        }else{
            echo 'error';
        }

    }


        }
    





?>