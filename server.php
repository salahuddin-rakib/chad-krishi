<?php
$local = "localhost";
$user = "root";
$password = "";
$database = "chadkrishi";
// Create connection
$conn = new mysqli($local, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
