# 📚 Query SQL - Università

## 🔗 QUERY JOIN

### ✅ Studenti iscritti al Corso di Laurea in Economia

```sql
SELECT *
FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'Economia';
```

---

### ✅ Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

```sql
SELECT degrees.*
FROM degrees
JOIN departments ON degrees.department_id = departments.id
WHERE degrees.level = 'Magistrale'
  AND departments.name = 'Neuroscienze';
```

---

### ✅ Corsi in cui insegna Fulvio Amato (id = 44)

```sql
SELECT courses.*
FROM courses
JOIN course_teacher ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;
```

---

### ✅ Studenti con corso di laurea e dipartimento (ordinati per cognome e nome)

```sql
SELECT students.*, degrees.name AS degree_name, departments.name AS department_name
FROM students
JOIN degrees ON students.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;
```

---

### ✅ Corsi di laurea con relativi corsi e docenti

```sql
SELECT
  degrees.name AS degree_name,
  courses.name AS course_name,
  teachers.name AS teacher_name,
  teachers.surname AS teacher_surname
FROM degrees
JOIN courses ON courses.degree_id = degrees.id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id;
```

---

### ✅ Docenti che insegnano nel Dipartimento di Matematica (id = 54)

```sql
SELECT DISTINCT teachers.*
FROM teachers
JOIN course_teacher ON teachers.id = course_teacher.teacher_id
JOIN courses ON course_teacher.course_id = courses.id
JOIN degrees ON courses.degree_id = degrees.id
WHERE degrees.department_id = 54;
```

---

## 📊 QUERY GROUP

### ✅ Numero di iscritti per anno

```sql
SELECT
  YEAR enrolment_date AS year,
  COUNT * AS total_students
FROM students
GROUP BY YEAR enrolment_date
ORDER BY year

```

---

### ✅ Insegnanti con ufficio nello stesso edificio

```sql
SELECT
  office_address,
  COUNT * AS number_of_teachers
FROM teachers
GROUP BY office_address
HAVING COUNT * > 1

```

---

### ✅ Media voti per ogni appello d’esame

```sql
SELECT
SELECT
  exams.id AS exam_id,
  AVG vote.vote AS average_vote
FROM vote
JOIN exams ON vote.exam_id = exams.id
GROUP BY exams.id

```

---

### ✅ Numero di corsi di laurea per dipartimento

```sql
SELECT
  departments.name AS department_name,
  COUNT degrees.id AS total_degrees
FROM departments
JOIN degrees ON degrees.department_id = departments.id
GROUP BY departments.id
```

## ✅ BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18

```sql
SELECT  
  students.name AS student_name,  
  students.surname AS student_surname,  
  exams.id AS exam_id,  
  COUNT(exam_student.exam_id) AS total_attempts,  
  MAX(exam_student.vote) AS highest_vote,  
  MIN(exam_student.vote) AS low_vote  
FROM students  
JOIN exam_student ON students.id = exam_student.student_id  
JOIN exams ON exams.id = exam_student.exam_id  
GROUP BY students.id, exams.id  
HAVING MIN(exam_student.vote) >= 18  


```
