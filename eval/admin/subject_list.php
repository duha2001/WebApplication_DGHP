<?php include'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<div class="card-tools">
				<a class="btn btn-block btn-sm btn-default btn-flat border-primary new_subject" href="javascript:void(0)"><i class="fa fa-plus"></i> Thêm mới</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table tabe-hover table-bordered" id="list">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="30%">
					<col width="37%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Mã học phần</th>
						<th>Tên học phần</th>
						<th>Mô tả học phần</th>
						<th>Trạng thái</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT * FROM subject_list order by subject asc ");
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>
						<td><b><?php echo $row['code'] ?></b></td>
						<td><b><?php echo $row['subject'] ?></b></td>
						<td><b><?php echo $row['description'] ?></b></td>
						<td class="text-center">
		                    <div class="btn-group">
		                        <a href="javascript:void(0)" data-id='<?php echo $row['id'] ?>' class="btn btn-primary btn-flat manage_subject">
		                          <i class="fas fa-edit"></i>
		                        </a>
		                        <button type="button" class="btn btn-danger btn-flat delete_subject" data-id="<?php echo $row['id'] ?>">
		                          <i class="fas fa-trash"></i>
		                        </button>
	                      </div>
						</td>
					</tr>	
				<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.new_subject').click(function(){
			uni_modal("Thêm học phần","<?php echo $_SESSION['login_view_folder'] ?>manage_subject.php")
		})
		$('.manage_subject').click(function(){
			uni_modal("Chỉnh sửa học phần","<?php echo $_SESSION['login_view_folder'] ?>manage_subject.php?id="+$(this).attr('data-id'))
		})
	$('.delete_subject').click(function(){
	_conf("Bạn có chắc chắn muốn xóa học phần ?","delete_subject",[$(this).attr('data-id')])
	})
		$('#list').dataTable()
	})
	function delete_subject($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_subject',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Dữ liệu được xóa thành công.",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>