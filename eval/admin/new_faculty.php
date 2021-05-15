<?php
?>
<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<form action="" id="manage_faculty">
				<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
				<div class="row">
					<div class="col-md-6 border-right">
						<div class="form-group">
							<label for="" class="control-label">Mã số GV</label>
							<input type="text" name="school_id" class="form-control form-control-sm" required value="<?php echo isset($school_id) ? $school_id : '' ?>"placeholder="VD: 001,002,003,..." required>
						</div>
						<div class="form-group">
							<label for="" class="control-label">Họ và tên lót GV</label>
							<input type="Có thể bỏ trống" name="firstname" class="form-control form-control-sm" required value="<?php echo isset($firstname) ? $firstname : '' ?>"placeholder="Trần Văn, Huỳnh Anh, ...." required>
						</div>
						<div class="form-group">
							<label for="" class="control-label">Tên GV</label>
							<input type="text" name="lastname" class="form-control form-control-sm" required value="<?php echo isset($lastname) ? $lastname : '' ?>" placeholder="VD: A, B, C, D,..." required>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="" class="control-label">Ảnh nền</label>
							<div class="custom-file">
		                      <input type="file" class="custom-file-input" id="customFile" name="img" onchange="displayImg(this,$(this))">
		                      <label class="custom-file-label" for="customFile">Chọn file</label>
		                    </div>
						</div>
						<div class="form-group d-flex justify-content-center align-items-center">
							<img src="<?php echo isset($avatar) ? 'assets/uploads/'.$avatar :'' ?>" alt="Avatar" id="cimg" class="img-fluid img-thumbnail ">
						</div>
						<div class="form-group">
							<label class="control-label">Email</label>
							<input type="email" class="form-control form-control-sm" name="email" required value="<?php echo isset($email) ? $email : '' ?>"placeholder="VD: khoacntt@hcmue.edu.vn, anhdu2001@gmail.com, ...." required>
							<small id="#msg"></small>
						</div>
						<div class="form-group">
							<label class="control-label">Mật khẩu</label>
							<input type="password" class="form-control form-control-sm" name="password" <?php echo !isset($id) ? "required":'' ?>>
							<small><i><?php echo isset($id) ? "Để trống nếu không muốn thay đổi mật khẩu":'' ?></i></small>
						</div>
						<div class="form-group">
							<label class="label control-label">Nhập lại mật khẩu</label>
							<input type="password" class="form-control form-control-sm" name="cpass" <?php echo !isset($id) ? 'required' : '' ?>>
							<small id="pass_match" data-status=''></small>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-lg-12 text-right justify-content-center d-flex">
					<button class="btn btn-primary mr-2">Lưu</button>
					<button class="btn btn-secondary" type="button" onclick="location.href = 'index.php?page=faculty_list'">Thoát</button>
				</div>
			</form>
		</div>
	</div>
</div>
<style>
	img#cimg{
		height: 15vh;
		width: 15vh;
		object-fit: cover;
		border-radius: 100% 100%;
	}
</style>
<script>
	$('[name="password"],[name="cpass"]').keyup(function(){
		var pass = $('[name="password"]').val()
		var cpass = $('[name="cpass"]').val()
		if(cpass == '' ||pass == ''){
			$('#pass_match').attr('data-status','')
		}else{
			if(cpass == pass){
				$('#pass_match').attr('data-status','1').html('<i class="text-success">Mật khẩu trùng khớp.</i>')
			}else{
				$('#pass_match').attr('data-status','2').html('<i class="text-danger">Mật khẩu không trùng khớp.</i>')
			}
		}
	})
	function displayImg(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#manage_faculty').submit(function(e){
		e.preventDefault()
		$('input').removeClass("border-danger")
		start_load()
		$('#msg').html('')
		if($('[name="password"]').val() != '' && $('[name="cpass"]').val() != ''){
			if($('#pass_match').attr('data-status') != 1){
				if($("[name='password']").val() !=''){
					$('[name="password"],[name="cpass"]').addClass("border-danger")
					end_load()
					return false;
				}
			}
		}
		$.ajax({
			url:'ajax.php?action=save_faculty',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp == 1){
					alert_toast('Dữ liệu được cập nhập thành công.',"success");
					setTimeout(function(){
						location.replace('index.php?page=faculty_list')
					},750)
				}else if(resp == 2){
					$('#msg').html("<div class='alert alert-danger'>Email đã tồn tại.</div>");
					$('[name="email"]').addClass("border-danger")
					end_load()
				}else if(resp == 3){
					$('#msg').html("<div class='alert alert-danger'>Mã số Khoa đã tồn tại.</div>");
					$('[name="school_id"]').addClass("border-danger")
					end_load()
				}
			}
		})
	})
</script>