const Comment = function(data) {
    this.id = data.id;
    this.content = data.content;
    this.lessonId = data.lesson_id;
};


// Comment.prototype.deleteLink = function() {
//     let output = '<a class="btn btn-link deleteComment" data-method="delete" href="/lessons/:lesson_id/comments/' +  this.id + '">';
//         output += '</a>'
// }


Comment.prototype.renderComment = function(){
    let html = "";
    html += '<ul class="list-unstyled" id="comment-" + comment.id >';
    html += '<li>' + this.content + '</li>';
    html += '</ul>';
    return html;
};

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
               console.log(response)
                $("#comment_content").val("");
                let comment = new Comment(response);
                let attachComment = comment.renderComment();
                console.log(attachComment)
                $("#commentSection").append(attachComment);
            }
        });
    });
}

$(document).ready(function() {
    attachListener();
});









