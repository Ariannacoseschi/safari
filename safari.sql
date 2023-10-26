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
    enclosureId INT REFERENCES  enclosure(id)
);


INSERT INTO staff(name, employeeNumber) VALUES('Arianna',4);
INSERT INTO staff(name, employeeNumber) VALUES('Rosie',7);
INSERT INTO staff(name, employeeNumber) VALUES('Thomas',2);

INSERT INTO enclosure(name,capacity,closedForMaintenance) VALUES('Lions Den',30, true);
INSERT INTO enclosure(name,capacity,closedForMaintenance) VALUES('Shark Tank',60, true);

INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 1,1, 'Monday');
INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 2,2, 'Friday');
INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 2,3, 'Thursday');

INSERT INTO animal(name,type,age,enclosureId) VALUES('Zsolt','Shark',34,2);
INSERT INTO animal(name,type,age,enclosureId) VALUES('Colin','Lion',35,1);
INSERT INTO animal(name,type,age,enclosureId) VALUES('Anna','Lioness',30,1);

