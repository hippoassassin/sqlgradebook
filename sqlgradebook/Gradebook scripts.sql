SELECT * FROM hogwarts_project_schema.grades;

/*professor_grade_average*/

select  professor_name, avg(grade)
from grades
join professors on grades.prof_id_number = professors.professor_id
group by prof_id_number

/* course avg easiest to hardest*/

select course_name, avg(grade) as ag
from grades
join courses on grades.course = courses.course_id
group by course 
ORDER by ag desc;

/*top-grade-by-student*/

SELECT students_name, max(grade)
from grades
join students on grades.student = students.students_id
group by student

/* students grouped by courses*/

select students_name , course_name
from grades g
join students s 
	on g.student = s.students_id
join courses c
	on g.course = c.course_id
order by course

/*which student and professor most common courses*/

select count(course) as sharedclasses,
students_name, 
professor_name
from grades g
join students s
	on g.student = s.students_id
join professors p
	on g.prof_id_number = p.professor_id
group by student, prof_id_number 
order by sharedclasses desc