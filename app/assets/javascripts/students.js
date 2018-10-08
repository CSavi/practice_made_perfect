$(function(){
    nextStudent()
    previousStudent() 
  })

let nextStudent = function() {
    $(".js-next-student").on('click', function() {
        var nextId = parseInt($(".js-next-student").attr("data-id")) + 1;
        $.get("/students/" + nextId + ".json", function(data) {
            $(".studentName").text(data["name"]);
            $(".studentCategory").text(data["category"]);
            $(".studentLevel").text(data["level"]);
            $(".js-next-student").attr("data-id", data["id"]);
        });
    });
}

let previousStudent = function() {
    $(".js-previous-student").on('click', function() {
        var previousId = parseInt($(".js-previous-student").attr("data-id")) - 1;
        $.get("/students/" + previousId + ".json", function(data) {
            $(".studentName").text(data["name"]);
            $(".studentCategory").text(data["category"]);
            $(".studentLevel").text(data["level"]);
            $(".js-previous-student").attr("data-id", data["id"]);
        });
    });
}