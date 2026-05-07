<?php
$host = "db";
$user = "root";
$password = "123";
$database = "bLeague";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
?>