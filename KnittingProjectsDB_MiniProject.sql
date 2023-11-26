CREATE DATABASE KnittingProjectsDB_MiniProject;

USE KnittingProjectsDB_MiniProject;

Create Table Projects (
project_id VARCHAR (2),
pattern_id VARCHAR (4),
project_name VARCHAR (20),
Status VARCHAR (12),
start_date Date,
completion_date Date,
CONSTRAINT
pk_project_id
PRIMARY KEY
(project_id),
FOREIGN KEY (pattern_id) REFERENCES patterns (pattern_id)
);

CREATE TABLE Patterns (
pattern_id VARCHAR (4),
pattern_name VARCHAR (35),
pattern_designer VARCHAR (19),
pattern_category VARCHAR (15),
CONSTRAINT
pk_pattern_id
PRIMARY KEY
(pattern_id)
);

CREATE TABLE YarnStock (
yarn_id VARCHAR (3),
brand VARCHAR (15),
name VARCHAR (18),
weight VARCHAR (12),
fibre VARCHAR (10),
meterage_per_skein INT NOT NULL,
cost_per_skein DECIMAL (6, 2),
skeins_owned INT,
CONSTRAINT
pk_yarn_id
PRIMARY KEY
(yarn_id)
);

CREATE TABLE NeedleStock (
needle_id VARCHAR (4),
brand VARCHAR (15),
size DECIMAL (4,2),
type VARCHAR (13),
length_cm INT,
cost DECIMAL (6,2),
instock VARCHAR (3),
CONSTRAINT
needle_id
PRIMARY KEY
(needle_id)
);

CREATE TABLE ProjectYarns (
project_yarn_id VARCHAR (4),
project_id VARCHAR (2),
yarn_id VARCHAR (3), 
meterage_used INT,
total_meterage_needed INT NOT NULL,
CONSTRAINT
pk_project_yarn_id
PRIMARY KEY
(project_yarn_id),
FOREIGN KEY (project_id) REFERENCES Projects(project_id),
FOREIGN KEY (yarn_id) REFERENCES Yarnstock (yarn_id)
);

CREATE TABLE ProjectNeedles (
project_needle_id VARCHAR (4),
project_id VARCHAR (2), 
needle_id VARCHAR (3), 
size DECIMAL (2,1),
CONSTRAINT
pk_project_needle_id
PRIMARY KEY
(project_needle_id),
FOREIGN KEY (project_id) REFERENCES projects(project_id),
FOREIGN KEY (needle_id) REFERENCES needlestock (needle_id)
);

INSERT INTO Projects
(project_id, pattern_id, project_name, status, start_date, completion_date)
VALUES
('P1', 'PA1', 'Sweater Weather', 'Complete', '2022-08-01', '2023-03-23'),
('P2', 'PA2','First Socks', 'Not-Started', NULL, NULL),
('P3', 'PA3','Jumper for Ruby', 'Not-Started', NULL, NULL),
('P4', 'PA4','Fingerless Gloves', 'Complete', '2022-11-04', '2023-01-03'),
('P5', 'PA5','Winter Sweater', 'In-Progress', '2023-08-03', NULL),
('P6', 'PA6','Cardigan Beanie', 'Complete', '2022-10-15', '2022-12-10'),
('P7', 'PA6', 'Cardigan Beanie 2', 'Not-Started', NULL, NULL),
('P8', 'PA7', 'First Sweater', 'Complete', '2021-09-21', '2022-05-25')
;

INSERT INTO Patterns
(pattern_id, pattern_name, pattern_designer, pattern_category)
VALUES
('PA1','No Frills Sweater', 'PetiteKnit', 'Jumper'),
('PA2','Coniciette Socks', 'Penrose Knits', 'Socks'),
('PA3','Knitted Greyhound Coat', 'Val Charman', 'Dog clothing'),
('PA4', 'Northern Fingerless Gloves', 'Melissa Schaschwary', 'gloves'),
('PA5', 'Sunday Sweater', 'PetiteKnit', 'jumper'),
('PA6', 'Cardigan Beanie', 'Captivating Crochet', 'hat'),
('PA7', 'Raglan Sweater', 'Knitatude', 'Jumper');


INSERT INTO YarnStock
(yarn_id, brand, name, weight, fibre, meterage_per_skein, cost_per_skein, skeins_owned)
VALUES
('Y1', 'Filcolana', 'Arwetta', '4-ply','Merino', 210, 4.35, 4),
('Y2', 'Filcolana', 'Alva', '2-ply','Alpaca', 175, 3.20, 3),
('Y3', 'Filcolana', 'Pervuian_Highland','Aran','Wool', 100, 3.45, 0),
('Y4', 'Filcolana', 'Tilia', 'Lace', 'Mohair', 210, 6.45, 2),
('Y5', 'Drops', 'Air', 'Aran', 'Alpaca', 150, 4.80, 7),
('Y6', 'Drops', 'Alaska', 'Aran', 'Wool', 70,  1.90, 1),
('Y7', 'Drops', 'Baby_Merino', 'Sport', 'Merino', 175, 3.50, 4),
('Y8', 'Drops', 'Big_Merino','Aran', 'Wool', 75, 3.50, 6),
('Y9', 'Drops', 'Kid_Silk', 'Lace', 'Mohair', 210, 4.60, 2),
('Y10', 'Sandnes_Garn', 'Kos', 'Chunky', 'Alpaca', 150, 8.70, 3),
('Y11', 'Rowan', 'Big_Wool', 'Super_Chunky', 'Merino', 80, 11.49, 5),
('Y12', 'Malabrigo', 'Rios', 'Worsted', 'Merino', 192, 12.79, 0)
;

INSERT INTO NeedleStock 
(needle_id, brand, size, type, length_cm, cost, instock)
VALUES
('N1', 'KnitPro', 2.75, 'SinglePointed', 35, 6.00, 'NO'),
('N2', 'KnitPro', 3, 'SinglePointed', 35, 6.00, 'NO'),
('N3', 'KnitPro', 3.25, 'SinglePointed', 35, 6.00, 'NO'),
('N4', 'KnitPro', 3.5, 'SinglePointed', 35, 6.00, 'NO'),
('N5', 'KnitPro', 3.75, 'SinglePointed', 35, 6.00, 'NO'),
('N6', 'KnitPro', 4, 'SinglePointed', 35, 6.00, 'NO'),
('N7', 'KnitPro', 4.5, 'SinglePointed', 35, 6.00, 'NO'),
('N8', 'KnitPro', 5, 'SinglePointed', 35, 6.00, 'NO'),
('N9', 'KnitPro', 5.5, 'SinglePointed', 35, 6.00, 'NO'),
('N10', 'KnitPro', 6, 'SinglePointed', 35, 6.00, 'YES'),
('N11', 'KnitPro', 6.5, 'SinglePointed', 35, 6.00, 'YES'),
('N12', 'KnitPro', 7, 'SinglePointed', 35, 6.00, 'NO'),
('N13', 'KnitPro', 8, 'SinglePointed', 35, 6.00, 'NO'),
('N14', 'KnitPro', 9, 'SinglePointed', 35, 6.00, 'YES'),
('N15', 'KnitPro', 10, 'SinglePointed', 35, 6.00, 'YES'),
('N16', 'KnitPro', 11, 'SinglePointed', 35, 6.00, 'NO'),
('N17', 'KnitPro', 12, 'SinglePointed', 35, 6.00, 'NO'),
('N18', 'Addi', 2.75, 'Circular', 40, 6.20, 'YES'),
('N19', 'Addi', 3, 'Circular', 40, 6.20, 'YES'),
('N20', 'Addi', 3.25, 'Circular', 40, 6.20, 'NO'),
('N21', 'Addi', 3.75, 'Circular', 40, 6.20, 'YES'),
('N22', 'Addi', 4, 'Circular', 40, 6.20, 'NO'),
('N23', 'Addi', 4.5, 'Circular', 40, 6.20, 'NO'),
('N24', 'Addi', 5, 'Circular', 40, 6.20, 'YES'),
('N25', 'Addi', 5.5, 'Circular', 40, 6.20, 'YES'),
('N26', 'Addi', 6, 'Circular', 40, 6.20, 'YES'),
('N27', 'Addi', 6.5, 'Circular', 40, 6.20, 'YES'),
('N28', 'Addi', 7, 'Circular', 40, 6.20, 'YES'),
('N29', 'Addi', 8, 'Circular', 40, 6.20, 'YES'),
('N30', 'Addi', 9, 'Circular', 40, 6.20, 'NO'),
('N31', 'Addi', 10, 'Circular', 40, 6.20, 'YES'),
('N32', 'Addi', 11, 'Circular', 40, 6.20, 'YES'),
('N33', 'Addi', 12, 'Circular', 40, 6.20, 'YES'),
('N34', 'Addi', 10, 'Circular', 40, 6.20, 'YES'),
('N35', 'Addi', 11, 'Circular', 40, 6.20, 'YES'),
('N36', 'Addi', 12, 'Circular', 40, 6.20, 'NO'),
('N37', 'Addi', 2.75, 'Circular', 80, 6.42, 'YES'),
('N38', 'Addi', 3, 'Circular', 80, 6.42, 'NO'),
('N39', 'Addi', 3.25, 'Circular', 80, 6.42, 'NO'),
('N40', 'Addi', 3.75, 'Circular', 80, 6.42, 'NO'),
('N41', 'Addi', 4, 'Circular', 80, 6.42, 'NO'),
('N42', 'Addi', 4.5, 'Circular', 80, 6.42, 'NO'),
('N43', 'Addi', 5, 'Circular', 80, 6.42, 'NO'),
('N44', 'Addi', 5.5, 'Circular', 80, 6.42, 'YES'),
('N45', 'Addi', 6, 'Circular', 80, 6.42, 'YES'),
('N46', 'Addi', 6.5, 'Circular', 80, 6.42, 'YES'),
('N47', 'Addi', 7, 'Circular', 80, 6.42, 'YES'),
('N48', 'Addi', 8, 'Circular', 80, 6.42, 'YES'),
('N49', 'Addi', 9, 'Circular', 80, 6.42, 'NO'),
('N50', 'Addi', 10, 'Circular', 80, 6.42, 'NO'),
('N51', 'Addi', 11, 'Circular', 80, 6.42, 'NO'),
('N52', 'Addi', 12, 'Circular', 80, 6.42, 'YES');


INSERT INTO ProjectYarns
(project_yarn_id, project_id, yarn_id, total_meterage_needed, meterage_used)
VALUES
('PY1','P1', 'Y1', 1175, 1175),
('PY2','P2','Y1', 230, 30),
('PY3','P3','Y7', 400, 0),
('PY4','P4','Y12', 192, 185),
('PY5','P5', 'Y10', 750, 300),
('PY6','P6','Y3', 137, 137),
('PY7','P7','Y12',137, 0),
('PY8','P8', 'Y8', 886, 886)
;

INSERT INTO ProjectNeedles 
(project_needle_id, project_id, needle_id)
VALUES
('PN1', 'P1', 'N18'),
('PN2', 'P2', 'N24'),
('PN3', 'P3', 'N8'),
('PN4', 'P4', 'N21'),
('PN5', 'P5', 'N47'),
('PN6', 'P6', 'N44'),
('PN7', 'P7', 'N44'),
('PN8', 'P8', 'N44');
