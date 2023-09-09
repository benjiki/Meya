<?php
include('ipconfig.php');

// Simulated video data (replace this with actual database retrieval)
$videoData = [
    [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 1",
        "category" => "Funny",
    ],
    [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 2",
        "category" => "Cute",
    ],
    [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 2",
        "category" => "Cute",
    ], [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 2",
        "category" => "Cute",
    ], [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 2",
        "category" => "Cute",
    ], [
        "imageUrl" => "http://" . trim($ip) . "/n7/meya/named.png",
        "title" => "Video 2",
        "category" => "Cute",
    ],
    // Add more video data...
];

header("Content-Type: application/json");
echo json_encode($videoData);
