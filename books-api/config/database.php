<?php

// Set JSON content type header
header('Content-Type: application/json');

// Database credentials
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'mobileapps_2026B_thomas_parker';

/**
 * Get database connection
 * Returns mysqli connection object
 */
function getDBConnection() {
    global $host, $username, $password, $database;
    
    $conn = new mysqli($host, $username, $password, $database);
    
    if ($conn->connect_error) {
        sendError('Connection failed: ' . $conn->connect_error);
    }
    
    return $conn;
}

/**
 * Send JSON success response
 * @param mixed $data Optional data to include in response
 */
function sendSuccess($data = null) {
    $response = ['success' => true];
    if ($data !== null) {
        $response['data'] = $data;
    }
    echo json_encode($response);
    exit;
}

/**
 * Send JSON error response
 * @param string $message Error message
 */
function sendError($message) {
    echo json_encode([
        'success' => false,
        'error' => $message
    ]);
    exit;
}

?>