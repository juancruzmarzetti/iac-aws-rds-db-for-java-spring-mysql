Ej de configuración de application.properties en proyecto de Java (API RESTful con JPA y HQL):

```properties
spring.datasource.url=jdbc:mysql://your-rds-endpoint:3306/mydb
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```
- **`spring.datasource.url`**: Aquí debes colocar el endpoint de tu base de datos RDS. (donde dice "mydb"(despues de "3306/") cambiarlo por el valor que le hayas asigando a la propiedad "identifier" a la base de datos RDS en el archivo db.tf)
- **`spring.datasource.username`** y **`spring.datasource.password`**: configurar con los valores de username y password de la base de datos RDS.

Configuración de dependencia de MySQL en pom.xml:

```xml
<dependency>
	<groupId>mysql</groupId>
	<artifactId>mysql-connector-java</artifactId>
	<version>8.0.33</version>
</dependency>
```

### Configuración de valores de variables de terraform:

- **`db_username`**: nombre de usuario para acceder a la base de datos RDS.
- **`db_password`**: contraseña para acceder a la base de datos RDS.
- **`database_port`**: 3306. (cambiar sólo si se cambia la configuración de motor de base de datos)
- **`vpc_id`**: id de nuestra VPC default de AWS.
- **`subnet_id`**: id de nuestra Subnet default asociada a nuestra VPC default.

  Luego crear un archivo llamado **`variablevalues.tfvars`** y en este archivo asiganr todos los valores a las variables inicializadas en **`variables.tf`**.
  También personalizar el valor del CIDR block de la subnet que figura en **`subnet.tf`** para que el mismo CIDR block no se choque con el de la subnet default de la cual especificamos su id en la variable **`subnet_id`** (esto es porque tuve que agregar otra subnet ya que la base de datos de RDS requiere de mínimo 2 subnets para su despliegue (que tengan zona de disponibilidad distinta, ej: "us-east-1a" y "us-east-1b")). También personalizar las zonas de disponibilidad de ser necesario.

  ### Ejecución:

  ```bash
  terraform init
  ```

  ```bash
  terraform plan --var-file variablevalues.tfvars
  ```

  ```bash
  terraform apply --var-file variablevalues.tfvars
  ```

  #### Luego si queremos destruir la infraestructura:

  ```bash
  terraform destroy --var-file variablevalues.tfvars
  ```

---

### English

Example configuration for `application.properties` in a Java project (RESTful API with JPA and HQL):

```properties
spring.datasource.url=jdbc:mysql://your-rds-endpoint:3306/mydb
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```
- **`spring.datasource.url`**: Here, you should place the endpoint of your RDS database. (where it says "mydb" (after "3306/"), change it to the value assigned to the "identifier" property of the RDS database in the `db.tf` file).
- **`spring.datasource.username`** and **`spring.datasource.password`**: configure with the username and password values of the RDS database.

MySQL dependency configuration in `pom.xml`:

```xml
<dependency>
	<groupId>mysql</groupId>
	<artifactId>mysql-connector-java</artifactId>
	<version>8.0.33</version>
</dependency>
```

### Configuration of terraform variable values:

- **`db_username`**: username to access the RDS database.
- **`db_password`**: password to access the RDS database.
- **`database_port`**: 3306. (only change this if the database engine configuration is changed)
- **`vpc_id`**: id of our default AWS VPC.
- **`subnet_id`**: id of our default Subnet associated with our default VPC.

  Then create a file named **`variablevalues.tfvars`** and in this file assign all values to the variables initialized in **`variables.tf`**.
  Also, customize the value of the CIDR block of the subnet specified in **`subnet.tf`** to avoid conflicts with the default subnet's CIDR block (whose id is specified in the **`subnet_id`** variable). This is necessary because I had to add another subnet since the RDS database requires at least 2 subnets for deployment (which must be in different availability zones, e.g., "us-east-1a" and "us-east-1b"). Customize the availability zones if needed.

  ### Execution:

  ```bash
  terraform init
  ```

  ```bash
  terraform plan --var-file variablevalues.tfvars
  ```

  ```bash
  terraform apply --var-file variablevalues.tfvars
  ```

  #### If we want to destroy the infrastructure later:

  ```bash
  terraform destroy --var-file variablevalues.tfvars
  ```
