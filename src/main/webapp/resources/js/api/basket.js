function addToBasket(productId) {
    var data = {};
    data["productId"] = productId;
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: 'api/basket/add',
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

function showBasket() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: 'api/basket/list',
        success: function (data) {
            var innerHTML = "";
            $.each(data, function (index, value) {
                innerHTML += "<li>" + value.name + "</li>";
            });
            $("#basketContent").html(innerHTML);
        },
        error: function (e) {
            console.log(e);
        }
    });
}