$(document).ready(function(){
    nextStudent();
  })

function nextStudent() {
    $(".js-next-student").on('click', function(event) {
        let nextId = parseInt($(".js-next-student").attr("data-id")) + 1;
        $.get("/students/" + nextId + ".json", function(data) {
            //pass data to load student
            $(".studentName").text(data["name"]);
            $(".studentCategory").text(data["category"]);
            $(".studentLevel").text(data["level"]);
            $(".js-next-student").attr("data-id", data["id"]);
        });
    });
}


