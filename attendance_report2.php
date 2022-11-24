<?php include 'db_connect.php' ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header"><b>Attendance Report</b></div>
			<div class="card-body">
				<form id="manage-attendance" method="post" action="">
					<input type="hidden" name="id" value="">
					<div class="row justify-content-center">
						<label for="" class="mt-2">Class per Subjects</label>
						<div class="col-sm-4">
				            <select name="class_subject_id" id="class_subject_id" class="custom-select select2 input-sm">
				                <option value=""></option>
				                <?php
				                $class = $conn->query("SELECT cs.*,concat(co.course,' ',c.level,'-',c.section) as `class`,s.subject,f.name as fname FROM class_subject cs inner join `class` c on c.id = cs.class_id inner join courses co on co.id = c.course_id inner join faculty f on f.id = cs.faculty_id inner join subjects s on s.id = cs.subject_id ".($_SESSION['login_faculty_id'] ? " where f.id = {$_SESSION['login_faculty_id']} ":"")." order by concat(co.course,' ',c.level,'-',c.section) asc");
				                while($row=$class->fetch_assoc()):
				                ?>
				                <option value="<?php echo $row['id'] ?>" data-cid="<?php echo $row['id'] ?>" <?php echo isset($class_subject_id) && $class_subject_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['class'].' '.$row['subject']. ' [ '.$row['fname'].' ]' ?></option>
				                <?php endwhile; ?>
				            </select>
						</div>
						<label for="" class="mt-2">Year of</label>
						<div class="col-sm-3">
							<input type="year" name="doc" id="doc" value="<?php echo date('Y') ?>" class="form-control">
						</div>
						<div class="col-sm-2">
							<input class="btn  btn-primary" type="submit" name="submit" value="Filter">
						</div>
					</div>
				</form>
				<hr>
				<!--DISPLAY GRAPH HERE-->
				<?php
				if(isset($_POST['submit'])){
					$class_subject_id = $_POST["class_subject_id"];
					$doc = $_POST["doc"];
					$point1 = "";
					$point2 = "";
					$point3 = "";
					for($n = 1;$n<=12;$n++){
						$n = sprintf("%02s", $n);
						$m = $doc."-".$n;
						/////////
						$absentsqljan = mysqli_query($conn,"SELECT COUNT(*) as absent FROM attendance_record ar INNER JOIN attendance_list a ON a.id = ar.attendance_id WHERE a.class_subject_id='$class_subject_id' AND ar.type='0' AND date_format(a.doc,'%Y-%m') = '$m'");
						$absentfajan = mysqli_fetch_assoc($absentsqljan);
						$absent = $absentfajan["absent"];
						
						$presentsqljan = mysqli_query($conn,"SELECT COUNT(*) as present FROM attendance_record ar INNER JOIN attendance_list a ON a.id = ar.attendance_id WHERE a.class_subject_id='$class_subject_id' AND ar.type='1' AND date_format(a.doc,'%Y-%m') = '$m'");
						$presentfajan = mysqli_fetch_assoc($presentsqljan);
						$present = $presentfajan["present"];
						
						$latesqljan = mysqli_query($conn,"SELECT COUNT(*) as late FROM attendance_record ar INNER JOIN attendance_list a ON a.id = ar.attendance_id WHERE a.class_subject_id='$class_subject_id' AND ar.type='2' AND date_format(a.doc,'%Y-%m') = '$m'");
						$latefajan = mysqli_fetch_assoc($latesqljan);
						$late = $latefajan["late"];
						/////////
						if($n == "01")
							$lbl = "January";
						if($n == "02")
							$lbl = "February";
						if($n == "03")
							$lbl = "March";
						if($n == "04")
							$lbl = "April";
						if($n == "05")
							$lbl = "May";
						if($n == "06")
							$lbl = "June";
						if($n == "07")
							$lbl = "July";
						if($n == "08")
							$lbl = "August";
						if($n == "09")
							$lbl = "September";
						if($n == "10")
							$lbl = "October";
						if($n == "11")
							$lbl = "November";
						if($n == "12")
							$lbl = "December";
						
						if($n == "12"){
							$point1 .= $lbl." ".$absent;
							$point2 .= $lbl." ".$present;
							$point3 .= $lbl." ".$late;
						}
						else{
							$point1 .= $lbl." ".$absent.",";
							$point2 .= $lbl." ".$present.",";
							$point3 .= $lbl." ".$late.",";
						}
					}
					
					$dataPoints1=explode(",",$point1);
					foreach($dataPoints1 as $index => $lblpoin){
					  list($lbel,$pont) = explode(' ',$lblpoin);
					  $dataPoints1[$index] = ['label' => $lbel, 'y' => $pont];
					}
					$dataPoints2=explode(",",$point2);
					foreach($dataPoints2 as $index => $lblpoin){
					  list($lbel,$pont) = explode(' ',$lblpoin);
					  $dataPoints2[$index] = ['label' => $lbel, 'y' => $pont];
					}
					$dataPoints3=explode(",",$point3);
					foreach($dataPoints3 as $index => $lblpoin){
					  list($lbel,$pont) = explode(' ',$lblpoin);
					  $dataPoints3[$index] = ['label' => $lbel, 'y' => $pont];
					}
					$sql = mysqli_query($conn,"SELECT cs.*,concat(co.course,' ',c.level,'-',c.section) as `class`,s.subject,f.name as fname FROM class_subject cs inner join `class` c on c.id = cs.class_id inner join courses co on co.id = c.course_id inner join faculty f on f.id = cs.faculty_id inner join subjects s on s.id = cs.subject_id ".($_SESSION['login_faculty_id'] ? " where f.id = {$_SESSION['login_faculty_id']} ":"")."AND cs.id='$class_subject_id' order by concat(co.course,' ',c.level,'-',c.section) asc");
					$fa = mysqli_fetch_assoc($sql);
					$c = $fa['class'].' '.$fa['subject']. ' [ '.$fa['fname'].' ] ';
					
				}
				?>
				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			</div>
		</div>
	</div>
</div>
<style>
	.present-inp,.absent-inp,.late-inp,.present-lbl,.absent-lbl,.late-lbl{
		cursor: pointer;
	}
</style>
<noscript>
	<style>
		table.att-list{
			width:100%;
			border-collapse:collapse
		}
		table.att-list td,table.att-list th{
			border:1px solid
		}
		.text-center{
			text-align:center
		}
	</style>
</noscript>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	window.onload = function () {
	 
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "light2",
			title:{
				text: "<?php echo $c; ?>"
			},
			axisY:{
				includeZero: true
			},
			legend:{
				cursor: "pointer",
				verticalAlign: "center",
				horizontalAlign: "right",
				itemclick: toggleDataSeries
			},
			data: [{
				type: "column",
				name: "Absent",
				indexLabel: "{y}",
				yValueFormatString: "0",
				showInLegend: true,
				dataPoints: <?php echo json_encode($dataPoints1, JSON_NUMERIC_CHECK); ?>
			},{
				type: "column",
				name: "Present",
				indexLabel: "{y}",
				yValueFormatString: "0",
				showInLegend: true,
				dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
			},{
				type: "column",
				name: "Late",
				indexLabel: "{y}",
				yValueFormatString: "0",
				showInLegend: true,
				dataPoints: <?php echo json_encode($dataPoints3, JSON_NUMERIC_CHECK); ?>
			}]
		});
		chart.render();
		 
		function toggleDataSeries(e){
			if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			}
			else{
				e.dataSeries.visible = true;
			}
			chart.render();
		}
	 
	}
</script>