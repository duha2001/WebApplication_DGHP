<?php
include 'db_connect.php';
?>
<div class="col-lg-12">
    <div class="card card-outline card-primary">
        <div class="card-header">
            <div class="card-tools">
                <a class="btn btn-block btn-sm btn-default btn-flat border-primary new_academic" href="javascript:void(0)"><i class="fa fa-plus"></i> Thêm mới</a>
            </div>
        </div>
        <div class="card-body">
            <table class="table tabe-hover table-bordered" id="list">
                <colgroup>
                    <col width="5%">
                    <col width="25%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th>Năm học</th>
                        <th>Học kì</th>
                        <th>Mặc định hệ thống</th>
                        <th>Tình trạng</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
$i   = 1;
$qry = $conn->query("SELECT * FROM academic_list order by abs(year) desc,abs(semester) desc ");
while ($row = $qry->fetch_assoc()):
?>
                   <tr>
                        <th class="text-center"><?php
    echo $i++;
?></th>
                        <td><b><?php
    echo $row['year'];
?></b></td>
                        <td><b><?php
    echo $row['semester'];
?></b></td>
                        <td class="text-center">
                            <?php
    if ($row['is_default'] == 0):
?>
                               <button type="button" class="btn btn-secondary bg-gradient-secondary col-sm-4 btn-flat btn-sm px-1 py-0 make_default" data-id="<?php
        echo $row['id'];
?>">No</button>
                            <?php
    else:
?>
                               <button type="button" class="btn btn-primary bg-gradient-primary col-sm-4 btn-flat btn-sm px-1 py-0">Yes</button>
                            <?php
    endif;
?>
                       </td>
                        <td class="text-center">
                            <?php
    if ($row['status'] == 0):
?>
                               <span class="badge badge-secondary">Chưa bắt đầu</span>
                            <?php
    elseif ($row['status'] == 1):
?>
                               <span class="badge badge-success">Đang diễn ra</span>
                            <?php
    elseif ($row['status'] == 2):
?>
                               <span class="badge badge-primary">Đã đóng</span>
                            <?php
    endif;
?>
                       </td>

                        <td class="text-center">
                            <div class="btn-group">
                                <a href="javascript:void(0)" data-id='<?php
    echo $row['id'];
?>' class="btn btn-primary btn-flat manage_academic">
                                  <i class="fas fa-edit"></i>
                                </a>
                                <button type="button" class="btn btn-danger btn-flat delete_academic" data-id="<?php
    echo $row['id'];
?>">
                                  <i class="fas fa-trash"></i>
                                </button>
                          </div>
                        </td>
                    </tr>    
                <?php
endwhile;
?>
               </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.new_academic').click(function(){
            uni_modal("Thêm khóa học","<?php
echo $_SESSION['login_view_folder'];
?>manage_academic.php")
        })
        $('.manage_academic').click(function(){
            uni_modal("Chỉnh sửa khóa học","<?php
echo $_SESSION['login_view_folder'];
?>manage_academic.php?id="+$(this).attr('data-id'))
        })
        $('.delete_academic').click(function(){
        _conf("Bạn có chắc chắn xóa khóa học này?","delete_academic",[$(this).attr('data-id')])
        })
        $('.make_default').click(function(){
        _conf("Bạn có chắc chắn đặt năm học này làm hệ thống mặt định không?","make_default",[$(this).attr('data-id')])
        })
        $('#list').dataTable()
    })
    function delete_academic($id){
        start_load()
        $.ajax({
            url:'ajax.php?action=delete_academic',
            method:'POST',
            data:{id:$id},
            success:function(resp){
                if(resp==1){
                    alert_toast("Dữ liệu được cập nhập thành công",'success')
                    setTimeout(function(){
                        location.reload()
                    },1500)

                }
            }
        })
    }
    function make_default($id){
        start_load()
        $.ajax({
            url:'ajax.php?action=make_default',
            method:'POST',
            data:{id:$id},
            success:function(resp){
                if(resp==1){
                    alert_toast("Năm học được cập nhập",'success')
                    setTimeout(function(){
                        location.reload()
                    },1500)
                }
            }
        })
    }
</script>