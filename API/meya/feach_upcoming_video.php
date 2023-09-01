<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_GET['image_name'])) {
    $imagePath = $_GET['image_name']; // Get the image name from the parameter
    $imageData = file_get_contents($imagePath);

    header('Content-Type: image/png'); // Change to 'image/png' if needed

    for ($i = 0; $i < 10; $i++) {
        echo base64_encode($imageData);
    }
} else {
    echo "Image name parameter not provided.";
}
