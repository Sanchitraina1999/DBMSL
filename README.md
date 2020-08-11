## DDL Statements
#### Databases
```sql
# create
CREATE DATABASE database_name;

# switch
USE database_name;

# delete
DROP DATABASE database_name;

# list all
SHOW DATABASES;

```

#### Tables
```sql
# create
CREATE TABLE table_name(
	column_name datatype,
	column_name datatype
);

# delete
DROP TABLE table_name;

# rename
ALTER TABLE table_name RENAME to new_table_name

# list all
SHOW TABLES;

# describe
DESCRIBE table_name;

```

#### Views
>A view is a virtual table based on the result-set of an SQL statement,  
>The fields in a view are fields from one or more real tables in the database.
```sql
# create
CREATE VIEW view_name AS
	SELECT column_name(s) FROM table_name
		WHERE <condition>;

# delete 
DROP VIEW view_name;

# alter
ALTER VIEW view_name AS
	SELECT column_name(s) FROM table_name
		WHERE <condition>;

# describe
DESCRIBE view_name;

```

#### Columns
```sql
# add
ALTER TABLE table_name ADD column_name datatype;

# rename
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;

# delete
ALTER TABLE table_name DROP column_name;

# modify datatype, constraints
ALTER TABLE table_name MODIFY column_name datatype;

```

#### Primary Key
```sql
# alongwith column creation
CREATE TABLE table_name(
	column_name1 datatype PRIMARY KEY,
	column_name2 datatype,
	column_name3 datatype
);

# within create table
CREATE TABLE table_name(
	column_name1 datatype NOT NULL,
	column_name2 datatype,
	column_name3 datatype,
	PRIMARY KEY(column_name1)
);

# composite primary key
CREATE TABLE table_name(
	column_name1 datatype NOT NULL,
	column_name2 datatype NOT NULL,
	column_name3 datatype,
	PRIMARY KEY(column_name1,column_name2)
);

# with alter table
CREATE TABLE table_name(
	column_name1 datatype NOT NULL,
	column_name2 datatype,
	column_name3 datatype
);
ALTER TABLE table_name ADD PRIMARY KEY(column_name1);

# composite primary key, with alter table
CREATE TABLE table_name(
	column_name1 datatype NOT NULL,
	column_name2 datatype NOT NULL,
	column_name3 datatype
);
ALTER TABLE table_name ADD PRIMARY KEY(column_name1,column_name2);

# delete
ALTER TABLE table_name DROP PRIMARY KEY;

```

#### Foreign Key
```sql
CREATE TABLE table_primary(
	column_nameA datatype PRIMARY KEY,
	column_nameB datatype,
	column_nameC datatype,
	PRIMARY KEY (column_nameA)
);
```
<hr></hr>

```sql
# within create table
CREATE TABLE table_secondary(
	column_nameP datatype NOT NULL,
	column_nameQ datatype,
	column_nameA datatype,
	PRIMARY KEY (column_nameP),
	CONSTRAINT constraint_name
		FOREIGN KEY (column_nameA) REFERENCES table_primary(column_nameA)
);

# cascade
CREATE TABLE table_secondary(
	column_nameP datatype NOT NULL,
	column_nameQ datatype,
	column_nameA datatype,
	PRIMARY KEY (column_nameP),
	CONSTRAINT constraint_name
		FOREIGN KEY (column_nameA) REFERENCES table_primary(column_nameA)
			ON DELETE CASCADE
);

# with alter table
CREATE TABLE table_secondary(
	column_nameP datatype NOT NULL,
	column_nameQ datatype,
	column_nameA datatype,
	PRIMARY KEY (column_nameP)
);
ALTER TABLE table_secondary ADD CONSTRAINT constraint_name
	FOREIGN KEY(column_nameA) REFERENCES table_primary(column_nameA);

# cascade, with alter table
CREATE TABLE table_secondary(
	column_nameP datatype NOT NULL,
	column_nameQ datatype,
	column_nameA datatype,
	PRIMARY KEY (column_nameP)
);
ALTER TABLE table_secondary ADD CONSTRAINT constraint_name
	FOREIGN KEY(column_nameA) REFERENCES table_primary(column_nameA)
		ON DELETE CASCADE;

# delete
ALTER TABLE table_secondary DROP FOREIGN KEY constraint_name;
```

#### Check
```sql
# alongwith column creation
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype CHECK (<column_name3 condition>),
	column_name3 datatype 
);

# within create table
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype,
	column_name3 datatype,
	CONSTRAINT constraint_name
		CHECK (<column_name(s) condition>)
);

# with alter table
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype,
	column_name3 datatype
);
ALTER TABLE table_name ADD CONSTRAINT constraint_name 
	CHECK (<column_name(s) condition>);

# delete
ALTER TABLE table_name DROP CHECK constraint_name;
# or
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

```

#### Unique
```sql
# alongwith column creation
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype UNIQUE,
	column_name3 datatype 
);

# within create table
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype,
	column_name3 datatype,
	UNIQUE(column_name2)
);

# with alter table
CREATE TABLE table_name(
	column_name1 datatype,
	column_name2 datatype,
	column_name3 datatype 
);
ALTER TABLE table_name ADD UNIQUE(column_name2);

# delete 
ALTER TABLE table_name DROP INDEX column_name;

```
<br></br>
## DML Statements
#### Insert
```sql
# into each column
INSERT INTO table_name
	VALUES (column1_value,column2_value,...,colunmN_value);

# into specified column
INSERT INTO table_name (columnX,columnY,columnZ)
	VALUES (columnX_value,columnY_value,columnZ_value);

# insert with select
INSERT INTO table2 (columnX,columnY,columnZ)
	SELECT columnP,columnQ,columnR FROM table1
		WHERE (<condition(s)>);

# copying entire table1
INSERT INTO table1_copy
	SELECT * FROM table1;
	
```
