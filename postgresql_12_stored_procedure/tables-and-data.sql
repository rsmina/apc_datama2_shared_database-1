--
-- schema creation
--

DROP SCHEMA IF EXISTS MI182_rrlee CASCADE;

CREATE SCHEMA MI182_rrlee;

--
-- table creations
--

CREATE TABLE MI182_rrlee.presidents (
    id serial CONSTRAINT presidents_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    address varchar(255) NOT NULL,
    contact_number varchar(45),
    email_address varchar(100),
    UNIQUE (contact_number, email_address)
);

CREATE TABLE MI182_rrlee.clients (
    id serial CONSTRAINT clients_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    contact_number varchar(45) NOT NULL,
    email_address varchar(100) NOT NULL,
    UNIQUE (contact_number, email_address)
);

CREATE TABLE MI182_rrlee.companies (
    id serial CONSTRAINT companies_pk PRIMARY KEY,
    name varchar(100) NOT NULL,
    found_date date NOT NULL,
    president_id int NOT NULL,
    FOREIGN KEY (president_id) REFERENCES MI182_rrlee.presidents (id)
);

CREATE TABLE MI182_rrlee.employee_types (
    id serial CONSTRAINT employee_types_pk PRIMARY KEY,
    type varchar(20) NOT NULL,
    UNIQUE (type)
);

CREATE TABLE MI182_rrlee.employees (
    id serial CONSTRAINT employees_pk PRIMARY KEY,
    fname varchar(45) NOT NULL,
    mname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    contact_number varchar(45) NOT NULL,
    address varchar(255) NOT NULL,
    company_id int NOT NULL,
    employee_type_id int NOT NULL,
    FOREIGN KEY (company_id) REFERENCES MI182_rrlee.companies (id),
    FOREIGN KEY (employee_type_id) REFERENCES MI182_rrlee.employee_types (id),
    UNIQUE (contact_number)
);

CREATE TABLE MI182_rrlee.florists (
    id serial CONSTRAINT florists_pk PRIMARY KEY,
    employee_id int NOT NULL,
    flower_variety_qty int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES MI182_rrlee.employees (id)
);

CREATE TABLE MI182_rrlee.drapers (
    id serial CONSTRAINT drapers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    certification_qty int NOT NULL,
    years_experience smallint NOT NULL,
    exhibit_qty int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES MI182_rrlee.employees (id)
);

CREATE TYPE MI182_rrlee.license_types_enum
AS ENUM ('Non-Professional', 'Professional');

CREATE TABLE MI182_rrlee.license_types (
    id serial CONSTRAINT license_types_pk PRIMARY KEY,
    type MI182_rrlee.license_types_enum NOT NULL,
    UNIQUE (type)
);

CREATE TABLE MI182_rrlee.drivers (
    id serial CONSTRAINT drivers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    license_num varchar(100) NOT NULL,
    license_expiry date NOT NULL,
    license_type_id int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES MI182_rrlee.employees (id),
    FOREIGN KEY (license_type_id) REFERENCES MI182_rrlee.license_types (id),
    UNIQUE (license_num)
);

CREATE TABLE MI182_rrlee.resource_organizers (
    id serial CONSTRAINT resource_organizers_pk PRIMARY KEY,
    employee_id int NOT NULL,
    years_experience smallint NOT NULL,
    description varchar(500),
    FOREIGN KEY (employee_id) REFERENCES MI182_rrlee.employees (id)
);

CREATE TABLE MI182_rrlee.styling_assistants (
    id serial CONSTRAINT styling_assistants_pk PRIMARY KEY,
    employee_id int NOT NULL,
    certification_qty int NOT NULL,
    years_experience smallint NOT NULL,
    specialization varchar(50)[],
    FOREIGN KEY (employee_id) REFERENCES MI182_rrlee.employees (id)
);

CREATE TABLE MI182_rrlee.event_types (
    id serial CONSTRAINT event_types_pk PRIMARY KEY,
    type varchar(50) NOT NULL,
    UNIQUE (type)
);

CREATE TABLE MI182_rrlee.events (
    id serial CONSTRAINT events_pk PRIMARY KEY,
    company_id int NOT NULL,
    event_type_id int NOT NULL,
    client_id int NOT NULL,
    location varchar(255) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    FOREIGN KEY (company_id) REFERENCES MI182_rrlee.companies (id),
    FOREIGN KEY (event_type_id) REFERENCES MI182_rrlee.event_types (id),
    FOREIGN KEY (client_id) REFERENCES MI182_rrlee.clients (id)
);

CREATE TABLE MI182_rrlee.warehouse_types (
    id serial CONSTRAINT warehouse_types_pk PRIMARY KEY,
    type varchar(50) NOT NULL,
    UNIQUE (type)
);

CREATE TABLE MI182_rrlee.warehouses (
    id serial CONSTRAINT warehouses_pk PRIMARY KEY,
    company_id int NOT NULL,
    warehouse_type_id int NOT NULL,
    location varchar(255) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES MI182_rrlee.companies (id),
    FOREIGN KEY (warehouse_type_id) REFERENCES MI182_rrlee.warehouse_types (id),
    UNIQUE (location)
);

--
-- data insertion
--

INSERT INTO MI182_rrlee.presidents (fname, mname, lname, address, contact_number, email_address)
VALUES
('Jo', 'M', 'Claravall', '15 Lancewood Greenwods Village, Pasig', '+639125658891', 'jo.claravall@gmail.com'),
('David', 'C', 'De Guzman', 'Bangkal, Taguig', '+639665923590', 'dcdeguzman@student.apc.edu.ph');

INSERT INTO MI182_rrlee.clients (fname, mname, lname, contact_number, email_address)
VALUES
('Jason', 'G', 'Todd', '+639283747373', 'jgtodd@gmail.com'),
('Angelica', 'Z', 'Daryl', '+639283647389', 'azdaryl@gmail.com'),
('Nadine', 'H', 'Paula', '+639238564738', 'nhpaula@gmail.com'),
('Jeric Paul', 'N', 'James', '+639283647398', 'jnjames@gmail.com'),
('Reynold', 'J', 'Jaime', '+639378594851', 'rjjaime@gmail.com');

INSERT INTO MI182_rrlee.companies (name, found_date, president_id)
VALUES
('Jo Claravall', '1997-12-01', 1),
('De Guzman Enterprise', '2012-11-04', 2),
('Wedding Org', '2014-01-03', 1),
('Organizers Incorporated', '2019-11-01', 2),
('PhilWed', '2010-02-13', 1);

INSERT INTO MI182_rrlee.employee_types (type)
VALUES
('drivers'),
('drapers'),
('florists'),
('styling_assistants'),
('resource_organizers');

INSERT INTO MI182_rrlee.employees (fname, mname, lname, contact_number, address, company_id, employee_type_id)
VALUES
('Maryl', 'Rachel', 'Prevost', '+865223049712', '8123 Sutherland Circle', 1, 1),
('Olivia', 'Gretchen', 'Stringfellow', '+307801030207', '23281 School Pass', 2, 1),
('Juline', 'Aeriell', 'Kleuer', '+5042717673345', '0 Granby Terrace', 3, 1),
('Freemon', 'Goraud', 'Reggiani', '+668335046538', '2717 Westridge Pass', 4, 1),
('Ag', 'Parsifal', 'Sinnatt', '+3897182028606', '69 Gateway Terrace', 5, 1),
('Wilhelmine', 'Holly', 'Klaaassen', '+869448345829', '6632 Harbort Street', 1, 2),
('Dredi', 'Dalia', 'Gallaway', '+628139614410', '81530 Nelson Trail', 2, 2),
('Elisa', 'Kym', 'Tichelaar', '+984407100014', '0529 Shopko Drive', 3, 2),
('Josepha', 'Liva', 'Martlew', '+3898753240767', '506 Armistice Lane', 4, 2),
('Davita', 'Dick', 'Resdale', '+864064741484', '375 Pond Drive', 5, 2),
('Karisa', 'David', 'Negus', '+3511152209772', '617 Bunting Terrace', 1, 3),
('Lilyan', 'Mahala', 'Cust', '+861365947643', '303 Bartelt Avenue', 2, 3),
('Gael', 'Sumner', 'Braams', '+868395951632', '2 Burning Wood Park', 3, 3),
('Helena', 'Mitzi', 'Gunney', '+363304615405', '6938 Main Point', 4, 3),
('Loria', 'Sammy', 'Burnyeat', '+525436457274', '8 Doe Crossing Drive', 5, 3),
('Marita', 'Angel', 'Klisch', '+626516557479', '8 Shasta Junction', 1, 4),
('Mohandis', 'Karla', 'Aulds', '+2345473969357', '3 Barnett Parkway', 2, 4),
('Dane', 'Marlyn', 'Raffan', '+624362085513', '672 Wayridge Alley', 3, 4),
('Carina', 'Charley', 'McGoogan', '+538401186477', '9 Summerview Avenue', 4, 4),
('Ethelin', 'Arliene', 'Bestwerthick', '+467552198029', '9 Anhalt Park', 5, 4),
('Bibbie', 'Gabriell', 'McKag', '+305831460781', '36 Norway Maple Road', 1, 5),
('Lorelle', 'Koral', 'Boyen', '+869144207653', '86864 Hovde Terrace', 2, 5),
('Elisabet', 'Stirling', 'Cadge', '+482742626598', '6021 Kipling Drive', 3, 5),
('Melli', 'Claudelle', 'Cyphus', '+816426023425', '169 Loftsgordon Circle', 4, 5),
('Smith', 'Alvie', 'Deason', '+867803973829', '86191 1st Plaza', 5, 5),
('Huntlee', 'Odella', 'Dunleavy', '+3513659088796', '2 Upham Junction', 1, 1),
('Roslyn', 'Dyane', 'Woodcroft', '+4203543349064', '1253 Burrows Road', 2, 1),
('Beverie', 'Shae', 'Croisier', '+627126732315', '615 Farwell Alley', 3, 1),
('Jarrod', 'Bryanty', 'Powley', '+639002654841', '0 Raven Lane', 4, 1),
('Bobbye', 'Pammi', 'Rubi', '+868607172134', '64038 East Court', 5, 1),
('Cynthea', 'Queenie', 'Pownall', '+869461109005', '18175 8th Parkway', 1, 2),
('Sonny', 'Janna', 'Weed', '+473629738724', '4245 Grim Terrace', 2, 2),
('Adele', 'Codi', 'Palk', '+624804241006', '1 Mosinee Parkway', 3, 2),
('Meredeth', 'Velvet', 'Gentile', '+667291073156', '3 Daystar Park', 4, 2),
('Mary', 'Redford', 'Karpov', '+547868132305', '08450 Banding Junction', 5, 2),
('Reinaldo', 'Lori', 'Catterson', '+483892719298', '917 Kensington Alley', 1, 3),
('Shanie', 'Gerri', 'McLeman', '+555261852788', '03809 Victoria Alley', 2, 3),
('Andrey', 'Gwenneth', 'Kapelhof', '+79738450925', '3382 Truax Avenue', 3, 3),
('Maris', 'Adrian', 'Stormont', '+73695845938', '8187 Merry Court', 4, 3),
('Etta', 'Mohandas', 'Eblein', '+78872985666', '1 Harper Center', 5, 3),
('Darwin', 'Corrine', 'Westraw', '+629215359944', '7429 Pepper Wood Park', 1, 4),
('Guendolen', 'Suzanna', 'Harnell', '+639236994194', '1 Redwing Hill', 2, 4),
('Cassey', 'Albrecht', 'Verman', '+9949883383084', '895 Jay Terrace', 3, 4),
('Selestina', 'Chic', 'Lambird', '+624118810724', '075 Dixon Park', 4, 4),
('Margaretha', 'Sindee', 'Treffrey', '+639624893781', '5 6th Crossing', 5, 4),
('Harriet', 'Sherye', 'Ledster', '+9672084062884', '4984 Maywood Lane', 1, 5),
('Aili', 'Kerrill', 'Theobold', '+9616905696532', '46148 Monica Avenue', 2, 5),
('Roxy', 'Emma', 'Cyseley', '+621422591912', '8 Lotheville Park', 3, 5),
('Noam', 'Enrica', 'Hyatt', '+3519062736618', '184 Golf View Drive', 4, 5),
('Clerkclaude', 'Logan', 'Antusch', '+866938261194', '02 Glendale Lane', 5, 5);

INSERT INTO MI182_rrlee.florists (employee_id, flower_variety_qty)
VALUES
(11, 30),
(12, 40),
(13, 45),
(14, 25),
(15, 35),
(36, 60),
(37, 40),
(38, 45),
(39, 60),
(40, 50);

INSERT INTO MI182_rrlee.drapers (employee_id, certification_qty, years_experience, exhibit_qty)
VALUES
(6, 2, 5, 10),
(7, 4, 2, 7),
(8, 7, 3, 6),
(9, 8, 1, 3),
(10, 2, 5, 2),
(31, 4, 3, 8),
(32, 3, 4, 5),
(33, 1, 7, 9),
(34, 8, 8, 2),
(35, 9, 2, 1);

INSERT INTO MI182_rrlee.license_types (type)
VALUES
('Non-Professional'),
('Professional');

INSERT INTO MI182_rrlee.drivers (employee_id, license_num, license_expiry, license_type_id)
VALUES
(1, 'N27-11-025178', '2025-01-01', 1),
(2, 'N21-12-025179', '2026-02-11', 2),
(3, 'N23-13-025180', '2027-03-21', 2),
(4, 'N25-14-025181', '2025-04-01', 1),
(5, 'N28-15-025182', '2026-05-11', 2),
(26, 'N20-16-025183', '2027-06-21', 1),
(27, 'N22-17-025184', '2025-07-01', 2),
(28, 'N24-18-025185', '2026-08-11', 2),
(29, 'N25-19-025186', '2027-09-21', 1),
(30, 'N26-19-025187', '2025-10-01', 2);

INSERT INTO MI182_rrlee.resource_organizers (employee_id, years_experience, description)
VALUES
(21, 5, 'Self-motivated'),
(22, 3, 'Time management'),
(23, 4, 'Interpersonal skills'),
(24, 2, 'Networking'),
(25, 5, 'Focused'),
(46, 6, 'Networking'),
(47, 9, 'Time management'),
(48, 2, 'Interpersonal skills'),
(49, 3, 'Focused'),
(50, 5, 'Self-motivated');

INSERT INTO MI182_rrlee.styling_assistants (employee_id, certification_qty, years_experience, specialization)
VALUES
(16, 5, 8, '{"Ikebana", "English"}'),
(17, 2, 3, '{"English", "Modern", "Contemporary"}'),
(18, 4, 5, '{"Modern"}'),
(19, 6, 7, '{"Contemporary", "Modern"}'),
(20, 8, 9, '{"Ikebana", "English"}'),
(41, 2, 4, '{"Modern", "Contemporary", "Ikebana", "English"}'),
(42, 1, 4, '{"Contemporary"}'),
(43, 7, 3, '{"English"}'),
(44, 9, 5, '{"Modern", "English"}'),
(45, 2, 2, '{"Ikebana", "Contemporary"}');

INSERT INTO MI182_rrlee.event_types (type)
VALUES
('Wedding'),
('Birthday'),
('Christening'),
('Company'),
('Private');

INSERT INTO MI182_rrlee.events (company_id, event_type_id, client_id, location, startdate, enddate)
VALUES
(1, 1, 1, '493 Milwaukee Parkway, Nishor', '2019-10-20', '2019-10-20'),
(2, 2, 2, '52 Dexter Place, Corticos', '2019-10-23', '2019-10-24'),
(4, 5, 3, '51811 Drewry Court, Laixi', '2019-11-11', '2019-11-11'),
(1, 3, 4, '7 Jackson Trail, Cervantes', '2019-12-23', '2019-12-23'),
(3, 4, 5, '55 Harper Drive, Dongdong', '2019-12-30', '2019-12-30');

INSERT INTO MI182_rrlee.warehouse_types (type)
VALUES
('Public'),
('Private'),
('Rental');

INSERT INTO MI182_rrlee.warehouses (company_id, warehouse_type_id, location)
VALUES
(1, 1, '6 Bay Alley, Chengbei'),
(2, 3, '41133 Lukken Pass, Fayzabad'),
(3, 2, '92 Independence Alley, El Adelanto'),
(4, 2, '275 Shopko Junction, Fahmah'),
(5, 1, '9296 Becker Trail, Taguisa');

--
-- create view
--

CREATE VIEW MI182_rrlee.employees_types AS
SELECT
MI182_rrlee.employees.id,
CONCAT(MI182_rrlee.employees.fname, ' ',
MI182_rrlee.employees.mname, ' ', MI182_rrlee.employees.lname) AS name,
MI182_rrlee.employees.contact_number,
MI182_rrlee.employees.address,
MI182_rrlee.employee_types.type
FROM MI182_rrlee.employees
INNER JOIN MI182_rrlee.employee_types ON (MI182_rrlee.employees.employee_type_id = MI182_rrlee.employee_types.id)
ORDER BY MI182_rrlee.employees.id;