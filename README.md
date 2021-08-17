**Delilah Restó**(Backend)

Backend for an online ordering system for a restaurant putting into operation the necessary parts to set up a REST API that allows CRUD operations on a data structure

Starting 🚀 These instructions will allow you to get a copy of the project running on your local machine for development and testing purposes. Follow the instructions below to know how to deploy the project. Prerequisites 📋 Install and configure the following programs which will be necessary for the correct operation of the application

Having a Text Editor, I recommend the use of VsCode.
Install and configure a MYSQL database engine.
Install NodeJS on your Operating System.
Install Postman which is a tool that will help us to make test queries to our API. Installation 🔧 Below you will find a series of steps that tell you what you must execute to have a local development environment running This step is totally optional as it provides you with a small test database
From your database monitor, run the database.sql file located inside the Back-End folder. Now, once the project is open from your text editor, open the VsCode terminal, make sure you are in the path of the Back-End folder and execute the following command line, with which all the necessary dependencies will be installed npm install Already installed all the dependencies for this project; we are going to create a file inside the same Back-End folder called ".env" where we are going to place the following information


**USER** = here put your database user

**PASS**= here enter your database password

**NAME_DB**= delilah_resto

**HOST** = localhost

**JWT_SECRET**= here put a secret word

From the terminal, execute the following command line npm start

delilahresto@1.0.0 start C:\Users\diazk\Documents\Projects\DelilahResto\DelilahResto\Back-End node index.js

Server started... Executing (default): SELECT 1+1 AS result Executing (default): CREATE TABLE IF NOT EXISTS user (id INTEGER(10) NOT NULL auto_increment , firstname VARCHAR(50) NOT NULL, lastname VARCHAR(50) NOT NULL, phone VARCHAR(15) NOT NULL, address VARCHAR(100) NOT NULL, email VARCHAR(50) NOT NULL, profile VARCHAR(10) NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB; Executing (default): CREATE TABLE IF NOT EXISTS requests (id INTEGER(10) NOT NULL auto_increment , status VARCHAR(50) NOT NULL, Payment_method VARCHAR(30) NOT NULL, createdAt DATETIME NOT NULL, updatedAt DATETIME NOT NULL, userId INTEGER(10), PRIMARY KEY (id), FOREIGN KEY (userId) REFERENCES user (id) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB; DB is connected Executing (default): CREATE TABLE IF NOT EXISTS product (id INTEGER(10) NOT NULL auto_increment , name VARCHAR(50) NOT NULL, description VARCHAR(255) NOT NULL, type VARCHAR(20) NOT NULL, price VARCHAR(20) NOT NULL, image VARCHAR(255) NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB; Executing (default): CREATE TABLE IF NOT EXISTS order (quantity INTEGER(10) NOT NULL, createdAt DATETIME NOT NULL, updatedAt DATETIME NOT NULL, productId INTEGER(10) , requestId INTEGER(10) , PRIMARY KEY (productId, requestId), FOREIGN KEY (productId) REFERENCES product (id) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (requestId) REFERENCES requests (id) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB; Executing (default): SHOW INDEX FROM requests Executing (default): SHOW INDEX FROM user Executing (default): SHOW INDEX FROM product Executing (default): SHOW INDEX FROM order At this point your application should be fully functional. 


Running the tests ⚙️ To learn more about running tests, you could refer to the file spec.yaml. You can also find a file called DelilahResto.postman_collection.json located inside the Postman folder, which you can import into your Postman in order to facilitate testing of the different EndPoints of our API

