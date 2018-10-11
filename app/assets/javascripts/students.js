$(function(){
    nextStudent()
    previousStudent() 
  })

let nextStudent = function() {
    $(".js-next-student").on('click', function() {
        var nextId = $(this).data("next");
        nextId =+ 1;
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
        var previousId = $(this).data("previous");
        $.get("/students/" + previousId + ".json", function(data) {
            $(".studentName").text(data["name"]);
            $(".studentCategory").text(data["category"]);
            $(".studentLevel").text(data["level"]);
            $(".js-previous-student").attr("data-id", data["id"]);
        });
    });
}