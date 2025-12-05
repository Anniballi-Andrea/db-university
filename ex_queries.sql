1#Selezionare tutti gli studenti nati nel 1990 (160)

/SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

2#Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT*
FROM `courses`
WHERE `cfu` > 10

3#Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) < 1995;

4#Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT *
FROM `courses`
WHERE `year` =1
AND `period` = "I semestre"

5#Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)'

SELECT *
FROM `exams`
WHERE hour(`hour`) > 13
AND `date` = "2020-06-20"

6#Selezionare tutti i corsi di laurea magistrale (38)

SELECT *
FROM `degrees`
WHERE `name` LIKE "Corso di Laurea Magistrale%"

7#Da quanti dipartimenti è composta l'università? (12)'

SELECT COUNT(id)
FROM `departments`


8#Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(id)
FROM `teachers`
WHERE `phone` IS null

#-------------ex_2_query_group--------------

#Contare quanti iscritti ci sono stati ogni anno

SELECT  COUNT(id),YEAR(`enrolment_date`)

FROM `students`
GROUP BY YEAR(`enrolment_date`)

#Contare gli insegnanti che hanno l'ufficio nello stesso edificio'

SELECT COUNT(id), `office_address`
FROM `teachers`
GROUP BY `office_address`

#Calcolare la media dei voti di ogni appello d'esame'

SELECT AVG(`vote`)
FROM `exam_student`

#Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT count(`id`), `degree_id`
FROM `courses`
group by `degree_id`

-------------Day_Twoo--------------

#1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name` AS `degree_name`
FROM `students`
JOIN `degrees`
WHERE `degrees`.`name`= "Corso di Laurea in Economia"


#2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.`id` AS `id`, `degrees`.`name` AS `degree_name`, `degrees`.`level`, `departments`.`name` AS `deèartment_name`
FROM `degrees`
JOIN `departments`
WHERE `departments`.`name` ="Dipartimento di Neuroscienze"
AND `degrees`.`level`= "Magistrale"

#3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `degrees`.`id` AS `id`, `degrees`.`name` AS `degrees_name`,
 `teachers`.`name` AS `teachers_name`, `teachers`.`surname` AS `teachers_surname`, `teachers`.`id` AS `teachers_id`
FROM `degrees`
JOIN `teachers`
WHERE `teachers`.`name` = "Fulvio"
AND `teachers`.`surname`= "Amato"

/*4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome*/

SELECT `students`.`id` AS `id`, `students`.`name` AS `student_name`, `students`.`surname` AS `student_surname`, `degrees`.`name` AS `degree_name`, `departments`.`name` AS `department_name` 
FROM `students`
JOIN `degrees`
JOIN `departments`
WHERE `students`.`degree_id`= `degrees`.`id`
AND `degrees`.`department_id` = `departments`.`id`
ORDER BY `student_surname` ASC, `student_name` ASC

#5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`id` AS `id`, `degrees`.`name` AS `degree_name`, `courses`.`name` AS `course_name`, `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname`
FROM `degrees`
JOIN `courses` ON `courses`.`degree_id` =`degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id`=`courses`.`id`
JOIN `teachers` ON`teachers`.`id` = `course_teacher`.`teacher_id`

#6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`id` AS `id`, `teachers`.`name` AS `name`, `teachers`.`surname` AS `surname`, `departments`.`name`
FROM `teachers`
JOIN `course_teacher` ON `course_teacher`.`teacher_id`= `teachers`.`id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name`= "Dipartimento di Matematica"
GROUP BY `id`