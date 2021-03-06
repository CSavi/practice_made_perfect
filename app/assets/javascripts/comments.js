$(document).ready(function() {
    attachListener();
    renderComments();
});


const Comment = function(data) {
    this.id = data.id;
    this.content = data.content;
    this.lessonId = data.lesson_id;
};


function renderComments() {
    if (document.querySelector("div#lesson-comments")) {
        
        var lessonId = $("#lesson-comments").attr("data-lesson")
        $.get("/lessons/" + lessonId + "/comments.json", function(data) {
            data.forEach(function(comment) {
                $("#comment-box").append("<li class='col-12 comment box'>" + comment["content"] + "</li>")
            })
        })
    }
}


var attachListener = function() {
    $(document).on('submit', 'form#new_comment', function(e) {
        e.preventDefault();
        let $form = $(this);
        let action = $form.attr("action");
        let params = $form.serialize();
        
        $.ajax({
            url: action,
            data: params,
            dataType: "json",
            type: "POST",
            success: function(response) {
           
                $("#comment_content").val("");
                $("#commentSection").append(response);
                // let thisComment = new Comment(response);
                // let attachComment = thisComment.renderComments();
                // $("#comment-box").append(attachComment);

            }
        });
    });
}











