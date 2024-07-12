<?php 

require_once '../system/function.php';

if( @$_SESSION['login'] == @sha1(md5(IP().$bcode)) ){
    go(site);
}

if($_POST){

    $bcode    = post('bcode');
    $bmail    = post('bec');
    $code     = uniqid('yavuzselim_');
    $codelink = site."/recovery-password/".$code;

    if(!$bcode || !$bmail){
        echo 'empty';
    }else{

        $row = $db->prepare("SELECT * FROM bayiler WHERE bayikodu=:k AND bayimail=:m");
        $row->execute([':k' => $bcode,':m' => $bmail]);
        if($row->rowCount()){

            $up = $db->prepare("UPDATE bayiler SET sifirlamakodu=:s WHERE bayikodu=:k AND bayimail=:m");
            $up->execute([':s' => $code,':k'=>$bcode,':m'=>$bmail]);

            require_once 'class.phpmailer.php';
            require_once 'class.smtp.php';

            $mail = new PHPMailer();
            $mail->Host       = $arow->smtphost;
            $mail->Port       = $arow->smtpport;
            $mail->SMTPSecure = $arow->smtpsec;
            $mail->Username   = $arow->smtpmail;
            $mail->Password   = $arow->smtpsifre;
            $mail->SMTPAuth   = true;
            $mail->IsSMTP();
            $mail->AddAddress($bmail);

            $mail->From       = $arow->smtpmail;
            $mail->FromName   = "Yavuz B2B | Şifre Sıfırlama";
            $mail->CharSet    = 'UTF-8';
            $mail->Subject    = "Şifre sıfırlama linkiniz";
            $mailcontent      = "
            <p>Şifrenizi sıfırlamak için lütfen aşağıda yer alan linke tıklayınız</p>
            <p><b>Sıfırlama linki :</b>".$codelink."</p>
            ";

            $mail->MsgHTML($mailcontent);
            if($mail->Send()){
                echo 'ok';
            }
            

        }else{
            echo 'error';
        }

    }

}


?>