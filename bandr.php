<?php
session_start();
include "config.ini.php";
if (isset($_SESSION["sess_id"])!="") {
	$uid=$_SESSION["sess_userid"];
	$uname=$_SESSION["sess_name"];
	$utype=$_SESSION["sess_type"];
} else {
	mws_message('กรุณาเข้าสู่ระบบก่อน','index.php');
}
$where="";
if (isset($_POST["stdate"])!="") {
	if ($_POST["stdate"]!="") {
		$stdate=toexdate($_POST["stdate"]);
		$endate=toexdate($_POST["endate"]);
		$where=" where insdate>='$stdate' and insdate<='$endate' ";
	}
}
if (isset($_POST["status"])!="") { if ($_POST["status"]!="") { if ($where=="") { $where=" where status=$_POST[status] "; } else { $where.=" and status=$_POST[status] "; } } }

if ($where=="") {
	$sql=" select * from borrow where 1=0 ";
} else {
	$sql=" select * from borrow $where order by id desc ";	
}
$result=mysqli_query($con,$sql);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ระบบยืม - คืน อุปกรณ์กีฬา</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/start/jquery-ui-1.8.21.custom.css" />
<link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel-3.0.6.pack.js"></script>
<script type="text/javascript" src="source/jquery.fancybox.pack.js"></script>
<script language="javascript">
$(function() {
	$('a[id^="edit"]').fancybox({
			'width'				: '50%',
			'height'			: '20%',
			'autoScale'     	: false,
			'transitionIn'		: 'none',
			'transitionOut'		: 'none',
			'type'				: 'iframe'
	});	
	$("#stdate").datepicker({
		dateFormat: 'dd-mm-yy',
		dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],    
		monthNamesShort: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'],
		changeMonth: true,   
		changeYear: true ,
		yearRange: 'c-20:c+0'
	});
	$("#endate").datepicker({
		dateFormat: 'dd-mm-yy',
		dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],    
		monthNamesShort: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'],
		changeMonth: true,   
		changeYear: true ,
		yearRange: 'c-20:c+0'
	});
});
function del_sup(val1) {
	if (confirm("คุณแน่ใจหรือว่าต้องการลบประเภทอุปกรณ์นี้ ?")==true) {
		top.window.location='del_suptype.php?id_del='+val1;	
	}
}
function chk_form() {
	var Rtn=true;
	
	if (document.getElementById("stdate").value=="" && document.getElementById("endate").value=="" && document.getElementById("no").value=="") {
		Rtn=false;
		alert('กรุณาใส่ข้อมูลให้ครบ');
	}
	return Rtn;	
}
</script>
</head>

<body>
<table width="960" border="0" align="center" cellpadding="0" cellspacing="2">
  <tr>
    <td>
    <div id="container">
      <table width="940" border="0" cellspacing="2" cellpadding="0">
        <tr>
          <td style="background:url(images/watermask.png)" height="170"><?php include "inc_head.php"; ?></td>
        </tr>
        <tr>
          <td>
          <div id="menu">
				<?php include "menu.php"; ?>
           </div>
          </td>
        </tr>
        <tr>
          <td><table width="920" border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td width="47">&nbsp;</td>
              <td width="697">&nbsp;</td>
              <td width="168">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
            <table width="400" border="0" align="center" cellpadding="0" cellspacing="2">
              <tr>
                <td><form id="form1" name="form1" method="post" action="bandr.php" onsubmit="return chk_form()">
                  <fieldset>
                    <legend>ค้นหารายการยืม                    </legend>
                    <table width="400" border="0" cellspacing="2" cellpadding="0">
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><div align="right">ตั้งแต่วันที่ : </div></td>
                        <td><input name="stdate" type="text" id="stdate" size="9" /></td>
                        <td><div align="right">ถึงวันที่ : </div></td>
                        <td><input name="endate" type="text" id="endate" size="9" /></td>
                      </tr>
                      <tr>
                        <td><div align="right">สถานะ : </div></td>
                        <td colspan="3"><input type="radio" name="status" id="radio" value="1" />
                          ยังไม่คืน 
                            <input type="radio" name="status" id="radio2" value="2" />
                            คืนแล้ว</td>
                        </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="4"><div align="center"><input type="submit" name="button" id="button" value="ค้นหา" /></div></td>
                      </tr>
                      </table>
                  </fieldset>
                </form></td>
              </tr>
            </table>
            <table width="400" border="0" align="center" cellpadding="0" cellspacing="2">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="center"><font size="+1">รายการยืม - คืนพัสดุ</font></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <?php if (mysqli_num_rows($result) > 0) {  ?>
            <table width="900" border="1" align="center" cellpadding="0" cellspacing="0">
              <tr class="h_table">
                <td width="54" height="30">ลำดับ</td>
                <td width="166">วัน - เวลาที่ยืม</td>
                <td width="168">ใช้งานในส่วนของ</td>
                <td width="170">ชื่อผู้ยืม</td>
                <td width="133">สถานะ</td>
                <td width="133">วันที่คืน</td>
                <td width="77">รายการยืม</td>
                <td width="77">คืนอุปกรณ์</td>
                </tr>
              <?php
			  	for ($i=1;$i<=mysqli_num_rows($result);$i++) {
					$rs=mysqli_fetch_array($result);
              ?>
              <tr>
                <td><div align="center"><?php echo $i; ?></div></td>
                <td><div align="center"><?php echo toexdate($rs["b_date"])." ".$rs["b_time"]; ?></div></td>
                <td><?php echo $rs["detail"]; ?></td>
                <td><?php echo $rs["b_name"]; ?></td>
                <td><div align="center"><?php if ($rs["status"]==1) { echo "ยังไม่คิน"; } else { echo "คืนแล้ว"; } ?></div></td>
                <td><div align="center"><?php if ($rs["status"]==2) { echo toexdate($rs["rtn_date"]); } ?></div></td>
                <td><div align="center"><a href="borrow_report.php?bid=<?php echo $rs["id"]; ?>" id="edit<?php echo $i; ?>" class="various iframe"><img src="images/icon/1352332827_001_38.gif" width="24" height="24" border="0" /></a></div></td>
                <td><div align="center"><a href="ch_borrow.php?bid=<?php echo $rs["id"]; ?>"><img src="images/icon/1352332851_001_51.gif" width="24" height="24" border="0" /></a></div></td>
                </tr>
              <?php } ?>
            </table>
            <?php } else { ?>
            <table width="400" border="0" align="center" cellpadding="0" cellspacing="2">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="center"><font size="+2">ไม่พบข้อมูล</font></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
              <?php } ?>
            <p>&nbsp; </p></td>
        </tr>
        <tr>
          <td style="background:url(images/menu_bar.png); color:#FFF; font-size:12px;" height="33"><div align="center"><?php echo $sys_foolter; ?></div></td>
        </tr>
      </table>
	</div>
    </td>
  </tr>
</table>
</body>
</html>