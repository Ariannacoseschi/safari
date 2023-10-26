DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);


CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES staff(id),
    enclosureId INT REFERENCES enclosure(id),
    day VARCHAR(255)
);

CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES  enclosure(id)
);