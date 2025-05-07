# 📚 SQL Queries Reference

## ✅ Selezionare tutti gli studenti nati nel 1990 (160)
```sql
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;
```

---

## ✅ Selezionare tutti i corsi che valgono più di 10 crediti (479)
```sql
SELECT *
FROM `courses`
WHERE `cfu` > 10;
```

---

## ✅ Selezionare tutti gli studenti che hanno più di 30 anni

### ▶️ Versione base
```sql
SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;
```

### ▶️ Versione con colonna età
```sql
SELECT 
  *,
  TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) AS `age`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;
```

---

## ✅ Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
```sql
SELECT *
FROM `courses`
WHERE `year` = 1 AND `period` LIKE '%1%';
```

---

## ✅ Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
```sql
SELECT *
FROM `exams`
WHERE `date` = '2020-06-20' AND `time` > '14:00:00';

 (versione con fn hour)
SELECT *
FROM `exams`
WHERE `date` = '2020-06-20' AND HOUR(`time`) > 14;

```

---

## 🟡 Selezionare tutti i corsi di laurea magistrale (38)
```sql

SELECT *
FROM `degree_courses`
WHERE `level` = 'magistrale';


SELECT *
FROM `degree_courses`
WHERE `cycle` = 2;
```

---

## ✅ Da quanti dipartimenti è composta l'università? (12)
```sql
SELECT COUNT(*) AS `department_count`
FROM `departments`;
```

---

## ✅ Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
```sql
SELECT *
FROM `teachers`
WHERE `phone` IS NULL OR `phone` = '';
```
