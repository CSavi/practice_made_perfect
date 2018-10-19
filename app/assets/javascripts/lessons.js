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
});


const attachSortListener = function() {
    $("#js-sort-comments").on('click', function(e) {
        var $sort = this;
        var $list = $("#js-sort-comments");
        var $listUl = $("ul#comment-box");
        $listUl.sort(function(a,b) {
            var keyA = $(a).text();
            var keyB = $(b).text();
           
            return (keyA > keyB) ? 1 : 0;
        });
        // $.each($listUl, function(index, row) {
        //     $listUl.append(row);
        // });
        e.preventDefault();
    });
}


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



   
    //lesson#show => json response render comments
    //mdn reference 














   


   
