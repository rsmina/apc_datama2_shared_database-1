<h1 id="projects-3-oracle">Projects 3 Oracle</h1>

Ronn Angelo Lee  
BS Information Technology - MI 182

# Contents

- [Table DDL](#table-ddl)
- [View](#view)
    - [Query Screenshot](#query-screenshot)
    - [Query in Text](#query-in-text)
- [Employees](#employees)
- [Employee Types](#employee-types)
- [Entity Relationship Diagram](#entity-relationship-diagram)

<h1 id="table-ddl">Table DDL</h1>

<table width="100%">
    <tr width="100%">
        <td>Cities</td>
        <td><img src="tables/cities.png" alt="Cities query screenshot" /></td>
    </tr>
    <tr width="100%">
        <td>Clients</td>
        <td><img src="tables/clients.png" alt="Clients query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Companies</td>
        <td><img src="tables/companies.png" alt="Companies query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Countries</td>
        <td><img src="tables/countries.png" alt="Countries query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Districts</td>
        <td><img src="tables/districts.png" alt="Districts query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Drapers</td>
        <td><img src="tables/drapers.png" alt="Drapers query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Drivers</td>
        <td><img src="tables/drivers.png" alt="Drivers query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Employee Types</td>
        <td><img src="tables/employee-types.png" alt="Employee types query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Employees</td>
        <td><img src="tables/employees.png" alt="Employees query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Event Types</td>
        <td><img src="tables/event-types.png" alt="Event types query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Events</td>
        <td><img src="tables/events.png" alt="Events query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Florists</td>
        <td><img src="tables/florists.png" alt="Florists query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>House Numbers</td>
        <td><img src="tables/house-numbers.png" alt="House numbers query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>License Types</td>
        <td><img src="tables/license-types.png" alt="License types query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Postal Codes</td>
        <td><img src="tables/postal-codes.png" alt=" query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Presidents</td>
        <td><img src="tables/presidents.png" alt="Presidents query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Provinces</td>
        <td><img src="tables/provinces.png" alt="Provinces query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Resource Organizers</td>
        <td><img src="tables/resource-organizers.png" alt="Resource organizers query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Specializations</td>
        <td><img src="tables/specializations.png" alt="Specializations query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Street Names</td>
        <td><img src="tables/street-names.png" alt="Street names query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Styling Assistants</td>
        <td><img src="tables/styling-assistants.png" alt="Styling assistants query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Unit Numbers</td>
        <td><img src="tables/unit-numbers.png" alt="Unit Numbers query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Warehouse Types</td>
        <td><img src="tables/warehouse-types.png" alt="Warehouse types query screenshots" /></td>
    </tr>
    <tr width="100%">
        <td>Warehouses</td>
        <td><img src="tables/warehouses.png" alt="Warehouses query screenshots" /></td>
    </tr>
</table>

[Go to top](#projects-3-oracle)

<h1 id="view">View</h1>

<table>
    <tr width="100%">
        <th id="query-screenshot">Query Screenshot</th>
        <th id="query-in-text">Query in Text</th>
    </tr>
    <tr width="100%">
        <td><img src="views/query-screenshot.png" alt="View Query Screenshot" /></td>
        <td><a href="views/view.sql" target="_blank">

~~~sql
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
~~~

</a></td>
</tr>
</table>

[Go to top](#projects-3-oracle)

<h1 id="employees">Employees</h1>

<img src="views/employees-table.png" alt="Employees Table Screenshot" />

[Go to top](#projects-3-oracle)

<h1 id="employee-types">Employee Types</h1>

<img src="views/employee-types-table.png" alt="Employee Types Table Screenshot" />

[Go to top](#projects-3-oracle)

<h1 id="entity-relationship-diagram">Entity Relationship Diagram</h1>

<img src="er-diagram.png" alt="ER Diagram Screenshot" />

[Go to top](#projects-3-oracle)