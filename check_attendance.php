<?php include 'db_connect.php' ?>
<?php

if(isset($_GET['attendance_id'])){
	// echo "SELECT * FROM attendance_list where id = {$_GET['attendance_id']}";
$qry = $conn->query("SELECT * FROM attendance_list where id = {$_GET['attendance_id']}");
foreach($qry->fetch_array() as $k => $v){
	$$k = $v;
}
}

?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header"><b>Check Attendance</b></div>
			<div class="card-body">
				<form id="manage-attendance" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
					<div class="row justify-content-center">
						<label for="" class="mt-2">Class per Subjects</label>
						<div class="col-sm-4">
				            <select name="class_subject_id" id="class_subject_id" class="custom-select select2 input-sm">
				                <option value=""></option>
				                <?php
				                $class = $conn->query("SELECT cs.*,concat(co.course,' ',c.level,'-',c.section) as `class`,s.subject,f.name as fname FROM class_subject cs inner join `class` c on c.id = cs.class_id inner join courses co on co.id = c.course_id inner join faculty f on f.id = cs.faculty_id inner join subjects s on s.id = cs.subject_id ".($_SESSION['login_faculty_id'] ? " where f.id = {$_SESSION['login_faculty_id']} ":"")." order by concat(co.course,' ',c.level,'-',c.section) asc");
				                while($row=$class->fetch_assoc()):
				                ?>
				                <option value="<?php echo $row['id'] ?>" data-cid="<?php echo $row['id'] ?>" <?php echo isset($class_subject_id) && $class_subject_id == $row['id'] ? 'selected' : (isset($class_subject_id) && $class_subject_id == $row['id'] ? 'selected' :'') ?>><?php echo $row['class'].' '.$row['subject']. ' [ '.$row['fname'].' ]' ?></option>
				                <?php endwhile; ?>
				            </select>
						</div>
						<div class="col-sm-3">
							<input type="date" name="doc" value="<?php echo isset($doc) ? date('Y-m-d',strtotime($doc)) :date('Y-m-d') ?>" class="form-control">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12" id='att-list'>
							<center><b><h4><i>Please Select Class First.</i></h4></b></center>
						</div>
						<div class="col-md-12"  style="display: none" id="submit-btn-field">
							<center>
								<button class="btn btn-primary btn-sm col-sm-5">Save</button>
							</center>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="table_clone" style="display: none">
	<table class='table table-bordered table-hover'>
		<thead>
			<tr>
				<th>#</th>
				<th>Student</th>
				<th>Attendance</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<div id="chk_clone" style="display: none">
	<div class="d-flex justify-content-center chk-opts">
		<div class="form-check form-check-inline">
		  <input class="form-check-input absent-inp" id="absent" type="checkbox" value="0">
		  <label class="form-check-label absent-lbl">Absent</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input present-inp" id="present" type="checkbox" value="1">
		  <label class="form-check-label present-lbl">Present</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input late-inp" id="late" type="checkbox" value="2">
		  <label class="form-check-label late-lbl">Late</label>
		</div>
		<div class="form-check form-check-inline remark-div">
		  <input class="form-check-input remark-inp" style="display: none" type="file">
		  <a style="display: none" class="form-check-label remark-lbl" href=''>Remark</a>
		</div>
	</div>
</div>
<style>
	.present-inp,.absent-inp,.late-inp,.present-lbl,.absent-lbl,.late-lbl{
		cursor: pointer;
	}
</style>
<script>
$(document).ready(function(){
	if('<?php echo isset($class_subject_id) ? 1 : 0 ?>' == 1){
		start_load()
		$.ajax({
			url:'ajax.php?action=get_class_list',
			method:'POST',
			data:{class_subject_id:$('#class_subject_id').val(),doc:$('#doc').val(),att_id :'<?php echo isset($id) ? $id : '' ?>' },
			success:function(resp){
				if(resp){
					resp = JSON.parse(resp)
					var _table = $('#table_clone table').clone()
					$('#att-list').html('')
					$('#att-list').append(_table)
					var _type = ['Absent','Present','Late'];
					var data = resp.data;
					var record = resp.record;
					var attendance_id = !!resp.attendance_id ? resp.attendance_id : '';
					if(Object.keys(data).length > 0){
						var i = 1;
						Object.keys(data).map(function(k){
							var name = data[k].name;
							var id = data[k].id;
							var tr = $('<tr></tr>')
							var opts = $('#chk_clone').clone()
							opts.find('.absent-inp').attr({'name':'type['+id+']','id':'absent_'+id,'onchange':'tfl(this,'+id+')'})
							opts.find('.present-inp').attr({'name':'type['+id+']','id':'present_'+id,'onchange':'tflo(this,'+id+')'})
							opts.find('.late-inp').attr({'name':'type['+id+']','id':'late_'+id,'onchange':'tfl(this,'+id+')'})
							opts.find('.remark-inp').attr({'name':'remark['+id+']','id':'remark_'+id})

							opts.find('.absent-lbl').attr({'for':'absent_'+id})
							opts.find('.present-lbl').attr({'for':'present_'+id})
							opts.find('.late-lbl').attr({'for':'late_'+id})
							opts.find('.remark-lbl').attr({'class':'remark_lbl_'+id})

							tr.append('<td class="text-center">'+(i++)+'</td>')
							tr.append('<td class="">'+(name)+'</td>')
							var td = '<td>';
								td += '<input type="hidden" name="student_id['+id+']" value="'+id+'">';
								td += opts.html();
								td += '</td>';
							tr.append(td)

							_table.find('tbody').append(tr)
						})
						var r = $('<tr></tr>')
						var all = '<td></td><td></td><td class="text-center">';
							all += '<input onClick="presnt(this)" name="rad" class="allp" id="allp" type="checkbox">';
							all += '&nbsp;&nbsp;<label class="form-check-label present-lbl">All Present</label>&nbsp;&nbsp;&nbsp;';
							all += '<input onClick="absnt(this)" name="rad" class="alla" id="alla" type="checkbox">';
							all += '&nbsp;&nbsp;<label class="form-check-label absent-lbl">All Absent</label>&nbsp;&nbsp;&nbsp;';
							all += '</td>';
						r.append(all)
						_table.find('tbody').append(r)
						$('#submit-btn-field').show()
						$('#edit_att').attr('data-id',attendance_id)
					}else{
							var tr = $('<tr></tr>')
							tr.append('<td class="text-center" colspan="3">No data.</td>')
							_table.find('tbody').append(tr)
						$('#submit-btn-field').attr('data-id','').hide()
						$('#edit_att').attr('data-id','')
					} 
					$('#att-list').html('')
					$('#att-list').append(_table)
					if(Object.keys(record).length > 0){
						Object.keys(record).map(k=>{
							$('#att-list').find('[name="type['+record[k].student_id+']"][value="'+record[k].type+'"]').prop('checked',true)
							var sid = record[k].student_id;
							var d = 'remark_'+sid;
							var cdiv = document.getElementById(d);
							var abs = 'present_'+sid;
							var s = document.getElementById(abs);
							var opts = $('#att-list')
							opts.find('.remark_lbl_'+sid).attr({'href':'remarks/'+record[k].remark_absent,'id':'remark_lbl_'+sid,'target':'_blank'})
							var ds = 'remark_lbl_'+sid;
							var csdiv = document.getElementById(ds);
							if(!s.checked){
								$('#att-list').find('[name="remark['+record[k].student_id+']"]').attr({'value':''+record[k].remark_absent+''})
								cdiv.style.display = 'block';
								if(record[k].remark_absent != ''){
									csdiv.style.display = 'block';
								}
							} 
							else {
								cdiv.style.display = 'none';
								csdiv.style.display = 'none';
							}
						})
					}
				}
			},
			complete:function(){
				$(".form-check-input:checkbox").on('keyup keypress change',function(){
					// console.log(test)
				    var group = ".form-check-input:checkbox[name='"+$(this).attr("name")+"']";
				    $(group).prop("checked",false);
				    $(this).prop("checked",true);
				});
				$('#edit_att').click(function(){
					location.href = 'index.php?page=check_attendance&attendance_id='+$(this).attr('data-id')
				})
				end_load()
			}
		})
	}
	
})
	$('#class_subject_id').change(function(){
		get_data($(this).val())
	})
	window.get_data = function(id){
		start_load()
		$.ajax({
			url:'ajax.php?action=get_class_list',
			method:'POST',
			data:{class_subject_id:id},
			success:function(resp){
				if(resp){
					resp = JSON.parse(resp)
					var _table = $('#table_clone table').clone()
					$('#att-list').html('')
					$('#att-list').append(_table)
					if(Object.keys(resp).length > 0){
						var i = 1;
						Object.keys(resp.data).map(function(k){
							var name = resp.data[k].name;
							var id = resp.data[k].id;
							var tr = $('<tr></tr>')
							var opts = $('#chk_clone').clone()
							opts.find('.absent-inp').attr({'name':'type['+id+']','id':'absent_'+id,'onchange':'tfl(this,'+id+')'})
							opts.find('.present-inp').attr({'name':'type['+id+']','id':'present_'+id,'onchange':'tflo(this,'+id+')'})
							opts.find('.late-inp').attr({'name':'type['+id+']','id':'late_'+id,'onchange':'tfl(this,'+id+')'})
							opts.find('.remark-inp').attr({'name':'remark['+id+']','id':'remark_'+id})

							opts.find('.absent-lbl').attr({'for':'absent_'+id})
							opts.find('.present-lbl').attr({'for':'present_'+id})
							opts.find('.late-lbl').attr({'for':'late_'+id})

							tr.append('<td class="text-center">'+(i++)+'</td>')
							tr.append('<td class="">'+(name)+'</td>')
							var td = '<td>';
								td += '<input type="hidden" name="student_id['+id+']" value="'+id+'">';
								td += opts.html();
								td += '</td>';
							tr.append(td)

							_table.find('tbody').append(tr)
						})
						
						var r = $('<tr></tr>')
						var all = '<td></td><td></td><td class="text-center">';
							all += '<input onClick="presnt(this)" name="rad" class="allp" id="allp" type="checkbox">';
							all += '&nbsp;&nbsp;<label class="form-check-label present-lbl">All Present</label>&nbsp;&nbsp;&nbsp;';
							all += '<input onClick="absnt(this)" name="rad" class="alla" id="alla" type="checkbox">';
							all += '&nbsp;&nbsp;<label class="form-check-label absent-lbl">All Absent</label>&nbsp;&nbsp;&nbsp;';
							all += '</td>';
							
						r.append(all)
						_table.find('tbody').append(r)
						$('#submit-btn-field').show()
					}else{
							var tr = $('<tr></tr>')
							tr.append('<td class="text-center" colspan="3">No data.</td>')
							_table.find('tbody').append(tr)
						$('#submit-btn-field').hide()
					} 
					$('#att-list').html('')
					$('#att-list').append(_table)
				}
			},
			complete:function(){
				$(".form-check-input:checkbox").on('keyup keypress change',function(){
					// console.log(test)
				    var group = ".form-check-input:checkbox[name='"+$(this).attr("name")+"']";
				    $(group).prop("checked",false);
				    $(this).prop("checked",true);
				});
				end_load()
			}
		})
	}
	function tfl(s,id){
		var d = 'remark_'+id;
		var cdiv = document.getElementById(d);
		if(s.checked){
			cdiv.style.display = 'block';
		} 
		else {
			cdiv.style.display = 'none';
		}
	}
	function tflo(s,id){
		var d = 'remark_'+id;
		var cdiv = document.getElementById(d);
		if(s.checked){
			cdiv.style.display = 'none';
		} 
		else {
			cdiv.style.display = 'block';
		}
	}
	function presnt(source) {
		checkboxesp = document.getElementsByClassName('present-inp');
		checkboxesa = document.getElementsByClassName('absent-inp');
		checkboxesl = document.getElementsByClassName('late-inp');
		var checkboxesaa = document.getElementById('alla');
		checkboxesaa.checked = false;
		for(var i=0, n=checkboxesp.length;i<n-1;i++) {
			checkboxesp[i].checked = source.checked;
			checkboxesa[i].checked = false;
			checkboxesl[i].checked = false;
			var o = i+1;
			var d = 'remark_'+o;
			//console.log(d);
			var cdiv = document.getElementById(d);
			if(checkboxesa[i].checked){
				cdiv.style.display = 'block';
			} 
			else {
				cdiv.style.display = 'none';
			}
		}
	}
	function absnt(source) {
		checkboxesp = document.getElementsByClassName('present-inp');
		checkboxesa = document.getElementsByClassName('absent-inp');
		checkboxesl = document.getElementsByClassName('late-inp');
		var checkboxesap = document.getElementById('allp');
		checkboxesap.checked = false;
		for(var i=0, n=checkboxesa.length;i<n-1;i++) {
			checkboxesp[i].checked = false;
			checkboxesa[i].checked = source.checked;
			checkboxesl[i].checked = false;
			var o = i+1;
			var d = 'remark_'+o;
			//console.log(d);
			var cdiv = document.getElementById(d);
			if(checkboxesa[i].checked){
				cdiv.style.display = 'block';
			} 
			else {
				cdiv.style.display = 'none';
			}
		}
	}
	$('#manage-attendance').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=save_attendance',
			method:'POST',
			data:new FormData($(this)[0]),
			cache: false,
			contentType: false,
			processData: false,
			success:function(resp){
				//end_load();
				console.log(resp);
				//alert(resp);
				if(resp==1){
					  alert_toast("Data successfully saved.",'success')
                        setTimeout(function(){
                            location.reload()
                        },1000)
				}else if(resp ==2){
					  alert_toast("Class already has an attendance record with the slected subject and date.",'danger')
					  end_load();
				}
			}
		})
	})
</script>