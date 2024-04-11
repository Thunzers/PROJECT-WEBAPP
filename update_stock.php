<?php
require_once('./db.php');

// Read JSON input from request body
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, true);

try {
    $stmt = $db->prepare('UPDATE sp_product SET stock = ? WHERE id = ?');
    $stmt->execute([$input['stock'], $input['id']]);
    echo json_encode(['message' => 'Status updated successfully']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>
