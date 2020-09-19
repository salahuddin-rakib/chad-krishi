<?php
session_start();
include "server.php";
if (isset($_POST['form_message'])) {
    $message = $_POST['form_message'];
    $userId = $_SESSION['id'];
    $query = "INSERT INTO `message`(`user_id3`, `message`) VALUES ('$userId', '$message')";
    mysqli_query($conn, $query);
}
header("Location: conversation.php");