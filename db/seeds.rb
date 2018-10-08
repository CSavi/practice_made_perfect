# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = Student.create!([{ name: 'Rowen', student_id: 1, level: 'Advanced', category: 'piano', song_name: 'May It Be'}, { name: 'Trev', student_id: 2, level: 'Beginner', category: 'voice', song_name: 'Crazy'}, { name: 'Benton', student_id: 3, level: 'advanced', category: 'cello', song_name: 'This My Sunshine'}])

instructors = Instructor.create!([
    { name: 'Mr. Allegro', email: 'allegro@test.com', password: 'password_1', category: 'piano'},
    { name: 'Ms. Octave', email: 'octave@test.com', password: 'password_2', category: 'voice' },
    { name: 'Ms. Motet', email: 'motet@test.com', password: 'password_3', category: 'cello' }
])

lessons = Lesson.create!([
    { instructor_id: 1, student_id: 1, description: 'Theory', lesson_datetime: DateTime.new(2018, 07, 17)},
    { instructor_id: 2, student_id: 1, description: 'Scales and Technique', lesson_datetime: DateTime.new(2018, 07, 22)},
    { instructor_id: 3, student_id: 2, description: 'Chord Progressions', lesson_datetime: DateTime.new(2018, 07, 8)}
])

assignments = Assignment.create!([
    { title: 'Assignment 1', lesson_hours: 23, lesson_planning_hours: 25, instructor_id: 1, created_at: DateTime.new(2018, 07, 17), updated_at: DateTime.new(2018, 8, 20)},
    { title: 'Assignment 2', lesson_hours: 14, lesson_planning_hours: 20, instructor_id: 1, created_at: DateTime.new(2018, 12, 18), updated_at: DateTime.new(2018, 12, 22)},
    { title: 'Assignment 3', lesson_hours: 2, lesson_planning_hours: 3, instructor_id: 1, created_at: DateTime.new(2018, 9, 10), updated_at: DateTime.new(2018, 9, 15)}
])
