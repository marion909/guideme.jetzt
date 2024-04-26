<html>

<?php
echo $_GET['admin'];
$admin = $_GET['admin'];
if($admin == "true"){
echo "talk4hyem5p";
}
?>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Script Download</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#"><span>skripts.guideme.jetzt</span>
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"></div>
                </a>
<a class="btn btn-primary" role="button" href="upload.html">Upload</a>

			
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar"></ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid">
                        <h1>Download</h1>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Download Link</th>
<?php

if($admin == "true"){
	echo "<th>Delete</th>";

}

?>


						
                                </tr>
                            </thead>
                            <tbody>
                                
<?php
$path = "./downloads";
$dh = opendir($path);
$i=1;
while (($file = readdir($dh)) !== false) {
    if($file == "."){
$i++;

}elseif($file == ".."){
$i++;}else{
        echo "<tr><td>$file</td> <td><a href='$path/$file' target='_blank'>$file</a></td>";
if($admin == "true"){
	echo "<td><a href='delete.php?file=$path/$file' target='_blank'>Delete</a></td>";
}
		echo "</tr>";
        $i++;
    }
}
closedir($dh);
?>
                                   
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="alert alert-success" role="alert"><span><strong>Backup Script, Recovery Script, Install Script, uvm.</strong></span></div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Mario Neuhauser 2022</span></div>
                </div>
            </footer>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>