<?php
// Enable CORS for cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Handle OPTIONS request for CORS preflight
if ($_SERVER["REQUEST_METHOD"] == "OPTIONS") {
    http_response_code(200);
    exit();
}

// Enable error reporting (disable in production)
ini_set('display_errors', 1);
error_reporting(E_ALL);

require 'database.php'; // Ensure database.php is included

header("Content-Type: application/json");

// Read raw JSON input
$json = file_get_contents("php://input");
$data = json_decode($json, true);

// Check if JSON is valid
if ($data === null) {
    echo json_encode(["status" => "error", "message" => "❌ Invalid JSON format."]);
    exit();
}

// Extract form data (Customer_ID is removed since it's auto-incremented)
$firstname = isset($data['firstname']) ? trim($data['firstname']) : '';
$middle_initial = isset($data['middle_initial']) ? trim($data['middle_initial']) : '';
$lastname = isset($data['lastname']) ? trim($data['lastname']) : '';
$birthday = isset($data['birthday']) && !empty(trim($data['birthday'])) ? trim($data['birthday']) : null; // Allow NULL
$address = isset($data['address']) ? trim($data['address']) : '';
$nationality = isset($data['nationality']) ? trim($data['nationality']) : '';
$gender = isset($data['gender']) ? trim($data['gender']) : '';

// Check required fields except for birthday
if (empty($firstname) || empty($lastname) || empty($address) || empty($nationality) || empty($gender)) {
    echo json_encode(["status" => "error", "message" => "❌ All required fields must be filled, except birthday."]);
    exit();
}

// ✅ First, check if the last name already exists
$check_lastname_stmt = $conn->prepare("SELECT COUNT(*) FROM tbl_customer WHERE Customer_LastName = ?");
$check_lastname_stmt->bind_param("s", $lastname);
$check_lastname_stmt->execute();
$check_lastname_stmt->bind_result($lastname_count);
$check_lastname_stmt->fetch();
$check_lastname_stmt->close();

if ($lastname_count > 0) {
    // ✅ Now check if the first name also exists for the same last name
    $check_fullname_stmt = $conn->prepare("SELECT COUNT(*) FROM tbl_customer WHERE Customer_LastName = ? AND Customer_FirstName = ?");
    $check_fullname_stmt->bind_param("ss", $lastname, $firstname);
    $check_fullname_stmt->execute();
    $check_fullname_stmt->bind_result($fullname_count);
    $check_fullname_stmt->fetch();
    $check_fullname_stmt->close();

    if ($fullname_count > 0) {
        echo json_encode(["status" => "error", "message" => "❌ The name '$firstname $lastname' is already in use."]);
        exit();
    }
}

// Prepare SQL query
if ($birthday === null) {
    $stmt = $conn->prepare("INSERT INTO tbl_customer 
        (Customer_FirstName, Customer_MiddleInitial, Customer_LastName, Customer_Birthday, Customer_Address, Customer_Nationality, Customer_Gender) 
        VALUES (?, ?, ?, NULL, ?, ?, ?)");
    $stmt->bind_param("ssssss", $firstname, $middle_initial, $lastname, $address, $nationality, $gender);
} else {
    $stmt = $conn->prepare("INSERT INTO tbl_customer 
        (Customer_FirstName, Customer_MiddleInitial, Customer_LastName, Customer_Birthday, Customer_Address, Customer_Nationality, Customer_Gender) 
        VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssss", $firstname, $middle_initial, $lastname, $birthday, $address, $nationality, $gender);
}

// Execute statement
if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "✅ Customer added successfully!"]);
} else {
    echo json_encode(["status" => "error", "message" => "❌ Error adding customer: " . $stmt->error]);
}

// Close resources
$stmt->close();
$conn->close();
exit();
?>
