# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cursada2016 = Grade.create(year: 2016)
cursada2017 = Grade.create(year: 2017) 
 
student_list = [
  [ "tito1@sample.com", "Perez", "Timoteo", 777, 200 ],
  [ "tito2@sample.com", "Gomez", "Timoteo", 778, 201 ],
  [ "tito3@sample.com", "Dominguez", "Timoteo", 779, 202 ],
  [ "tito4@sample.com", "Gerez", "Timoteo", 780, 203 ],
  [ "tito5@sample.com", "Benitez", "Timoteo", 781, 204 ],
]
list2016 = []
student_list.each do |email, last_name, first_name, document_number, docket_number|
  a = Student.create(email: email, last_name: last_name, first_name: first_name, document_number: document_number, docket_number: docket_number, grade_id: cursada2016.id)
  list2016.push(a.id)
end

student_list = [
  [ "one@example.com", "Perez", "Laura", 1777, 3200 ],
  [ "two@example.com", "Gomez", "Timoteo", 778, 201 ],
  [ "three@example.com", "Dominguez", "Jimena", 1779, 3202 ],
  [ "for@example.com", "Gerez", "Susana", 1780, 3203 ],
  [ "five@example.com", "Benitez", "Lucas", 1781, 3204 ],
]
list2017 = []
student_list.each do |email, last_name, first_name, document_number, docket_number|
  a = Student.create(email: email, last_name: last_name, first_name: first_name, document_number: document_number, docket_number: docket_number, grade_id: cursada2017.id)
  list2017.push(a.id)
end

docente1 = Professor.create(email: 'Admin@admin', password: '123456') 

exam_list = [
  [ "1er Parcial", '2016-08-09 20:00:00', 7.00 ],
  [ "2do Parcial", '2016-12-20 20:00:00', 7.00  ],
  [ "Trabajo", '2017-02-10 22:00:00', 8.00  ],
]
exam = []
exam_list.each do |title, exam_date, min_score|
  a = ExamInstance.create( title: title, exam_date: exam_date, min_score: min_score, grade_id: cursada2016.id )
  exam.push(a.id)
end

exam_list = [
  [ "1er Parcial", '2017-09-20 08:45:00', 6.00 ],
  [ "2do Parcial", '2017-11-10 20:45:00', 6.00  ],
  [ "Trabajo", '2017-12-28 22:00:00', 7.00  ],
]

exam_list.each do |title, exam_date, min_score|
  a = ExamInstance.create( title: title, exam_date: exam_date, min_score: min_score, grade_id: cursada2017.id )
  exam.push(a.id)
end

Result.create(score: 10, student_id: list2016[1], exam_instance_id: exam[0])
Result.create(score: 6, student_id: list2016[1], exam_instance_id: exam[1])
Result.create(score: 1, student_id: list2016[1], exam_instance_id: exam[2])

Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[0])
Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[1])
Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[2])

Result.create(score: 8, student_id: list2016[3], exam_instance_id: exam[0])
Result.create(score: 3, student_id: list2016[3], exam_instance_id: exam[1])


Result.create(score: 10, student_id: list2016[1], exam_instance_id: exam[3])
Result.create(score: 6, student_id: list2016[1], exam_instance_id: exam[4])
Result.create(score: 1, student_id: list2016[1], exam_instance_id: exam[5])

Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[3])
Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[4])
Result.create(score: 8, student_id: list2016[2], exam_instance_id: exam[5])

Result.create(score: 8, student_id: list2016[3], exam_instance_id: exam[3])
Result.create(score: 3, student_id: list2016[3], exam_instance_id: exam[4])


