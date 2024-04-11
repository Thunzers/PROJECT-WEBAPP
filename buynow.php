<?php

require_once('./db.php');

try {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
       
        $object = new stdClass();
        $amount = 0 ;
        $product = $_POST['product'];

        $stmt = $db->prepare('select id,price from sp_product order by id asc');
        if ($stmt->execute()) {

            $queryproduct = array();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $items = array(
                    "ID" => $id,
                    "price" => $price
                );
                array_push($queryproduct, $items);
            }

            for ($i=0; $i < count($product) ; $i++) { 
                for ($k=0; $k < count($queryproduct) ; $k++) { 
                    if( isset($product[$i]['ID']) && isset($queryproduct[$k]['ID']) && intval($product[$i]['ID']) == intval($queryproduct[$k]['ID']) ) {
                        $amount += intval($product[$i]['count']) * intval($queryproduct[$k]['price']);

                        break;
                    }
                }
            }
            // $matchedProducts = array_filter($product, function($item) use ($queryproduct) {
            //     return array_search($item['ID'], array_column($queryproduct, 'ID')) !== false;
            // });
            
            // // Calculate total amount
            // $amount = array_reduce($matchedProducts, function($accumulator, $item) use ($queryproduct) {
            //     $matchedProduct = array_values(array_filter($queryproduct, function($queryItem) use ($item) {
            //         return $queryItem['ID'] == $item['ID'];
            //     }))[0];
            //     return $accumulator + intval($item['count']) * intval($matchedProduct['price']);
            // }, 0);
            if (isset($_POST['totalPrice'])) {
                $totalPrice = $_POST['totalPrice'];
                // ทำสิ่งที่ต้องการกับ $totalPrice ที่ได้จาก JavaScript
                $amount = $totalPrice;

            }

              // $shiping = $amount ;
              //$netamount = $shiping;
            $transid = round(microtime(true) * 1000);
            $product = json_encode($product);
            $mill = time() * 1000;
            //$updated_at = date("Y-m-d h:i:sa");

            $stmt = $db->prepare('insert into sp_transaction (tranid,orderlist,amount,operation,mill) values (?,?,?,?,?)');
            if ($stmt->execute([
                $transid, $product, $amount, 'PENDING', $mill
            ])) {
                $object->RespCode = 200;
                $object->RespMessage = 'success';
                $object->Amount = new stdClass();
                $object->Amount->Amount = $amount;
                http_response_code(200);
            } else {
                $object->RespCode = 300;
                $object->Log = 0;
                $object->RespMessage = 'bad : insert transaction fail';
                http_response_code(300);
            }
        } else {
            $object->RespCode = 500;
            $object->Log = 1;
            $object->RespMessage = 'bad : cant get product';
            http_response_code(500);
        }
        echo json_encode($object);
    } else {
        http_response_code(405);
    }
} catch (PDOException $e) {
    http_response_code(500);
    echo $e->getMessage();
}