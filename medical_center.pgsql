DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_first_name TEXT NOT NULL,
    patient_last_name TEXT NOT NULL,
    insurance VARCHAR(20)
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors ON DELETE SET NULL,
    patient_id INT REFERENCES patients ON DELETE SET NULL,
    date TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES appointments ON DELETE SET NULL,
    first_disease_present INT REFERENCES diseases ON DELETE SET NULL,
    second_disease_present INT REFERENCES diseases ON DELETE SET NULL
);



INSERT INTO doctors (id, doctor_name)
VALUES 
(1, 'Dr. Jenkins'),
(2, 'Dr. Scooby');


INSERT INTO patients (id, patient_first_name, patient_last_name, insurance)
VALUES 
(1, 'Goldie', 'Doo', 'puppy insurance co'),
(2, 'Tubby', 'Williams', 'ground shrimp inc');

INSERT INTO diseases (id, name)
VALUES 
(1, 'baddogitis'),
(2, 'heartworm'),
(3, 'itchy paws');

INSERT INTO appointments (id, doctor_id, patient_id, date)
VALUES 
(1, 1, 2, '08-20-2022'),
(2, 2, 1, '07-21-2022');

INSERT INTO diagnosis (id, appointment_id, first_disease_present, second_disease_present)
VALUES 
(1, 1, 1 , 3);

INSERT INTO diagnosis (id, appointment_id, first_disease_present)
VALUES
(2, 2, 2);

