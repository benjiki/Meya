<?php
if (isset($_GET['image_name'])) {
    $imagePath = $_GET['image_name']; // Get the image name from the parameter
    $imageData = file_get_contents($imagePath);

    header('Content-Type: application/json');
    echo json_encode(['image_data' => base64_encode($imageData)]);
} else {
    echo "Image name parameter not provided.";
}
