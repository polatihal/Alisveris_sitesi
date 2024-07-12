<?php
define('security', true);

require_once 'inc/header.php';

if (@$_SESSION['login'] != @sha1(md5(IP() . $bcode))) {
    go(site);
}
?>



<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" />
<style>
    .pagination {
        background: transparent !important;
        display: flex !important;
        padding: 20px !important;

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
    <div class="heading-banner-area overlay-bg" style="background: rgba(0, 0, 0, 0) url(<?php echo site; ?>/uploads/general.webp) no-repeat scroll center center / cover;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-banner">
                        <div class="heading-banner-title">
                            <h2>Bayi Profil</h2>
                        </div>
                        <div class="breadcumbs pb-15">
                            <ul>
                                <li><a href="#">Ana Sayfa</a></li>
                                <li>Bayi Profil</li>
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
                <?php

                if (isset($_POST['add'])) {

                    $pname   = post('pname');
                    $purl    = post('purl');
                    if (!$purl) {
                        $sef = sef_link($pname);
                    } else {
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

                    if (!$pname  || !$pcat || !$pcode || !$pprice || !$pstock || !$pseok || !$pseod || !$pv || !$pcontent) {
                        alert("Tüm alanları doldurunuz", "danger");
                    } else {

                        $already = $db->prepare("SELECT urunsef,urunkodu FROM urunler WHERE urunsef=:k OR urunkodu=:kk");
                        $already->execute([':k' => $sef, ':kk' => $pcode]);
                        if ($already->rowCount()) {
                            alert("Bu ürün koduna ya da ürün seflinkine ait ürün zaten kayıtlı", "danger");
                        } else {

                            require_once 'inc/class.upload.php';
                            $image = new upload($_FILES['pimage']);
                            if ($image->uploaded) {

                                $rname = $sef . "-" . uniqid();
                                $image->allowed = array("image/*");
                                $image->image_convert = 'webp';
                                $image->file_new_name_body = $rname;
                                $image->file_max_size      = 1024 * 1024; //max 1 mb
                                $image->process("../uploads/product/");

                                if ($image->processed) {

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
                                        ':ka' => $rname . '.webp',
                                        ':f'  => $pprice,
                                        ':ko' => $pcode,
                                        ':st' => $pstock,
                                        ':ke' => $pseok,
                                        ':de' => $pseod,
                                        ':ek' => $aid,
                                        ':vi' => $pv,

                                    ]);

                                    if ($result) {

                                        alert("Ürün eklendi", "success");
                                        go(admin . "/products.php", 2);
                                    } else {
                                        alert("Hata oluştu", "danger");
                                        print_r($add->errorInfo());
                                    }
                                } else {
                                    alert("Resim yüklenemedi", "danger");
                                    print_r($image->error);
                                }
                            } else {
                                alert("Resim seçmediniz", "danger");
                                print_r($image->error);
                            }
                        }
                    }
                }


                ?>

                <div style="background-color: white;" class="tile">
                    <h3 style="padding-left:25px; padding-top:20px;" class="tile-title">Yeni Ürün Ekle</h3>
                    <form action="" method="POST" enctype="multipart/form-data">
                        <div style="margin: 25px;" class="tile-body">

                            <div class="form-group">
                                <label class="control-label">Ürün Adı</label>
                                <input class="form-control" name="pname" type="text" placeholder="Ürün Adı">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün SEO URL (örn: asus-pc-i5)</label>
                                <input class="form-control" name="purl" type="text" placeholder="Ürün SEO URL">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün Kategorisi</label>
                                <select name="pcat" class="form-control">
                                    <option value="0">Kategori seçiniz</option>
                                    <?php
                                    $cat = $db->prepare("SELECT * FROM urun_kategoriler WHERE katdurum=:d");
                                    $cat->execute([':d' => 1]);
                                    if ($cat->rowCount()) {
                                        foreach ($cat as $ca) {
                                            echo '<option value="' . $ca['id'] . '">' . $ca['katbaslik'] . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün Kodu</label>
                                <input class="form-control" name="pcode" type="text" placeholder="Ürün Kodu">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün Kapak Resim</label>
                                <input class="form-control" type="file" name="pimage">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün Stok Adet</label>
                                <input class="form-control" name="pstock" type="number" placeholder="Ürün Stok Adet">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Ürün Fiyat</label>
                                <input class="form-control" name="pprice" type="text" placeholder="Ürün fiyat">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün SEO Keywords</label>
                                <input class="form-control" name="pseok" type="text" placeholder="Ürün SEO Keywords">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün SEO Description</label>
                                <input class="form-control" name="pseod" type="text" placeholder="Ürün SEO Description">
                            </div>

                            <div class="form-group">
                                <label class="control-label">Ürün İçerik</label>
                                <textarea class="ckeditor" name="pcontent"></textarea>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Vitrin Durumu</label>
                                <select name="pv" class="form-control">
                                    <option value="0">Vitrin durumu seçiniz</option>
                                    <option value="1">Vitrinde görünsün</option>
                                    <option value="2">Kategori listesinde görünsün</option>
                                </select>
                            </div>




                        </div>
                        <div class="tile-footer">
                            <button class="btn btn-primary" name="add" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Kayıt Ekle</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="<?php echo admin; ?>/products.php"><i class="fa fa-fw fa-lg fa-times-circle"></i>Listeye Dön</a>
                        </div>


                    </form>

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
        });
    </script>