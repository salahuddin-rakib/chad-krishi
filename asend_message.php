<?php
session_start();
include "server.php";
if (isset($_POST['form_message'])) {
    $message = $_POST['form_message'];
    $userId = $_SESSION['id'];
    $query = "INSERT INTO `a_message`(`user_id`, `message`) VALUES ('$userId', '$message')";
    mysqli_query($conn, $query);
}
header("Location: aconversation.php");