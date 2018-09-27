Enables music instructors to create and track learning/progress for students between lessons.

Models:
1. Instructor: has many lessons; has many students through lessons; has many assignents; has secure password
2. Student: has many lessons; has many instructors through lessons
3. Lesson: belongs to instructor and student
4. Assignment: belongs to instructor

Tables for Models:
1. Instructor attrs: name, password_digest
2. Student attrs: name, type, level, student_id
3. Lesson attrs: description, lesson_datetime, student_id, instructor_id
4. Assgmt attrs: title, lesson_hours, lesson_planning_hours, created_at, udpated_at instructor_id

Controllers:
1. Instructors
2. Students
3. Lessons
4. Assignments
5. Sessions
6. Welcome

Views:

Future Development:
1. Enable students to gauge their performance and progress directly from instructor's assessments. Students can message with their instructors directly through their app. Students can record/upload songs, view sheet music added by instructor, and record their practice time for the day/week for instructors to review.
2. Create challenges for students to compete based off their practice times. Award students who dedicate good practice time with badges.
3. Create admin view -enable admin only to delete lessons
for lesson_form add, link_to "Delete Lesson", [@instructor, @lesson], method: :delete, data: { confirm: "Delete Lesson?" }
4. Show each instructor's lessons through their show page
5. Show each student's lessons on their show page
students/:id/lessons/:id
6. Use pundit for additional authorization records


The Ability to Submit a Comment
1. Hijack the submit event of our form
2. Take the form data and send it to the server as an AJAX post
3. Take the data from the AJAX post request and create corresponding comment
4. Send back HMTL/JSON/JS of the comment that was added and inject that comment into the comment OL on the DOM