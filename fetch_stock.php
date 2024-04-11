<?php

require_once('./db.php');

try {
    // Query เพื่อดึงข้อมูลสินค้าทั้งหมดจากตาราง sp_product
    $stmt = $db->query('SELECT * FROM sp_product');
    $stmt->execute();
    // ดึงข้อมูลสินค้าเป็นแถวแล้วเก็บไว้ในตัวแปร $products
    $product = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // ส่งข้อมูลสินค้าทั้งหมดกลับเป็น JSON ให้กับไคลเอ็นต์
    echo json_encode($product);
} catch (PDOException $e) {
    // หากเกิดข้อผิดพลาดในการดึงข้อมูล ส่ง HTTP response code 500 และข้อความข้อผิดพลาดกลับไป
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>
