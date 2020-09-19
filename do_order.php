<?php
session_start();
include "server.php";
$query = "SELECT `tree_id` FROM `tree` WHERE 1";
$ret = mysqli_query($conn, $query);
if ($ret && mysqli_num_rows($ret)) {
    while ($data = mysqli_fetch_assoc($ret)) {
        $name = "t" . $data['tree_id'];
        $q = "q" . $data['tree_id'];
        if (isset($_POST[$name], $_POST[$q])) {
            $treeId = $data['tree_id'];
            $userId = $_SESSION['id'];
            $quantity = $_POST[$q];
            $query = "INSERT INTO `show_tree`(`tree_id2`, `user_id1`, `quantity`) VALUES ('$treeId', '$userId','$quantity')";
            mysqli_query($conn, $query);
            $showtId = $conn->insert_id;
            $query = "INSERT INTO `orders`(`showt_id2`, `showi_id2`) VALUES ('$showtId', NULL)";
            mysqli_query($conn, $query);
        }
    }
}
$query = "SELECT `item_id` FROM `item` WHERE 1";
$ret = mysqli_query($conn, $query);
if ($ret && mysqli_num_rows($ret)) {
    while ($data = mysqli_fetch_assoc($ret)) {
        $name = "i" . $data['item_id'];
        $q = "qi" . $data['item_id'];
        if (isset($_POST[$name], $_POST[$q])) {
            $itemId = $data['item_id'];
            $userId = $_SESSION['id'];
            $quantity = $_POST[$q];
            $query = "INSERT INTO `show_item`(`item_id2`, `user_id2`, `quantity`) VALUES ('$itemId', '$userId', '$quantity')";
            mysqli_query($conn, $query);
            $showiId = $conn->insert_id;
            $query = "INSERT INTO `orders`(`showt_id2`, `showi_id2`) VALUES (NULL, '$showiId')";
            mysqli_query($conn, $query);
        }
    }
}
header("Location: order.php?&message=Order Successful");