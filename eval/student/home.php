<?php include('db_connect.php');
function ordinal_suffix1($num){
    $num = $num % 100; // protect against large numbers
    if($num < 11 || $num > 13){
         switch($num % 10){
            case 1: return $num;
            case 2: return $num;
            case 3: return $num;
        }
    }
    return $num;
}
$astat = array("Chưa được bắt đầu","Đang diễn ra","Đóng");
 ?>

<div class="col-12">
    <div class="card">
      <div class="card-body">
        Xin chào <?php echo $_SESSION['login_name'] ?>!
        <br>
        <div class="col-md-5">
          <div class="callout callout-info">
            <h5><b>Năm học: <?php echo $_SESSION['academic']['year'].' - Học kì '.(ordinal_suffix1($_SESSION['academic']['semester'])) ?></b></h5>
            <h6><b>Trạng thái đánh giá: <?php echo $astat[$_SESSION['academic']['status']] ?></b></h6>
          </div>
        </div>
      </div>
    </div>
</div>
