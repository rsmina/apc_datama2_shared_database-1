CREATE VIEW
    MI182_RRLEE.employees_types
AS SELECT
    MI182_RRLEE.employees.id,
    CONCAT(
        CONCAT(
            CONCAT(MI182_RRLEE.employees.first_name, ' '),
            CONCAT(MI182_RRLEE.employees.middle_name, ' ')
        ), MI182_RRLEE.employees.last_name)
    AS
        name,
    MI182_RRLEE.employees.contact_number,
    MI182_RRLEE.employee_types.employee_type
FROM
    MI182_RRLEE.employees
INNER JOIN
    MI182_RRLEE.employee_types
ON
    MI182_RRLEE.employees.employee_type = MI182_RRLEE.employee_types.id
ORDER BY
    MI182_RRLEE.employees.id;