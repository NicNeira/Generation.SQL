use generationg1;

create table employees(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    birth_date DATE,
    first_name varchar(14),
    last_name varchar(16),
    hire_date DATE
);

create table departments(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(40)
);

create table dept_manager(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id int(11),
    department_id int(11),
    from_date DATE,
    to_date DATE
);

ALTER TABLE dept_manager
ADD CONSTRAINT FK_employees_id_dept_manager  -- asignar nombre a la relacion
FOREIGN KEY (employee_id) REFERENCES employees(id),
ADD CONSTRAINT FK_department_id_dept_manager -- asignar nombre a la relacion
FOREIGN KEY (department_id) REFERENCES departments(id);

create table dept_emp(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id int(11),
    department_id int(11),
    from_date DATE,
    to_date DATE
);

ALTER TABLE dept_emp
ADD CONSTRAINT FK_employees_id_dept_emp  -- asignar nombre a la relacion
FOREIGN KEY (employee_id) REFERENCES employees(id),
ADD CONSTRAINT FK_department_id_dept_emp -- asignar nombre a la relacion
FOREIGN KEY (department_id) REFERENCES departments(id);

create table salaries(
    from_date DATE  PRIMARY KEY NOT NULL,
    salary int,
    to_date DATE,
    employee_id int(11)
);

ALTER TABLE salaries
ADD CONSTRAINT FK_employees_id_salaries  -- asignar nombre a la relacion
FOREIGN KEY (employee_id) REFERENCES employees(id);

create table titles(
    title varchar(50),
    from_date DATE,
    to_date DATE,
    employee_id int(11),
    primary key(title, from_date)
);

ALTER TABLE titles
ADD CONSTRAINT FK_employees_id_titles  -- asignar nombre a la relacion
FOREIGN KEY (employee_id) REFERENCES employees(id);
