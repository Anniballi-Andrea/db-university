#Selezionare tutti gli studenti nati nel 1990 (160)

/*SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;*/

#Selezionare tutti i corsi che valgono più di 10 crediti (479)
/*SELECT*
FROM `courses`
WHERE `cfu` > 10*/

#Selezionare tutti gli studenti che hanno più di 30 anni
/*SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) < 1995;*/

#Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

/*SELECT *
FROM `courses`
WHERE `year` =1
AND `period` = "I semestre"*/

#Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)'

/*SELECT *
FROM `exams`
WHERE hour(`hour`) > 13
AND `date` = "2020-06-20"*/

#Selezionare tutti i corsi di laurea magistrale (38)

/*SELECT *
FROM `degrees`
WHERE `name` LIKE "Corso di Laurea Magistrale%"*/

#Da quanti dipartimenti è composta l'università? (12)'

/*SELECT COUNT(id)
FROM `departments`*/


#Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

/*SELECT COUNT(id)
FROM `teachers`
WHERE `phone` IS null*/

#-------------ex_2_query_group--------------

#Contare quanti iscritti ci sono stati ogni anno

SELECT  COUNT(id),YEAR(enrolment_date)
FROM `students`
GROUP BY YEAR(enrolment_date)