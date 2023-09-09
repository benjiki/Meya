<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_GET['image_name'])) {
    $imagePath = $_GET['image_name'];
    $imageData = file_get_contents($imagePath);

    header('Content-Type: image/png');
    echo base64_encode($imageData);
} else {
    $allImageNames = ["named.png", "named.png", "named.png"]; // Example list
    header("Content-Type: application/json");
    echo json_encode($allImageNames);
}
