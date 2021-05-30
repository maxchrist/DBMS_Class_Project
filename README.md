# Hiking Application using a DBMS
This is the final project completed by Maximilian Christ and Andrew Bell for Principles of Database Management Systems at NYU Tandon in Fall 2020.

# Requirements
Install Streamlit using the following command from the terminal:
```
$ pip install streamlit
```
Install psycopg2, and to avoid having to install all of the dependencies, I recommend installing the binary using the following command:
```
$ pip install psycopg2-binary
```
Download and install PostgreSQL from
```https://www.enterprisedb.com/downloads/postgres-postgresql-downloads```

# Running the application
After PostgreSQL is installed, set up a basic database to use. Then load and run schema.sql using the database query tool. Also run load.sql using the query tool. Next, edit the database.ini file so that it uses the login credentials for the newly created database. 
Finally, open a terminal at the "code" folder, and run 
```
$ streamlit run project.py --server.address=localhost -- server.port=5432
```
but replace 5432 with the port that your database is running on. 
