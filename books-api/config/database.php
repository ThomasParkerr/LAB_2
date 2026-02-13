<?php

// Database credentials
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'mobileapps_2026B_thomas_parker';

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode([
        'success' => false,
        'error' => 'Connection failed: ' . $conn->connect_error,
        'host' => $host,
        'database' => $database
    ]));
}

// Connection successful
echo json_encode([
    'success' => true,
    'message' => 'Database connection successful!',
    'host' => $host,
    'database' => $database,
    'connection' => 'Active'
]);

// Close connection
$conn->close();
?>