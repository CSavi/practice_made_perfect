class Lesson {
    constructor(attr) {
        this.id = attr.id;
        this.description = attr.description;
        this.lesson_datetime = attr.lesson_datetime;
        this.student_id = attr.student_id;
        this.instructor_id = attr.instructor_id;
        this.comments = attr.comments;
    }
}

$(document).ready(function() {
    attachSortListener();
    // sortList();
});


const attachSortListener = function() {
    
    $('#js-sort-comments').on('click', function(e) {
        var id = $(this).data("id");
        $.get("/lessons" + id + "/comments" + ".json", function(data) {
            $(data).sort(function(a, b) {
                return $(a).text() < $(b).text() ? 1 : -1;
            });
            $("data-lesson").text(data);
        })
        // var $sort = $(this);
        // var action = $sort.attr("action");
        // var params = $sort.serialize();

        // $.ajax({
        //     url: action,
        //     data: params,
        //     dataType: "json",
        //     type: "GET",
        //     success: function(data) {
        //         $(data).sort(function(a,b) {
        //             return $(a).text() < $(b).text() ? 1 : -1;
        //         });
        //     }
        // })
        e.preventDefault();
    });
}

// const attachSortListener = function() {
//     var options = $("#comment-box");
//     options.detach().sort(function(a,b) {
//         var at = $(a).text();
//         var bt = $(b).text();
//         return (at > bt)? 1 : ((at < bt)? -1 : 0);
//     })
//     options.appendTo("#js-sort-comments")
// }




// const attachSortListener = function() {
//     $("#js-sort-comments").on('click', function() {
//         let lessonId = $(this).data("lesson")
     
//         $.get("/lessons/" + lessonId + "/comments.json", function(data) {
//             $(data).sort(function(a,b) {
//                 return $(a).html() < $(b).html() ? 1 : -1;
//             });
//         });
//     });
// }
















   


   
