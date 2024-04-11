<?php
require_once('./db.php');

// Read JSON input from request body
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, true);

try {
    $stmt = $db->prepare('UPDATE sp_transaction SET operation = ? WHERE ID = ?');
    $stmt->execute([$input['operation'], $input['ID']]);
    echo json_encode(['message' => 'Status updated successfully']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>