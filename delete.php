<?php
 echo $_GET['file'];
$file = $_GET['file'];
echo $file;

$status=unlink($file);    
if($status){  
header("Location: index.php");    
}else{  
header("Location: index.php");     
}  
?>  