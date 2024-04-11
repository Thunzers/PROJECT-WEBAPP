<?php

    require_once("./db2.php");

    try{
        if($_SERVER['REQUEST_METHOD'] == 'GET'){
            $object = new stdClass();

            $stmt = $db->prepare('select * from sp_product order by id asc');

            if($stmt->execute()){
                $num = $stmt->rowCount();
                if($num > 0){

                    $object->Result = array();
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                        extract($row);
                        // $item = array(
                        //         "thisisname" => $name,
                        //         "thisisprice" => $price,
                        // );
                        array_push($object->Result, $row);
                    }
                    $object->RespCode = 200;
                    $object->RespMessage = "Success";
                    http_response_code(200);
                }
                else{
                        $object->RespCode = 400;
                        $object->Log = 0;
                        $object->RespMessage = "Bad : Not found data";
                        http_response_code(400);
                }
                echo json_encode($object);
            }
            else{
                    $object->RespCode = 500;
                    $object->Log = 1;
                    $object->RespMessage = "Bad : bad sql";
                    http_response_code(400);
            }
        }
        else{
            http_response_code(405);
        }
    }
    catch(PDOException $e){
        http_response_code(500);
        echo $e->getMessage();
    }

?>