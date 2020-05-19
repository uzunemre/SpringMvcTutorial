function addToBasket(productId, quantity) {
    var data = {};
    data["productId"] = productId;
    data["quantity"] = quantity;
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: 'api/basket',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (data) {
            alert("Başarılı bir şekilde eklendi");
        },
        error: function (e) {
            console.log(e);
            alert("Bir hata meydana geldi", e);
        }
    });
}

function deleteBasket(productId) {
    var data = {};
    data["productId"] = productId;
    $.ajax({
        type: "DELETE",
        contentType: "application/json",
        url: 'api/basket',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (data) {
            alert("Başarılı bir şekilde silindi");
            location.reload();
        },
        error: function (e) {
            console.log(e);
            alert("Bir hata meydana geldi", e);
        }
    });
}

function showBasket() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'api/basket',
        success: function (data) {
            var innerHTML = "";
            $.each(data, function (index, value) {
                innerHTML += "<li>" + value.name + "</li>";
            });
            $("#basketContent").html(innerHTML);
        },
        error: function (e) {
            console.log(e);
            alert("Bir hata meydana geldi", e);
        }
    });
}

