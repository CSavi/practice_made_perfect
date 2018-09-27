$(document).ready(function(){
    moreDescription();
    deleteComment();
  })

$(function() {
    $("#new_comment").on('submit', '.btn btn-primary', function(e) {
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(response) {
                $("#comment_content").val(""); //empty textarea
                $("#comment-box").append(response);
            }
        });
        e.preventDefault();
    });
})

$(function() {
    if (document.querySelector("div#lesson-comments")) {
        let lessonId = $("#lesson-comments").attr("data-lesson")
        
        $.get("/lessons/" + lessonId + "/comments.json", function(data) {
            data.forEach(function(comment) {
    
                $("#comment-box").append("<li class='h4 col-12 comment-box'>" + comment["content"] + "</li>")
            });
        });
    }
})

let deleteComment = function() {
    $("#submitted-comments").on('click', '.deleteComment', function(e) {
        e.preventDefault();
        let id = $(this).data("id");
        let deleteUrl = "/comments/" + id;
        $.ajax({
            url: deleteUrl,
            type: "POST", 
            data: {"_method": "DELETE"}
        })
    })
}







   


   
