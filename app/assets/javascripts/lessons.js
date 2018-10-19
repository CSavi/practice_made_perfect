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
    
    $(document).on('click', '#js-sort-comments', function(e) {
    
        e.preventDefault();
        var id = $(this).data("lesson");
        $.get("/lessons/" + id + "/comments" + ".json", function(data) {
       
            data.sort(function(a, b){
                a_up = a.content.toUpperCase()
                b_up = b.content.toUpperCase()
                if(a_up < b_up){
                  return -1
                }
                if(a_up > b_up){
                  return 1
                }
                return 0;
              })
           // replace data-lesson with text in data:
           $("#comment-box").html("");
           data.forEach(function(comment) {
            $("#comment-box").append("<li>" + comment.content + "</li>")
           })
        })
    });
}

















   


   
