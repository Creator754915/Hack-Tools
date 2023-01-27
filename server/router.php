<?php
// router.php
$path = pathinfo($_SERVER["index"]);
if ($path["html"] == "el") {
    header("Content-Type: text/x-script.elisp");
    readfile($_SERVER["index"]);
}
else {
    return FALSE;
}
?>
