Ej de configuración de application.properties en proyecto de Java (API RESTful con JPA y HQL):

```properties
spring.datasource.url=jdbc:mysql://your-rds-endpoint:3306/mydb
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

- **`spring.datasource.url`**: Aquí debes colocar el endpoint de tu base de datos RDS.
