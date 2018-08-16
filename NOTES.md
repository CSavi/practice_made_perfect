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