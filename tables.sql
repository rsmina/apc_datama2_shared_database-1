--
-- table creations
--

CREATE TABLE rrlee.presidents (
    id serial CONSTRAINT presidents_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    address varchar(255) NOT NULL,
    contact_number varchar(45),
    email_address varchar(100),
    UNIQUE (contact_number, email_address)
);

CREATE TABLE rrlee.clients (
    id serial CONSTRAINT clients_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    contact_number varchar(45) NOT NULL,
    email_address varchar(100) NOT NULL,
    UNIQUE (contact_number, email_address)
);

CREATE TABLE rrlee.companies (
    id serial CONSTRAINT companies_pk PRIMARY KEY,
    name varchar(100) NOT NULL,
    found_date date NOT NULL,
    president_id int NOT NULL,
    FOREIGN KEY (president_id) REFERENCES rrlee.presidents (id)
);

CREATE TABLE rrlee.employee_types (
    id serial CONSTRAINT employee_types_pk PRIMARY KEY,
    type varchar(20) NOT NULL,
    UNIQUE (type)
);

CREATE TABLE rrlee.employees (
    id serial CONSTRAINT employees_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    contact_number varchar(45) NOT NULL,
    address varchar(255) NOT NULL,
    company_id int NOT NULL,
    employee_type_id int NOT NULL,
    FOREIGN KEY (company_id) REFERENCES rrlee.companies (id),
    FOREIGN KEY (employee_type_id) REFERENCES rrlee.employee_types (id),
    UNIQUE (contact_number)
);

CREATE TABLE rrlee.florists (
    id serial CONSTRAINT florists_pk PRIMARY KEY,
    employee_id int NOT NULL,
    flower_variety_qty int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES rrlee.employees (id)
);

CREATE TABLE rrlee.drapers (
    id serial CONSTRAINT drapers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    certification_qty int NOT NULL,
    years_experience smallint NOT NULL,
    exhibit_qty int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES rrlee.employees (id)
);

CREATE TYPE rrlee.license_types_enum
AS ENUM ('Non-Professional', 'Professional');

CREATE TABLE rrlee.license_types (
    id serial CONSTRAINT license_types_pk PRIMARY KEY,
    type rrlee.license_types_enum NOT NULL,
    UNIQUE (type)
);

CREATE TABLE rrlee.drivers (
    id serial CONSTRAINT drivers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    license_num varchar(100) NOT NULL,
    license_expiry date NOT NULL,
    license_type_id int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES rrlee.employees (id),
    FOREIGN KEY (license_type_id) REFERENCES rrlee.license_types (id),
    UNIQUE (license_num)
);

CREATE TABLE rrlee.resource_organizers (
    id serial CONSTRAINT resource_organizers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    years_experience smallint NOT NULL,
    description varchar(500),
    FOREIGN KEY (employee_id) REFERENCES rrlee.employees (id)
);

CREATE TABLE rrlee.styling_assistants (
    id serial CONSTRAINT styling_assistants_pk PRIMARY KEY,
    employee_id int NOT NULL,
    certification_qty int NOT NULL,
    years_experience smallint NOT NULL,
    specialization varchar(50)[],
    FOREIGN KEY (employee_id) REFERENCES rrlee.employees (id)
);

CREATE TABLE rrlee.event_types (
    id serial CONSTRAINT event_types_pk PRIMARY KEY,
    type varchar(50) NOT NULL,
    UNIQUE (type)
);

CREATE TABLE rrlee.events (
    id serial CONSTRAINT events_pk PRIMARY KEY,
    company_id int NOT NULL,
    event_type_id int NOT NULL,
    client_id int NOT NULL,
    location varchar(255) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    FOREIGN KEY (company_id) REFERENCES rrlee.companies (id),
    FOREIGN KEY (event_type_id) REFERENCES rrlee.event_types (id),
    FOREIGN KEY (client_id) REFERENCES rrlee.clients (id)
);

CREATE TYPE rrlee.warehouse_types_enum
AS ENUM ('Public', 'Private', 'Rental');

CREATE TABLE rrlee.warehouse_types (
    id serial CONSTRAINT warehouse_types_pk PRIMARY KEY,
    type rrlee.warehouse_types_enum NOT NULL
);

CREATE TABLE rrlee.warehouses (
    id serial CONSTRAINT warehouses_pk PRIMARY KEY,
    company_id int NOT NULL,
    warehouse_type_id int NOT NULL,
    location varchar(255) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES rrlee.companies (id),
    FOREIGN KEY (warehouse_type_id) REFERENCES rrlee.warehouse_types (id),
    UNIQUE (location)
);
