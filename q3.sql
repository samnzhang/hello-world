DROP TABLE IF EXISTS Manager CASCADE;

CREATE TABLE Manager (
	eid INT PRIMARY KEY,
	name VARCHAR(30),
	dept_id INT,
	address VARCHAR(30)
);

DROP TABLE IF EXISTS Department CASCADE;

CREATE TABLE Department(
	id INT PRIMARY KEY,
	name VARCHAR(30),
	manager_id INT
);

ALTER TABLE manager ADD CONSTRAINT managerREFdepartment
FOREIGN KEY (dept_id) REFERENCES department(id)
DEFERRABLE INITALLY DEFFERED;

ALTER TABLE department ADD CONSTRAINT departmentREFmanager
FOREIGN KEY (manager_id) REFERENCES manager(eid)
DEFERRABLE INITALLY DEFFERED;

BEGIN;
INSERT INTO manager VALUES (1, 'Bob', 1, 'address1');
INSERT INTO department VALUES (1, 'sales', 1);
COMMIT;

