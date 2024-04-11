var product;


// [{},{},{}] // length = 3

$(document).ready(() => {

    $.ajax({
        method: 'get',
        url: 'getallproduct2.php',
        success: function (response) {
            console.log(response)
            if (response.RespCode == 200) {

                product = response.Result

                var html = ''
                for (let i = 0; i < product.length; i++) {                   
                        html += `<div onclick="openProductDetail(${i})" class="product-items ${product[i].category}">
                            <img class="product-img" src="./img/${product[i].img}" alt="">
                            <p style="font-size: 1.2vw;">${product[i].name}</p>
                            <p style="font-size: 1vw;">${numberWithCommas(product[i].price)} THB</p>
                        </div>`;
                }
                $("#productlist").html(html);

            }
        }, error: function (err) {
            console.log(err)
        }
    })

})



// function displayProducts(products) {
//         var html = '';


//         for (let i = 0; i < products.length; i++) {

//             html += `<div onclick="openProductDetail(${i})" class="product-items ${products[i].type}">
//                     <img class="product-img" src="${products[i].img}" alt="">
//                     <p style="font-size: 1.2vw;">${products[i].name}</p>
//                     <p style="font-size: 1vw;">${numberWithCommas(products[i].price)} THB</p>
//                 </div>`;

//         }

//         $("#productlist").html(html);
//     }



function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}

function searchsomething(elem) {
    // console.log('#'+elem.id)
    var value = $('#' + elem.id).val().toLowerCase();
    console.log(value)

    var html = '';
    for (let i = 0; i < product.length; i++) {
        if (product[i].name.toLowerCase().includes(value)) {
            html += `<div onclick="openProductDetail(${i})" class="product-items ${product[i].category}">
                    <img class="product-img" src="./img/${product[i].img}" alt="">
                    <p style="font-size: 1.2vw;">${product[i].name}</p>
                    <p stlye="font-size: 1vw;">${numberWithCommas(product[i].price)} THB</p>
                </div>`;
        }

    }
    if (html == '') {
        $("#productlist").html(`<p>Not found product</p>`);
    } else {
        $("#productlist").html(html);
    }

}


function searchproduct(param) {
    $(".product-items").hide();
    if (param == 'all') {
        $(".รายการเครป").show();
        $(".คาว").show();
        $(".หวาน").show();
        $(".ท็อปปิ้ง").show();
        $(".ซอส").show();
    }
    else if (param == 'Flour') {
        $(".รายการเครป").show();
    }
    else if (param == 'Savory_filling') {
        $(".คาว").show();
    }
    else if (param == 'Sweet_filling') {
        $(".หวาน").show();
    }
    else if (param == 'Topping') {
        $(".ท็อปปิ้ง").show();
    }
    else if (param == 'Sauce') {
        $(".ซอส").show();
    }
    
    // เพิ่มเงื่อนไขสำหรับเมนูอื่น ๆ ตามต้องการ
}

var productindex = 0;
function openProductDetail(index) {
    productindex = index;
    console.log(productindex)
    $("#modalDesc").css('display', 'flex')
    $("#mdd-img").attr('src','/fn/img/' +product[index].img);
    $("#mdd-name").text(product[index].name)
    $("#mdd-price").text(numberWithCommas(product[index].price) + ' THB')
}

function closeModal() {
    $(".modal").css('display', 'none')
}




var cart = [];

function addtocart() {
    var pass = true;
    for (let i = 0; i < cart.length; i++) {
        if (productindex == cart[i].index) {
            console.log('found same product');
            cart[i].count++;
            pass = false;
        }
    }

    if (pass) {
        var obj = {
            index: productindex,
            id: product[productindex].id,
            name: product[productindex].name,
            price: product[productindex].price,
            img: product[productindex].img,
            count: 1
        };
        cart.push(obj);
    }
    console.log(cart);

    Swal.fire({
        icon: 'success',
        title: 'Add ' + product[productindex].name + ' to cart !'
    });

    // เรียกใช้ฟังก์ชัน rendercart เพื่อแสดงข้อมูลในตะกร้า
    rendercart();

    // เรียกใช้ฟังก์ชัน calculateTotalPrice เพื่อคำนวณราคาทั้งหมด
    var totalPrice = calculateTotalPrice();
    console.log('Total Price:', totalPrice);
    // ตัวอย่างการแสดงราคาทั้งหมดใน Console


}

function openCart() {
    $('#modalCart').css('display', 'flex')
    rendercart();
}

function calculateTotalPrice() {
    var total = 0;

    for (let i = 0; i < cart.length; i++) {
        total += cart[i].price * cart[i].count;
    }

    return total;
}


function rendercart() {
    if (cart.length > 0) {
        var html = '';
        for (let i = 0; i < cart.length; i++) {
            html += `<div class="cartlist-items">
                        <div class="cartlist-left">
                            <img src="img/${cart[i].img}" alt="">
                            <div class="cartlist-detail">
                                <p style="font-size: 1.5vw;">${cart[i].name}</p>
                                <p style="font-size: 1.2vw;">${numberWithCommas(cart[i].price * cart[i].count)} THB</p>
                               
                            </div>
                        </div>
                       
                        

                        <div class="cartlist-right">
                            <p onclick="deinitems('-', ${i})" class="btnc">-</p>
                            <p id="countitems${i}" style="margin: 0 20px;">${cart[i].count}</p>
                            <p onclick="deinitems('+', ${i})" class="btnc">+</p>
                        </div>

                
                    </div>`;
        }

        // เพิ่มแสดงราคาทั้งหมดที่ต้องจ่าย
        html += `<div class="total-price">Total: ${numberWithCommas(calculateTotalPrice())} THB</div>`;
        $("#cartcount").css('display', 'flex').text(cart.length);
        $("#mycart").html(html);
    } else {
        $("#mycart").html(`<p>Not found product list</p>`);
    }
}


function deinitems(action, index) {
    if (action == '-') {
        if (cart[index].count > 0) {
            cart[index].count--;
            $("#countitems" + index).text(cart[index].count);

            if (cart[index].count <= 0) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Are you sure to delete?',
                    showConfirmButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Delete',
                    cancelButtonText: 'Cancel'
                }).then((res) => {
                    if (res.isConfirmed) {
                        cart.splice(index, 1);
                        console.log(cart);
                        rendercart();
                        $("#cartcount").css('display', 'flex').text(cart.length);

                        if (cart.length <= 0) {
                            $("#cartcount").css('display', 'none');
                        }
                    } else {
                        cart[index].count++;
                        $("#countitems" + index).text(cart[index].count);
                        rendercart();
                    }
                });
            }

            rendercart();
        }
    } else if (action == '+') {
        cart[index].count++;
        $("#countitems" + index).text(cart[index].count);
        rendercart();
    }

    // เรียกใช้ฟังก์ชัน calculateTotalPrice เพื่อคำนวณราคาทั้งหมด
    var totalPrice = calculateTotalPrice();
    console.log('Total Price:', totalPrice);
    // ตัวอย่างการแสดงราคาทั้งหมดใน Console
}


function removeCenterItem(index) {
    // ทำการลบวัตถุที่ต้องการใน cart ตาม index
    cart.splice(index, 1);

    // ทำการ render ตะกร้าใหม่
    rendercart();
}
function buynow() {
    var totalPrice = calculateTotalPrice();
    $.ajax({
        method: 'post',
        url: 'buynow.php',
        data: {
            totalPrice: totalPrice,
            product: cart
        }, success: function(response) {
            console.log(response)
            if(response.RespCode == 200) {
                Swal.fire({
                    icon: 'success',
                    title: 'Thank you',
                    html: `<p> Amount : ${response.Amount.Amount} THB</p>`
                           
                }).then((res) => {
                    if(res.isConfirmed) {
                        cart = [];
                        closeModal();
                        $("#cartcount").css('display','none')
                    }
                })
            }
            else {
                Swal.fire({
                    icon: 'error',
                    title: 'Something is went wrong!'
                })
            }
        }, error: function(err) {
            console.log(err)
        }
    })
}

