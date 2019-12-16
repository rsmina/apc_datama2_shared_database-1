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
-- insert data
--
ALTER USER MI182_RRLEE quota unlimited on USERS;

INSERT INTO MI182_RRLEE.unit_numbers (unit_number)
VALUES
(MI182_RRLEE.unit_numbers_sequence.NEXTVAL, '3A'),
(MI182_RRLEE.unit_numbers_sequence.NEXTVAL, '3B');