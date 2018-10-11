$(function(){
    nextStudent()
    previousStudent() 
  })

let nextStudent = function() {
    $(".js-next-student").on('click', function() {
        var nextId = $(this).data("data-id");
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
        var previousId = $(this).attr("data-id");
        $.get("/students/" + previousId + ".json", function(data) {
            $(".studentName").text(data["name"]);
            $(".studentCategory").text(data["category"]);
            $(".studentLevel").text(data["level"]);
            $(".js-previous-student").attr("data-id", data["id"]);
        });
    });
}