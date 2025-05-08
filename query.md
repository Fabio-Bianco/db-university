
# Query SQL - Università

Questo file contiene una serie di query SQL basate sul modello E-R del database universitario, utili per esercitazioni accademiche o sviluppo backend.

---

## 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

```sql
SELECT *
FROM students s
JOIN degrees d ON s.degree_id = d.id
WHERE d.name = 'Economia';

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT d.*
FROM degrees d
JOIN departments dep ON d.department_id = dep.id
WHERE d.level = 'Magistrale'
  AND dep.name = 'Neuroscienze';

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id = 44)

SELECT c.*
FROM courses c
JOIN course_teacher ct ON c.id = ct.course_id
WHERE ct.teacher_id = 44;

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea e al dipartimento, ordinati per cognome e nome

SELECT s.*, d.name AS degree_name, dep.name AS department_name
FROM students s
JOIN degrees d ON s.degree_id = d.id
JOIN departments dep ON d.department_id = dep.id
ORDER BY s.surname, s.name;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT d.name AS degree_name, c.name AS course_name, t.name AS teacher_name, t.surname AS teacher_surname
FROM degrees d
JOIN courses c ON c.degree_id = d.id
JOIN course_teacher ct ON c.id = ct.course_id
JOIN teachers t ON ct.teacher_id = t.id;


6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (id = 54)

SELECT DISTINCT t.*
FROM teachers t
JOIN course_teacher ct ON t.id = ct.teacher_id
JOIN courses c ON ct.course_id = c.id
JOIN degrees d ON c.degree_id = d.id
WHERE d.department_id = 54;


1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date) AS year, COUNT(*) AS total_students
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY year;

2. Contare gli insegnanti che hanno ufficio nello stesso edificio

SELECT office_address, COUNT(*) AS num_teachers
FROM teachers
GROUP BY office_address
HAVING COUNT(*) > 1;

3. Calcolare la media dei voti di ogni appello desame

SELECT e.id AS exam_id, AVG(v.vote) AS avg_vote
FROM vote v
JOIN exams e ON v.exam_id = e.id
GROUP BY e.id;

4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT dep.name AS department_name, COUNT(d.id) AS total_degrees
FROM departments dep
JOIN degrees d ON d.department_id = dep.id
GROUP BY dep.id;

