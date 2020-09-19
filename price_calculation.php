<?php
include "server.php";
$query = "SELECT `tree_id`, `tree_name`, `tree_price`, `place` FROM `tree` WHERE 1";
$ret = mysqli_query($conn, $query);
$total = 0;
$area = 0;
$message = "";
if ($ret && mysqli_num_rows($ret)) {
    while ($data = mysqli_fetch_assoc($ret)) {
        $name = "t" . $data['tree_id'];
        $q = "q" . $data['tree_id'];
        if (isset($_POST[$name], $_POST[$q])) {
            $total = $total + ($data['tree_price'] * $_POST[$q]);
            $area = $area + ($data['place'] * $_POST[$q]);
            $message = $message . $data['tree_name'] . " (" . $_POST[$q] . ") : " . ($data['tree_price'] * $_POST[$q]) . "<br>";
        }
    }
}
header("Location: calculation.php?total=" . $total . "&area=" . $area . "&message=" . $message);