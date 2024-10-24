> [!IMPORTANT]
> Important Things to Know.




## What is PostgreSQL? :gear:
PostgreSQL is an object-relational database management system. Using object-oriented features of PostgreSQL, programmers can easily communicate with the database servers. Helps to define complex custom data types and inheritance, or parent-child relationships, between tables.



## What is the purpose of a database schema in PostgreSQL? :wrench:
A schema is a structural representation of the data within that database. Schema is used to organize related objects, separate data for different applications or users, and improve database security and scalability.



## Explain the primary key and foreign key concepts in PostgreSQL. :old_key:
- Primary Key: A primary key is a column or a group of columns used to uniquely identify a row in a table. A table can have zero or one primary key. It cannot have more than one primary key. A primary key constraint is the combination of a not-null constraint and a UNIQUE constraint.

- Foreign Key: A foreign key is a column or a group of columns in a table that uniquely identifies a row in another table. A foreign key establishes a link between the data in two tables by referencing the primary key or a unique constraint of the referenced table.



## What is the difference between the VARCHAR and CHAR data types?
- CHAR: Char uses a fixed amount of space for each value, regardless of the length of the stored string
- VARCHAR: In contrast, varchar only uses the space needed to store the data.


## Explain the purpose of the WHERE clause in a SELECT statement.
The where clause is used to specify a condition that must be met for a row to be included in the result set. This allows you to retrieve only the rows that meet specific criteria, and exclude the ones that don't.


## What are the LIMIT and OFFSET clauses used for?
-LIMIT: LIMIT clause restricts the number of fetched data. That is if LIMIT is defined 2, then only 2 records for a table will be fetched.
-OFFSET: OFFSET defies how may values to ignore from the first. That is if OFFSET is defined 3, then first 3 value will be ignored and the fetching will be started from the fourth value.


## How can you perform data modification using UPDATE statements?
The UPDATE statement is used to modify the existing records in a table. The UPDATE statement can update single or multiple columns using the SET clause. The WHERE clause is used to specify the condition for selecting the rows to be updated. The syntax is:
```
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```





