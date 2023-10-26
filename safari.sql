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

INSERT INTO enclosure(name,capacity,closedForMaintenance) VALUES('Lions Den',30, 'true');
INSERT INTO enclosure(name,capacity,closedForMaintenance) VALUES('Shark Tank',60, 'true');

INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 1,1, 'Monday');
INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 2,2, 'Friday');
INSERT INTO assignment(enclosureId,employeeId,day) VALUES( 2,3, 'Thursday');

INSERT INTO animal(name,type,age,enclosureId) VALUES('Zsolt','Shark',34,2);
INSERT INTO animal(name,type,age,enclosureId) VALUES('Colin','Lion',35,1);
INSERT INTO animal(name,type,age,enclosureId) VALUES('Anna','Lioness',35,1);

SELECT enclosure.name, animal.name FROM enclosure
INNER JOIN animal
ON enclosure.id = animal.enclosureId;

SELECT staff.name, enclosure.name 
FROM staff
INNER JOIN assignment
ON staff.id = assignment.employeeId
INNER JOIN enclosure
ON enclosure.id = assignment.enclosureId;

SELECT staff.name, enclosure.name 
FROM staff
INNER JOIN assignment
ON staff.id = assignment.employeeId
INNER JOIN enclosure
ON enclosure.id = assignment.enclosureId
WHERE enclosure.closedForMaintenance = true;

SELECT enclosure.name, animal.age, animal.name FROM enclosure
INNER JOIN animal
ON enclosure.id = animal.enclosureId
ORDER BY animal.age DESC, animal.name;

SELECT COUNT(DISTINCT animal.type)
FROM assignment
INNER JOIN animal
ON assignment.enclosureId = animal.enclosureId
INNER JOIN staff
ON assignment.employeeID = staff.id
WHERE staff.name = 'Arianna';

SELECT COUNT(DISTINCT staff)
FROM assignment
INNER JOIN enclosure
ON assignment.enclosureId = enclosure.id
INNER JOIN staff
ON assignment.employeeID = staff.id
WHERE enclosure.name = 'Shark Tank';

SELECT enclosure.name
FROM animal
INNER JOIN enclosure
ON animal.enclosureId = enclosure.id
WHERE animal.name = 'Colin';

SELECT animal.name 
FROM animal
INNER JOIN enclosure
ON animal.enclosureId = enclosure.id
WHERE enclosure.name = 'Lions Den' AND animal.name != 'Colin';