<?php
include '../db_connect.php';
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM academic_list where id={$_GET['id']}")->fetch_array();
	foreach($qry as $k => $v){
		$$k = $v;
	}
}
?>
<div class="container-fluid">
	<form action="" id="manage-academic">
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div id="msg" class="form-group"></div>
		<div class="form-group">
			<label for="year" class="control-label">Năm học</label>
			<input type="text" class="form-control form-control-sm" name="year" id="year" value="<?php echo isset($year) ? $year : '' ?>" placeholder="(2019-2020)" required>
		</div>
		<div class="form-group">
			<label for="semester" class="control-label">Học kì</label>
			<input type="number" class="form-control form-control-sm" name="semester" id="semester" value="<?php echo isset($semester) ? $semester : '' ?>" required>
		</div>
		<?php if(isset($status)): ?>
		<div class="form-group">
			<label for="" class="control-label">Trạng thái</label>
			<select name="status" id="status" class="form-control form-control-sm">
				<option value="0" <?php echo $status == 0 ? "selected" : "" ?>>Đang chờ xử lí</option>
				<option value="1" <?php echo $status == 1 ? "selected" : "" ?>>Đã bắt đầu</option>
				<option value="2" <?php echo $status == 2 ? "selected" : "" ?>>Đã đóng</option>
			</select>
		</div>
		<?php endif; ?>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('#manage-academic').submit(function(e){
			e.preventDefault();
			start_load()
			$('#msg').html('')
			$.ajax({
				url:'ajax.php?action=save_academic',
				method:'POST',
				data:$(this).serialize(),
				success:function(resp){
					if(resp == 1){
						alert_toast("Dữ liệu cập nhập thành công.","success");
						setTimeout(function(){
							location.reload()	
						},1750)
					}else if(resp == 2){
						$('#msg').html('<div class="alert alert-danger"><i class="fa fa-exclamation-triangle"></i> academic Mã khóa học đã bị trùng.</div>')
						end_load()
					}
				}
			})
		})
	})

</script>