# DAY 2 - Querying



CREATE DATABASE saskia_db

USE saskia_db

CREATE TABLE film_tab
(
    film_id INT IDENTITY(1,1),
    film_name VARCHAR(20),
    film_type VARCHAR(10),
    date_of_release DATETIME,
    director_name VARCHAR(10),
    writer_name VARCHAR(10),
    star_cast VARCHAR(10),
    film_language VARCHAR(10),
    official_website VARCHAR(30),
    plot_summary VARCHAR(max)



);


SP_HELP film_tab

DROP TABLE film_tab

SELECT * FROM film_tab

CREATE TABLE employee_table
(
    employee_id INT IDENTITY (1,1),
    employee_first_name VARCHAR(10),
    employee_last_name VARCHAR(10),
    employee_nhs_number INT,

    PRIMARY KEY (employee_id)
);

CREATE TABLE nhs_table
(
    employee_nhs_number INT IDENTITY (1,1),
    nhs_GP VARCHAR(20),
    employee_id INT,
    PRIMARY KEY (employee_nhs_number)
    FOREIGN KEY (employee_id) REFERENCES employee_table(employee_id)
);




DROP TABLE employee_table

DROP TABLE nhs_table





CREATE TABLE employee_info
(
    employee_ID_number INT IDENTITY (0,1),
    employee_first_name VARCHAR(10),
    employee_last_name VARCHAR(10)
)

INSERT INTO employee_info
(
    employee_first_name, employee_last_name
)
VALUES
(
    'Saskia','Barthold'
),
(
    'Chloe','Smith'
)

SP_HELP employee_info

SELECT * FROM employee_info
