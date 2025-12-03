Modellizzare la struttura di un database per memorizzare tutti i dati riguardanti una università:
sono presenti diversi Dipartimenti (es.: Lettere e Filosofia, Matematica, Ingegneria ecc.);
ogni Dipartimento offre più Corsi di Laurea (es.: Civiltà e Letterature Classiche, Informatica, Ingegneria Elettronica ecc..)
ogni Corso di Laurea prevede diversi Corsi (es.: Letteratura Latina, Sistemi Operativi 1, Analisi Matematica 2 ecc.);
ogni Corso può essere tenuto da diversi Insegnanti;
ogni Corso prevede più appelli d'Esame;
ogni Studente è iscritto ad un solo Corso di Laurea;
ogni Studente può iscriversi a più appelli di Esame;
per ogni appello d'Esame a cui lo Studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente.
Pensiamo a quali entità (tabelle) creare per il nostro database e cerchiamo poi di stabilirne le relazioni. Infine, andiamo a definire le colonne e i tipi di dato di ogni tabella.



# tables
- dipartimenti
- corsi_di_laurea
- singolo_corso
- appelli
- insegnanti
- studenti


# table name: Dipartimenti (entity name:Dipartimento)

- id: BIGINT AUTO_INCREMENT UNIQUE NOT NULL
- name:  VARCHAR(25) NOT NULL
- corso_di_laurea_id BIGINT UNIQUE NOT NULL

# table name: corsi_di_laurea (entity name:corso_di_laurea)
- id: BIGINT AUTO_INCREMENT UNIQUE NOT NULL
- name: VARCHAR(25) NOT NULL
- corso_id BIGINT UNIQUE NOT NULL

# table name: corsi (entity name:corso)
- id: BIGINT AUTO_INCREMENT UNIQUE NOT NULL
- name: VARCHAR(25) NOT NULL
- insegnante_id: BIGINT UNIQUE NOT NULL
- studente_id:BIGINT UNIQUE NOT NULL

# table name: insegnanti (entity name:insegnante)
- id BIGINT AUTO_INCREMENT UNIQUE NOT NULL
- name: VARCHAR(10) NOT NULL
- surname: VARCHAR(10) NOT NULL
- email: VARCHAR(30) NOT NULL

# table name: studenti (entity name: studente)
- id AUTO_INCREMENT UNIQUE NOT NULL
- name: VARCHAR(10) NOT NULL
- surname: VARCHAR(10) NOT NULL
- email: VARCHAR(30) NOT NULL
- code: MEDIUMINT NOT NULL

# table name: appelli (entity name: appello)
- id AUTO_INCREMENT UNIQUE NOT NULL
- corso_id BIGINT UNIQUE NOT NULL
- studente_id:BIGINT UNIQUE NOT NULL
- vote: TINYINT NOT NULL
