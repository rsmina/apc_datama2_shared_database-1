--
-- create view
--

CREATE VIEW rrlee.employees_types AS
SELECT
rrlee.employees.id,
CONCAT(rrlee.employees.fname, ' ',
rrlee.employees.mname, ' ', rrlee.employees.lname) AS name,
rrlee.employees.contact_number,
rrlee.employees.address,
rrlee.employee_types.type
FROM rrlee.employees
INNER JOIN rrlee.employee_types ON (rrlee.employees.employee_type_id = rrlee.employee_types.id)
ORDER BY rrlee.employees.id;