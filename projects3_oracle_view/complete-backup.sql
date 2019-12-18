--
-- table creations
--

--
-- unit_numbers
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
-- house_numbers
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
    BEFORE INSERT ON MI182_RRLEE.house_numbers
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
    province VARCHAR2(50),
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
    country VARCHAR2(50),
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
-- employee_types
--
CREATE TABLE MI182_RRLEE.employee_types (
    id NUMBER,
    employee_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (employee_type)
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
    exhibit_quantity NUMBER NOT NULL,
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
    specialization VARCHAR2(50) NOT NULL,
    PRIMARY KEY (id),
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
    employee_id NUMBER NOT NULL,
    certification_quantity NUMBER NOT NULL,
    years_experience NUMBER(2) NOT NULL,
    specialization NUMBER NOT NULL,
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
    event_type VARCHAR2(50) NOT NULL,
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
    FOREIGN KEY (country) REFERENCES MI182_RRLEE.countries (id)
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
    warehouse_type VARCHAR2(50) NOT NULL,
    PRIMARY KEY (id)
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
    FOREIGN KEY (country) REFERENCES MI182_RRLEE.countries (id)
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
-- data insertion
--
ALTER USER MI182_RRLEE quota unlimited on USERS;

--
-- format date into YYYY-MM-DD
--
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

--
-- unit_numbers
--
INSERT INTO MI182_RRLEE.unit_numbers (unit_number) VALUES ('3A');
INSERT INTO MI182_RRLEE.unit_numbers (unit_number) VALUES ('3B');

--
-- house_numbers
--
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('0');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('1');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('2');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('3');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('5');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('6');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('7');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('8');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('9');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('15');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('36');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('52');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('55');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('69');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('75');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('92');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('169');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('184');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('275');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('303');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('375');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('423');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('493');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('506');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('529');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('615');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('617');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('672');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('895');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('917');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('1253');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('2717');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('3382');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('3809');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('4245');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('4984');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('6021');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('6632');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('6938');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('7429');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('8123');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('8187');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('8450');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('9296');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('18175');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('23281');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('41133');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('46148');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('51811');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('64038');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('81539');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('86864');
INSERT INTO MI182_RRLEE.house_numbers (house_number) VALUES ('86191');

--
-- street_names
--
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Lancewood');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Tanguile');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Sutherland Circle');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('School Pass');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Granby');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Gateway Terrace');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Westridge Pass');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Harbort');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Nelson Trail');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Shopko Drive');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Armistice Land');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Pond Drive');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Bunting Terrace');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Bartlet Avenue');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Burning Wood');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Main Point');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Doe Cross');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Shasta Junction');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Barnett Parkway');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Wayridge Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Summerview Avenue');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Anhalt');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Norway Maple Road');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Hove Terrace');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Kipling Drive');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Loftsgordon Circle');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Upham Junction');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Burrows Road');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Farwell Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Raven Lane');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('East Court');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('8th Parkway');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Grim Terrace');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Mosinee Parkway');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Daystar');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Banding Junction');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Kensington Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Victoria Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Truax Avenue');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Merry Courth');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Harper Drive');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Pepper Wood');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Redwing Hill');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Jay Terrace');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Dixon Park');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('6th Crossing');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Maywood Lane');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Monica Avenue');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Lotheville Park');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Golf View Drive');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Glendale Lane');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Milwaukee Parkway');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Dexter Place');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Drewry Court');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Jackson Trail');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Bay Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Lukken Pass');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Independence Alley');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Becker Trail');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Humabon');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Lapu-Lapu');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Jasmin');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Acacie');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Ilang-Ilang');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Sampaguita');
INSERT INTO MI182_RRLEE.street_names (street_name) VALUES ('Guiho');

--
-- districts
--
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Greenwoods Village');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Cembo');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('South Cembo');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Guadalupe');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Magallanes');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Bangkal');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Nishor');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Corticos');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Laixi');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Cervantes');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Dongdong');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Chengbei');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Fayzabad');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('El Adelanto');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Fahmah');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Taguisa');
INSERT INTO MI182_RRLEE.districts (district) VALUES ('Tanyag');

--
-- cities
--
INSERT INTO MI182_RRLEE.cities (city) VALUES ('Pasig');
INSERT INTO MI182_RRLEE.cities (city) VALUES ('Taguig');
INSERT INTO MI182_RRLEE.cities (city) VALUES ('Makati');
INSERT INTO MI182_RRLEE.cities (city) VALUES ('Manila');
INSERT INTO MI182_RRLEE.cities (city) VALUES ('Pasay');

--
-- postal_codes
--
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1214');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1316');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('2126');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1215');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1216');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1217');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('2789');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('2542');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('2788');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('2787');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1341');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('1342');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('6170');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('6171');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('4214');
INSERT INTO MI182_RRLEE.postal_codes (postal_code) VALUES ('4514');

--
-- provinces
--
INSERT INTO MI182_RRLEE.provinces (province) VALUES ('Metro Manila');

--
-- countries
--
INSERT INTO MI182_RRLEE.countries (country) VALUES ('Philippines');

--
-- presidents
--
INSERT INTO MI182_RRLEE.presidents (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address)
VALUES ('Jo', 'M', 'Claravall', NULL, 10, 1, 1, 1, 3, 1, 1, '+639125658891', 'jo.claravall@gmail.com');
INSERT INTO MI182_RRLEE.presidents (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address)
VALUES ('David Aldwin', 'C', 'De Guzman', 1, 3, 65, 6, 1, 3, 1, 1, '+639665923590', 'dcdeguzman@student.apc.edu.ph');

--
-- clients
--
INSERT INTO MI182_RRLEE.clients (first_name, middle_name, last_name, contact_number, email_address)
VALUES ('Jason', 'G', 'Todd', '+639283747373', 'jgtodd@gmail.com');
INSERT INTO MI182_RRLEE.clients (first_name, middle_name, last_name, contact_number, email_address)
VALUES ('Angelica', 'Z', 'Daryl', '+639283647389', 'azdaryl@gmail.com');
INSERT INTO MI182_RRLEE.clients (first_name, middle_name, last_name, contact_number, email_address)
VALUES ('Nadine', 'H', 'Paula', '+639238564738', 'nhpaula@gmail.com');
INSERT INTO MI182_RRLEE.clients (first_name, middle_name, last_name, contact_number, email_address)
VALUES ('Jeric Paul', 'N', 'James', '+639283647398', 'jnjames@gmail.com');
INSERT INTO MI182_RRLEE.clients (first_name, middle_name, last_name, contact_number, email_address)
VALUES ('Reynold', 'J', 'Jaime', '+639378594851', 'rjjaime@gmail.com');

--
-- companies
--
INSERT INTO MI182_RRLEE.companies (name, found_date, president)
VALUES ('Jo Claravall', '1997-12-01', 1);
INSERT INTO MI182_RRLEE.companies (name, found_date, president)
VALUES ('De Guzman Enterprise', '2012-11-04', 2);
INSERT INTO MI182_RRLEE.companies (name, found_date, president)
VALUES ('Wedding Org', '2014-01-03', 1);
INSERT INTO MI182_RRLEE.companies (name, found_date, president)
VALUES ('Organizers Incorporated', '2019-11-01', 2);
INSERT INTO MI182_RRLEE.companies (name, found_date, president)
VALUES ('PhilWed', '2010-02-13', 1);

--
-- employee_types
--
INSERT INTO MI182_RRLEE.employee_types (employee_type) VALUES ('Drivers');
INSERT INTO MI182_RRLEE.employee_types (employee_type) VALUES ('Drapers');
INSERT INTO MI182_RRLEE.employee_types (employee_type) VALUES ('Florists');
INSERT INTO MI182_RRLEE.employee_types (employee_type) VALUES ('Styling Assistants');
INSERT INTO MI182_RRLEE.employee_types (employee_type) VALUES ('Resource Organizers');

--
-- employees
--
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Maryl', 'Rachel', 'Prevost', NULL, 12, 1, 6, 1, 2, 1, 1, '+865223049712', 'mrprevost@gmail.com', 1, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Olivia', 'Gretchen', 'Stringfellow', NULL, 35, 2, 1, 2, 3, 1, 1, '+307801030207', 'ogstringfellow@gmail.com', 2, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Juline', 'Aeriell', 'Kleuer', 1, 22, 3, 10, 3, 4, 1, 1, '+5042717673345', 'jakleuer@gmail.com', 3, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Freemon', 'Goraud', 'Reggiani', 2, 1, 4, 5, 4, 5, 1, 1, '+668335046538', 'fgreggiani@gmail.com', 4, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Ag', 'Parsifal', 'Sinnatt', NULL, 23, 5, 1, 5, 6, 1, 1, '+3897182028606', 'apsinnatt@gmail.com', 5, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Wilhelmine', 'Holly', 'Klaaassen', NULL, 36, 6, 2, 1, 7, 1, 1, '+869448345829', 'whklaaassen@gmail.com', 1, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Dredi', 'Dalia', 'Gallaway', NULL, 24, 7, 3, 2, 8, 1, 1, '+628139614410', 'ddgallaway@gmail.com', 2, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Elisa', 'Kym', 'Tichelaar', NULL, 11, 8, 4, 3, 9, 1, 1, '+984407100014', 'ektichelaar@gmail.com', 3, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Josepha', 'Liva', 'Martlew', NULL, 10, 9, 5, 4, 10, 1, 1, '+3898753240767', 'jlmartlew@gmail.com', 4, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Davita', 'Dick', 'Resdale', NULL, 25, 10, 6, 5, 1, 1, 1, '+864064741484', 'ddresdale@gmail.com', 5, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Karisa', 'David', 'Negus', NULL, 2, 11, 7, 1, 2, 1, 1, '+3511152209772', 'kdnegus@gmail.com', 1, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Lilyan', 'Mahala', 'Cust', NULL, 33, 12, 8, 2, 3, 1, 1, '+861365947643', 'lmcust@gmail.com', 2, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Gael', 'Sumner', 'Braams', NULL, 34, 13, 9, 3, 4, 1, 1, '+868395951632', 'gsbraams@gmail.com', 3, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Helena', 'Mitzi', 'Gunney', NULL, 9, 14, 10, 4, 5, 1, 1, '+363304615405', 'hmgunney@gmail.com', 4, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Loria', 'Sammy', 'Burnyeat', NULL, 44, 15, 8, 5, 6, 1, 1, '+525436457274', 'lsburnyeat@gmail.com', 5, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Marita', 'Angel', 'Klisch', NULL, 41, 16, 5, 1, 7, 1, 1, '+626516557479', 'maklisch@gmail.com', 1, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Mohandis', 'Karla', 'Aulds', NULL, 3, 17, 2, 2, 8, 1, 1, '+2345473969357', 'mkaulds@gmail.com', 2, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Dane', 'Marlyn', 'Raffan', NULL, 43, 18, 3, 3, 9, 1, 1, '+624362085513', 'dmraffan@gmail.com', 3, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Carina', 'Charley', 'McGoogan', NULL, 38, 19, 4, 4, 10, 1, 1, '+538401186477', 'ccmcgoogan@gmail.com', 4, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Ethelin', 'Arliene', 'Bestwerthick', NULL, 42, 20, 7, 5, 1, 1, 1, '+467552198029', 'eabestwethick@gmail.com', 5, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Bibbie', 'Gabriell', 'McKag', NULL, 45, 21, 5, 1, 2, 1, 1, '+305831460781', 'bgmckag@gmail.com', 1, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Lorelle', 'Koral', 'Boyen', NULL, 26, 22, 9, 2, 3, 1, 1, '+869144207653', 'lkboyen@gmail.com', 2, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Elisabet', 'Stirling', 'Cadge', NULL, 4, 23, 1, 3, 4, 1, 1, '+482742626598', 'escadge@gmail.com', 3, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Melli', 'Claudelle', 'Cyphus', NULL, 5, 24, 10, 4, 5, 1, 1, '+816426023425', 'mccyphus@gmail.com', 4, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Smith', 'Alvie', 'Deason', NULL, 6, 25, 1, 5, 6, 1, 1, '+867803973829', 'sadeason@gmail.com', 5, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Huntlee', 'Odella', 'Dunleavy', NULL, 7, 26, 2, 1, 7, 1, 1, '+3513659088796', 'hodunleavy@gmail.com', 1, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Roslyn', 'Dyane', 'Woodcroft', NULL, 21, 27, 3, 2, 8, 1, 1, '+4203543349064', 'rdwoodcroft@gmail.com', 2, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Beverie', 'Shae', 'Croisier', NULL, 8, 28, 4, 3, 9, 1, 1, '+627126732315', 'bscroisier@gmail.com', 3, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Jarrod', 'Bryanty', 'Powley', NULL, 46, 29, 5, 4, 10, 1, 1, '+639002654841', 'jbpowley@gmail.com', 4, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Bobbye', 'Pammi', 'Rubi', NULL, 27, 30, 6, 5, 1, 1, 1, '+868607172134', 'bprubi@gmail.com', 5, 1);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Cynthea', 'Queenie', 'Pownall', NULL, 28, 31, 7, 1, 2, 1, 1, '+869461109005', 'cqpownall@gmail.com', 1, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Sonny', 'Janna', 'Weed', NULL, 19, 32, 8, 2, 3, 1, 1, '+473629738724', 'sjweed@gmail.com', 2, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Adele', 'Codi', 'Palk', NULL, 20, 33, 9, 3, 4, 1, 1, '+624804241006', 'acpalk@gmail.com', 3, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Meredeth', 'Velvet', 'Gentile', NULL, 47, 34, 10, 4, 5, 1, 1, '+667291073156', 'mvgentile@gmail.com', 4, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Mary', 'Redford', 'Karpov', NULL, 29, 35, 1, 5, 6, 1, 1, '+547868132305', 'mrkarpov@gmail.com', 5, 2);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Reinaldo', 'Lori', 'Catterson', NULL, 40, 36, 6, 1, 7, 1, 1, '+483892719298', 'rlcatterson@gmail.com', 1, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Shanie', 'Gerri', 'McLeman', NULL, 48, 37, 7, 2, 8, 1, 1, '+555261852788', 'sgmcleman@gmail.com', 2, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Andrey', 'Gwenneth', 'Kapelhof', NULL, 18, 38, 4, 3, 9, 1, 1, '+79738450925', 'agkapelhof@gmail.com', 3, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Maris', 'Adrian', 'Stormont', NULL, 32, 39, 5, 4, 10, 1, 1, '+73695845938', 'mastormont@gmail.com', 4, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Etta', 'Mohandas', 'Eblein', NULL, 31, 40, 8, 5, 1, 1, 1, '+78872985666', 'emeblein@gmail.com', 5, 3);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Darwin', 'Corrine', 'Westraw', NULL, 30, 41, 2, 1, 2, 1, 1, '+629215359944', 'dcwestraw@gmail.com', 1, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Guendolen', 'Suzanna', 'Harnell', NULL, 17, 42, 9, 2, 3, 1, 1, '+639236994194', 'gsharnell@gmail.com', 2, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Cassey', 'Albrecht', 'Verman', NULL, 49, 43, 3, 3, 4, 1, 1, '+9949883383084', 'caverman@gmail.com', 3, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Selestina', 'Chic', 'Lambird', NULL, 37, 44, 10, 4, 5, 1, 1, '+624118810724', 'sclambird@gmail.com', 4, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Margaretha', 'Sindee', 'Treffrey', NULL, 50, 45, 9, 5, 6, 1, 1, '+639624893781', 'mstreffrey@gmail.com', 5, 4);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Harriet', 'Sherye', 'Ledster', NULL, 16, 46, 8, 1, 7, 1, 1, '+9672084062884', 'hsledster@gmail.com', 1, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Aili', 'Kerrill', 'Theobold', NULL, 39, 47, 7, 2, 8, 1, 1, '+9616905696532', 'aktheobold@gmail.com', 2, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Roxy', 'Emma', 'Cyseley', NULL, 15, 48, 4, 3, 9, 1, 1, '+621422591912', 'recyseley@gmail.com', 3, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Noam', 'Enrica', 'Hyatt', NULL, 14, 49, 3, 4, 10, 1, 1, '+3519062736618', 'noam@gmail.com', 4, 5);
INSERT INTO MI182_RRLEE.employees (first_name, middle_name, last_name, unit_number, house_number, street_name, district, city, postal_code, province, country, contact_number, email_address, company, employee_type)
VALUES ('Clerkclaude', 'Logan', 'Antusch', NULL, 13, 50, 2, 5, 1, 1, 1, '+866938261194', 'clantusch@gmail.com', 5, 5);

--
-- florists
--
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (11, 30);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (12, 40);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (13, 45);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (14, 25);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (15, 35);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (36, 60);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (37, 40);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (38, 45);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (39, 60);
INSERT INTO MI182_RRLEE.florists (employee_id, flower_variety_quantity) VALUES (40, 50);

--
-- drapers
--
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (6, 2, 5, 10);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (7, 4, 2, 7);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (8, 7, 3, 6);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (9, 8, 1, 3);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (10, 2, 5, 2);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (31, 4, 3, 8);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (32, 3, 4, 5);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (33, 1, 7, 9);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (34, 8, 8, 2);
INSERT INTO MI182_RRLEE.drapers (employee_id, certification_quantity, years_experience, exhibit_quantity) VALUES (35, 9, 2, 1);

--
-- license_types
--
INSERT INTO MI182_RRLEE.license_types (license_type) VALUES ('Non-Professional');
INSERT INTO MI182_RRLEE.license_types (license_type) VALUES ('Professional');

--
-- drivers
--
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (1, 'N27-11-025178', '2025-01-01', 1);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (2, 'N21-12-025179', '2026-02-11', 2);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (3, 'N23-13-025180', '2027-03-21', 1);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (4, 'N25-14-025181', '2025-04-01', 2);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (5, 'N28-15-025182', '2026-05-11', 1);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (26, 'N20-16-025183', '2027-06-21', 2);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (27, 'N22-17-025184', '2025-07-01', 1);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (28, 'N24-18-025185', '2026-08-11', 2);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (29, 'N25-19-025186', '2027-09-21', 1);
INSERT INTO MI182_RRLEE.drivers (employee_id, license_number, license_expiry, license_type)
VALUES (30, 'N26-19-025187', '2025-10-01', 2);

--
-- resource_organizers
--
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (21, 5, 'Self-motivated');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (22, 3, 'Proficient in time management');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (23, 4, 'Confident in interpersonal communication');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (24, 2, 'Punctual');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (25, 5, 'Attentive');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (46, 6, 'Charismatic');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (47, 9, 'Organized');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (48, 2, 'Perfectionist');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (49, 3, 'Has great imagination and problem solving skills');
INSERT INTO MI182_RRLEE.resource_organizers (employee_id, years_experience, description)
VALUES (50, 5, 'Cute');

--
-- specializations
--
INSERT INTO MI182_RRLEE.specializations (specialization) VALUES ('Ikebana');
INSERT INTO MI182_RRLEE.specializations (specialization) VALUES ('English');
INSERT INTO MI182_RRLEE.specializations (specialization) VALUES ('Modern');
INSERT INTO MI182_RRLEE.specializations (specialization) VALUES ('Contemporary');

--
-- styling_assistants
--
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (16, 5, 8, 1);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (17, 2, 3, 2);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (18, 4, 5, 3);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (19, 6, 7, 4);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (20, 8, 9, 1);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (41, 2, 4, 2);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (42, 1, 4, 3);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (43, 7, 3, 4);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (44, 9, 5, 1);
INSERT INTO MI182_RRLEE.styling_assistants (employee_id, certification_quantity, years_experience, specialization) VALUES (45, 2, 2, 2);

--
-- event_types
--
INSERT INTO MI182_RRLEE.event_types (event_type) VALUES ('Wedding');
INSERT INTO MI182_RRLEE.event_types (event_type) VALUES ('Birthday');
INSERT INTO MI182_RRLEE.event_types (event_type) VALUES ('Christening');
INSERT INTO MI182_RRLEE.event_types (event_type) VALUES ('Company');
INSERT INTO MI182_RRLEE.event_types (event_type) VALUES ('Private');

--
-- events
--
INSERT INTO MI182_RRLEE.events (start_date, end_date, company, event_type, client, street_name, district, city, postal_code, province, country)
VALUES ('2019-10-20', '2019-10-20', 1, 1, 5, 51, 11, 1, 11, 1, 1);
INSERT INTO MI182_RRLEE.events (start_date, end_date, company, event_type, client, street_name, district, city, postal_code, province, country)
VALUES ('2019-10-23', '2019-10-24', 2, 2, 4, 52, 12, 2, 12, 1, 1);
INSERT INTO MI182_RRLEE.events (start_date, end_date, company, event_type, client, street_name, district, city, postal_code, province, country)
VALUES ('2019-11-11', '2019-11-11', 3, 3, 3, 53, 13, 3, 13, 1, 1);
INSERT INTO MI182_RRLEE.events (start_date, end_date, company, event_type, client, street_name, district, city, postal_code, province, country)
VALUES ('2019-12-23', '2019-12-23', 1, 4, 2, 54, 14, 4, 14, 1, 1);
INSERT INTO MI182_RRLEE.events (start_date, end_date, company, event_type, client, street_name, district, city, postal_code, province, country)
VALUES ('2019-12-30', '2019-12-30', 2, 5, 1, 55, 15, 5, 15, 1, 1);

--
-- warehouse_types
--
INSERT INTO MI182_RRLEE.warehouse_types (warehouse_type) VALUES ('Public');
INSERT INTO MI182_RRLEE.warehouse_types (warehouse_type) VALUES ('Private');
INSERT INTO MI182_RRLEE.warehouse_types (warehouse_type) VALUES ('Rental');

--
-- warehouses
--
INSERT INTO MI182_RRLEE.warehouses (company, warehouse_type, street_name, district, city, postal_code, province, country)
VALUES (1, 1, 26, 16, 1, 16, 1, 1);
INSERT INTO MI182_RRLEE.warehouses (company, warehouse_type, street_name, district, city, postal_code, province, country)
VALUES (2, 3, 27, 17, 2, 16, 1, 1);
INSERT INTO MI182_RRLEE.warehouses (company, warehouse_type, street_name, district, city, postal_code, province, country)
VALUES (3, 2, 28, 16, 3, 16, 1, 1);
INSERT INTO MI182_RRLEE.warehouses (company, warehouse_type, street_name, district, city, postal_code, province, country)
VALUES (4, 2, 29, 17, 4, 16, 1, 1);
INSERT INTO MI182_RRLEE.warehouses (company, warehouse_type, street_name, district, city, postal_code, province, country)
VALUES (5, 1, 30, 16, 5, 16, 1, 1);