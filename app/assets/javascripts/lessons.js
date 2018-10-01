// $(document).ready(function(){
//     moreDescription();
//     deleteComment();
//   })

// $(function() {
//     if (document.querySelector("div#lesson-comments")) {
//         let lessonId = $("#lesson-comments").attr("data-lesson")
        
//         $.get("/lessons/" + lessonId + "/comments.json", function(data) {  // AJAX get request 
//             data.forEach(function(comment) {
    
//                 $("#comment-box").append("<li class='h4 col-12'>" + comment["content"] + "</li>")
//             });
//         });
//     }
// })  


// $(function() {
//     $("form#new_comment").on('submit', '.btn btn-primary', function(e) {
//         // get data tp submit form correctly
//         e.preventDefault();
//         $.ajax({
//             method: "POST",                // this is a POST request
//             url: this.action ,           // this refers to whatever triggered the action
//             data: $(this).serialize(),   // convert json string
//             dataType: "json",
//             // success: function(response) {
//             //     $("#comment_content").val(""); //empty textarea
//             //     $("ul#comment-box").append(response);
//             // }
//         }).done(function(data) {
//             // instantiate a comment object
//             let comment = new Comment(data);

//             comment.createCommentsDiv();

//             comment.clearFormFields();

//         });
//     });
// });

// function Comment(data) {
//     this.id = data.id;
//     this.content = data.content;
//     this.lessonId = data.lesson_id;
// }

// Comment.prototype.createCommentsDiv = function(){
//     let html = "";
//     html +=
//     `<div class="row">
//         <p>${this.content}</p>
//         <a href="#" class="btn btn-link deleteComment" data-id="<%=comment.id %>" data-lesson-id="<%=comment.lesson_id %>">Delete Comment</a>
//     </div>`
// $("#submitted-comments").append(html);
// };

// Comment.prototype.clearFormFields = function() {
//     $("#comment_content").val("");
// }



// $(function() {
//     if (document.querySelector("div#lesson-comments")) {
//         let lessonId = $("#lesson-comments").attr("data-lesson");
//         let commentId = $("#comment-<%= comment.id %>");
        
//         $.getJSON("/lessons/" + lessonId + "/comments.json" + commentId, function(data) {
//             data.forEach(function(comment) {
    
//                 $("#comment-box").append("<li class='h4 col-12'>" + comment["content"] + "</li>")
//             });
//         });
//     }
// })

// let deleteComment = function() {
//     $("#submitted-comments").on('click', '.deleteComment', function(e) {
//         e.preventDefault();
//         let id = $(this).data("id");
//         let deleteUrl = "/comments/" + id;
//         $.ajax({
//             url: deleteUrl,
//             type: "POST", 
//             data: {"_method": "DELETE"}
//         })
//     })
// }







   


   
