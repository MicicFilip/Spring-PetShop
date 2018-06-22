# Spring-PetShop

## Pre Requirements

1. Netbeans
2. XAMPP
3. Patience 

How to run the development environment:

1. Open the Spring-Petshop project in NetBeans IDE
2. Build Spring-Petshop project with dependencies
3. Clean and build the Spring-Petshop project
4. Run XAMPP and start Apache and MySQL services
5. In your browser, navigate to [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
6. Create a new database and name it `petshop-sql`
7. Import the sql file `petshop-sql.sql` that is located in the root of the Spring-Petshop project
8. Run the project using Netbeans and Apache Tomcat web server
9. In your browser, navigate to [http://localhost:8084/PetShop/](http://localhost:8084/PetShop/)
10. The Spring-Petshop web application should be up and running

## FAQ
Problems with file upload location:
If you encounter problems or bugs regarding file uploading, change the file location path in the `web.xml` file
