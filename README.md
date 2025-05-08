# 🎓 University Database – Relational Schema

Questo progetto contiene lo schema relazionale di un database universitario, modellato per gestire in modo efficace studenti, corsi, esami, docenti, dipartimenti e corsi di laurea.

## 📌 Obiettivo

Il database è progettato per:
- Tracciare iscrizioni e dati anagrafici degli studenti
- Gestire i corsi e i relativi esami
- Collegare docenti ai corsi che insegnano
- Organizzare i corsi di laurea nei rispettivi dipartimenti
- Supportare interrogazioni complesse su carriera accademica, voti, insegnamenti e strutture

---

## 🧱 Struttura delle Tabelle Principali

### `students`
Contiene i dati anagrafici degli studenti e il corso di laurea di appartenenza.

| Campo              | Tipo       | Descrizione                        |
|--------------------|------------|------------------------------------|
| student_id         | INT (PK)   | Identificativo univoco             |
| degree_id          | INT (FK)   | Corso di laurea di iscrizione      |
| name               | VARCHAR    | Nome dello studente                |
| surname            | VARCHAR    | Cognome                            |
| date_of_birth      | DATE       | Data di nascita                    |
| fiscal_code        | VARCHAR    | Codice fiscale                     |
| registration_number| VARCHAR    | Matricola                          |
| email              | VARCHAR    | Email istituzionale                |

---

### `degrees`
Contiene le informazioni sui corsi di laurea.

| Campo         | Tipo       | Descrizione                   |
|---------------|------------|-------------------------------|
| degree_id     | INT (PK)   | Identificativo univoco        |
| department_id | INT (FK)   | Dipartimento di riferimento   |
| name          | VARCHAR    | Nome del corso di laurea      |
| level         | VARCHAR    | Triennale / Magistrale        |
| website       | VARCHAR    | Sito ufficiale del corso      |

---

### `departments`
Elenco dei dipartimenti universitari.

| Campo     | Tipo     | Descrizione              |
|-----------|----------|--------------------------|
| department_id | INT (PK) | Identificativo        |
| name      | VARCHAR  | Nome del dipartimento    |
| address   | VARCHAR  | Indirizzo                |
| phone     | VARCHAR  | Recapito telefonico      |

---

### `teachers`
Anagrafica dei docenti.

| Campo         | Tipo     | Descrizione            |
|---------------|----------|------------------------|
| teacher_id    | INT (PK) | Identificativo         |
| name          | VARCHAR  | Nome                   |
| surname       | VARCHAR  | Cognome                |
| phone         | VARCHAR  | Numero di telefono     |
| email         | VARCHAR  | Email istituzionale    |
| office_number | VARCHAR  | Numero ufficio         |

---

### `courses`
Contiene l'elenco degli insegnamenti.

| Campo       | Tipo     | Descrizione                  |
|-------------|----------|------------------------------|
| course_id   | INT (PK) | Identificativo               |
| degree_id   | INT (FK) | Corso di laurea di riferimento |
| description | TEXT     | Descrizione del corso        |
| year        | INT      | Anno del corso               |
| period      | VARCHAR  | Periodo / semestre           |
| cfu         | INT      | Crediti formativi (CFU)      |

---

### `exams`
Rappresenta gli appelli d'esame legati ai corsi.

| Campo     | Tipo     | Descrizione                |
|-----------|----------|----------------------------|
| exam_id   | INT (PK) | Identificativo univoco     |
| course_id | INT (FK) | Insegnamento dell’esame    |
| date      | DATE     | Data dell’appello          |
| hour      | TIME     | Orario dell’esame          |
| location  | VARCHAR  | Aula o sede dell’esame     |

---

### `course_teacher` (Tabella ponte)
Relazione molti-a-molti tra insegnamenti e docenti.

| Campo       | Tipo     | Descrizione                     |
|-------------|----------|---------------------------------|
| course_id   | INT (FK) | Corso insegnato                 |
| teacher_id  | INT (FK) | Docente che insegna             |

---

### `exam_student` (Tabella ponte)
Tiene traccia degli studenti che sostengono esami e dei voti ricevuti.

| Campo       | Tipo     | Descrizione                     |
|-------------|----------|---------------------------------|
| exam_id     | INT (FK) | Appello sostenuto               |
| student_id  | INT (FK) | Studente                        |
| grade       | INT      | Voto conseguito                 |

---

