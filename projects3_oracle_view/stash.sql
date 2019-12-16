--
-- table creations
--

--
-- unit numbers
--
CREATE TABLE MI182_RRLEE.unit_numbers (
    id NUMBER,
    unit_number VARCHAR2(10),
    PRIMARY KEY (id),
    UNIQUE (unit_number)
);

CREATE SEQUENCE MI182_RRLEE.unit_numbers_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.unit_numbers_trigger
	BEFORE INSERT ON MI182_RRLEE.unit_numbers
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.unit_numbers_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- house numbers
--
CREATE TABLE MI182_RRLEE.house_numbers (
    id NUMBER,
    house_number VARCHAR2(10),
    PRIMARY KEY (id),
    UNIQUE (house_number)
);

CREATE SEQUENCE MI182_RRLEE.house_numbers_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.house_numbers_trigger
    BEFORE INSERT ON MI182_RRLEE.unit_numbers
    FOR EACH ROW

BEGIN
    SELECT MI182_RRLEE.house_numbers_sequence.nextval
    INTO :NEW.id
    FROM dual;
END;

--
-- street_names
--
CREATE TABLE MI182_RRLEE.street_names (
    id NUMBER,
    street_name VARCHAR2(50),
    PRIMARY KEY (id),
    UNIQUE (street_name)
);

CREATE SEQUENCE MI182_RRLEE.street_names_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.street_names_trigger
	BEFORE INSERT ON MI182_RRLEE.street_names
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.street_names_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- districts
--
CREATE TABLE MI182_RRLEE.districts (
    id NUMBER,
    district VARCHAR2(50),
    PRIMARY KEY (id),
    UNIQUE (district)
);

CREATE SEQUENCE MI182_RRLEE.districts_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.districts_trigger
	BEFORE INSERT ON MI182_RRLEE.districts
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.districts_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- cities
--
CREATE TABLE MI182_RRLEE.cities (
    id NUMBER,
    city VARCHAR2(50),
    PRIMARY KEY (id),
    UNIQUE (city)
);

CREATE SEQUENCE MI182_RRLEE.cities_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.cities_trigger
	BEFORE INSERT ON MI182_RRLEE.cities
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.cities_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- postal_codes
--
CREATE TABLE MI182_RRLEE.postal_codes (
    id NUMBER,
    postal_code VARCHAR2(10),
    PRIMARY KEY (id),
    UNIQUE (postal_code)
);

CREATE SEQUENCE MI182_RRLEE.postal_codes_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.postal_codes_trigger
	BEFORE INSERT ON MI182_RRLEE.postal_codes
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.postal_codes_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- provinces
--
CREATE TABLE MI182_RRLEE.provinces (
    id NUMBER,
    province VARCHAR2(10),
    PRIMARY KEY (id),
    UNIQUE (province)
);

CREATE SEQUENCE MI182_RRLEE.provinces_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.provinces_trigger
	BEFORE INSERT ON MI182_RRLEE.provinces
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.provinces_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;


--
-- countries
--
CREATE TABLE MI182_RRLEE.countries (
    id NUMBER,
    country VARCHAR2(10),
    PRIMARY KEY (id),
    UNIQUE (country)
);

CREATE SEQUENCE MI182_RRLEE.countries_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.countries_trigger
	BEFORE INSERT ON MI182_RRLEE.countries
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.countries_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- presidents
--
CREATE TABLE MI182_RRLEE.presidents (
    id NUMBER,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    unit_number NUMBER,
    house_number NUMBER,
    street_name NUMBER,
    district NUMBER NOT NULL,
    city NUMBER NOT NULL,
    postal_code NUMBER,
    province NUMBER NOT NULL,
    country NUMBER NOT NULL,
    contact_number VARCHAR2(15),
    email_address VARCHAR2(100),
    PRIMARY KEY (id),
    UNIQUE (contact_number, email_address),
    FOREIGN KEY (unit_number) REFERENCES MI182_RRLEE.unit_numbers (id),
    FOREIGN KEY (house_number) REFERENCES MI182_RRLEE.house_numbers (id),
    FOREIGN KEY (street_name) REFERENCES MI182_RRLEE.street_names (id),
    FOREIGN KEY (district) REFERENCES MI182_RRLEE.districts (id),
    FOREIGN KEY (city) REFERENCES MI182_RRLEE.cities (id),
    FOREIGN KEY (postal_code) REFERENCES MI182_RRLEE.postal_codes (id),
    FOREIGN KEY (province) REFERENCES MI182_RRLEE.provinces (id),
    FOREIGN KEY (country) REFERENCES MI182_RRLEE.countries (id)
);

CREATE SEQUENCE MI182_RRLEE.presidents_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.presidents_trigger
	BEFORE INSERT ON MI182_RRLEE.presidents
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.presidents_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- clients
--
CREATE TABLE MI182_RRLEE.clients (
    id NUMBER,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    contact_number VARCHAR2(15),
    email_address VARCHAR2(100),
    PRIMARY KEY (id),
    UNIQUE (contact_number, email_address)
);

CREATE SEQUENCE MI182_RRLEE.clients_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.clients_trigger
	BEFORE INSERT ON MI182_RRLEE.clients
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.clients_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- companies
--
CREATE TABLE MI182_RRLEE.companies (
    id NUMBER,
    name VARCHAR2(50) NOT NULL,
    found_date DATE NOT NULL,
    president NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (president) REFERENCES MI182_RRLEE.presidents (id)
);

CREATE SEQUENCE MI182_RRLEE.companies_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.companies_trigger
	BEFORE INSERT ON MI182_RRLEE.companies
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.companies_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

-- 
--
-- employee_types
--
CREATE TABLE MI182_RRLEE.employee_types (
    id NUMBER,
    employee_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (employee_types)
);

CREATE SEQUENCE MI182_RRLEE.employee_types_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.employee_types_trigger
	BEFORE INSERT ON MI182_RRLEE.employee_types
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.employee_types_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- employees
--
CREATE TABLE MI182_RRLEE.employees (
    id NUMBER,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    unit_number NUMBER,
    house_number NUMBER,
    street_name NUMBER,
    district NUMBER NOT NULL,
    city NUMBER NOT NULL,
    postal_code NUMBER,
    province NUMBER NOT NULL,
    country NUMBER NOT NULL,
    contact_number VARCHAR2(15),
    email_address VARCHAR2(100),
    company NUMBER NOT NULL,
    employee_type NUMBER NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (contact_number, email_address),
    FOREIGN KEY (company) REFERENCES MI182_RRLEE.companies (id),
    FOREIGN KEY (employee_type) REFERENCES MI182_RRLEE.employee_types (id)
);

CREATE SEQUENCE MI182_RRLEE.employees_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.employees_trigger
	BEFORE INSERT ON MI182_RRLEE.employees
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.employees_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- florists
--
CREATE TABLE MI182_RRLEE.florists (
    id NUMBER,
    employee_id NUMBER NOT NULL,
    flower_variety_quantity NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES MI182_RRLEE.employees (id)
);

CREATE SEQUENCE MI182_RRLEE.florists_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.florists_trigger
	BEFORE INSERT ON MI182_RRLEE.florists
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.florists_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- drapers
--
CREATE TABLE MI182_RRLEE.drapers (
    id NUMBER,
    employee_id NUMBER NOT NULL,
    certification_quantity NUMBER NOT NULL,
    years_experience NUMBER(2) NOT NULL,
    exbibit_quantity NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES MI182_RRLEE.employees (id)
);

CREATE SEQUENCE MI182_RRLEE.drapers_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.drapers_trigger
	BEFORE INSERT ON MI182_RRLEE.drapers
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.drapers_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- license_types
--
CREATE TABLE MI182_RRLEE.license_types (
    id NUMBER,
    license_type VARCHAR2(25) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (license_type)
);

CREATE SEQUENCE MI182_RRLEE.license_types_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.license_types_trigger
	BEFORE INSERT ON MI182_RRLEE.license_types
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.license_types_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- drivers
--
CREATE TABLE MI182_RRLEE.drivers (
    id NUMBER,
    employee_id NUMBER NOT NULL,
    license_number VARCHAR2(25) NOT NULL,
    license_expiry DATE NOT NULL,
    license_type NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES MI182_RRLEE.employees (id),
    FOREIGN KEY (license_type) REFERENCES MI182_RRLEE.license_types (id)
);

CREATE SEQUENCE MI182_RRLEE.drivers_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.drivers_trigger
	BEFORE INSERT ON MI182_RRLEE.drivers
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.drivers_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- resource_organizers
--
CREATE TABLE MI182_RRLEE.resource_organizers (
    id NUMBER,
    employee_id NUMBER NOT NULL,
    years_experience NUMBER(2) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES MI182_RRLEE.employees (id)
);

CREATE SEQUENCE MI182_RRLEE.resource_organizers_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.resource_organizers_trigger
	BEFORE INSERT ON MI182_RRLEE.resource_organizers
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.resource_organizers_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- specializations
--
CREATE TABLE MI182_RRLEE.specializations (
    id NUMBER,
    specialization VARCHAR(50) NOT NULL,
    PRIMARY (id),
    UNIQUE (specialization)
);

CREATE SEQUENCE MI182_RRLEE.specializations_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.specializations_trigger
	BEFORE INSERT ON MI182_RRLEE.specializations
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.specializations_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- styling_assistants
--
CREATE TABLE MI182_RRLEE.styling_assistants (
    id NUMBER,
    certification_quantity NUMBER NOT NULL,
    years_experience NUMBER(2) NOT NULL,
    specialization NUMBER NOT NULL
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES MI182_RRLEE.employees (id),
    FOREIGN KEY (specialization) REFERENCES MI182_RRLEE.specializations (id)
);

CREATE SEQUENCE MI182_RRLEE.styling_assistants_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.styling_assistants_trigger
	BEFORE INSERT ON MI182_RRLEE.styling_assistants
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.styling_assistants_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- event_types
--
CREATE TABLE MI182_RRLEE.event_types (
    id NUMBER,
    event_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (event_type)
);

CREATE SEQUENCE MI182_RRLEE.event_types_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.event_types_trigger
	BEFORE INSERT ON MI182_RRLEE.event_types
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.event_types_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- events
--
CREATE TABLE MI182_RRLEE.events (
    id NUMBER,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    company NUMBER NOT NULL,
    event_type NUMBER NOT NULL,
    client NUMBER NOT NULL,
    street_name NUMBER,
    district NUMBER NOT NULL,
    city NUMBER NOT NULL,
    postal_code NUMBER,
    province NUMBER NOT NULL,
    country NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (company) REFERENCES MI182_RRLEE.companies (id),
    FOREIGN KEY (event_type) REFERENCES MI182_RRLEE.event_types (id),
    FOREIGN KEY (client) REFERENCES MI182_RRLEE.clients (id),
    FOREIGN KEY (street_name) REFERENCES MI182_RRLEE.street_names (id),
    FOREIGN KEY (district) REFERENCES MI182_RRLEE.districts (id),
    FOREIGN KEY (city) REFERENCES MI182_RRLEE.cities (id),
    FOREIGN KEY (postal_code) REFERENCES MI182_RRLEE.postal_codes (id),
    FOREIGN KEY (province) REFERENCES MI182_RRLEE.provinces (id),
    FOREIGN KEY (country) REFERENCES MI182_RRLEE.countries (id),
);

CREATE SEQUENCE MI182_RRLEE.events_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.events_trigger
	BEFORE INSERT ON MI182_RRLEE.events
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.events_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- warehouse_types
--
CREATE TABLE MI182_RRLEE.warehouse_types (
    id NUMBER,
    warehouse_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (warehouse_type) REFERENCES warehouse_types (id)
);

CREATE SEQUENCE MI182_RRLEE.warehouse_types_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.warehouse_types_trigger
	BEFORE INSERT ON MI182_RRLEE.warehouse_types
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.warehouse_types_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- warehouses
--
CREATE TABLE MI182_RRLEE.warehouses (
    id NUMBER,
    company NUMBER NOT NULL,
    warehouse_type NUMBER NOT NULL,
    street_name NUMBER,
    district NUMBER NOT NULL,
    city NUMBER NOT NULL,
    postal_code NUMBER,
    province NUMBER NOT NULL,
    country NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (company) REFERENCES MI182_RRLEE.companies (id),
    FOREIGN KEY (warehouse_type) REFERENCES MI182_RRLEE.warehouse_types (id),
    FOREIGN KEY (street_name) REFERENCES MI182_RRLEE.street_names (id),
    FOREIGN KEY (district) REFERENCES MI182_RRLEE.districts (id),
    FOREIGN KEY (city) REFERENCES MI182_RRLEE.cities (id),
    FOREIGN KEY (postal_code) REFERENCES MI182_RRLEE.postal_codes (id),
    FOREIGN KEY (province) REFERENCES MI182_RRLEE.provinces (id),
    FOREIGN KEY (country) REFERENCES MI182_RRLEE.countries (id),
);

CREATE SEQUENCE MI182_RRLEE.warehouses_sequence
    MINVALUE 1
    START WITH 1
    CACHE 20;

CREATE OR REPLACE TRIGGER MI182_RRLEE.warehouses_trigger
	BEFORE INSERT ON MI182_RRLEE.warehouses
	FOR EACH ROW

BEGIN
	SELECT MI182_RRLEE.warehouses_sequence.nextval
	INTO :NEW.id
	FROM dual;
END;

--
-- insert data
--
ALTER USER MI182_RRLEE quota unlimited on USERS;

INSERT INTO MI182_RRLEE.unit_numbers (unit_number)
VALUES ('3A');