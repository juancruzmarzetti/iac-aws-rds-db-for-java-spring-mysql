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

Configuración de dependencia de MySQL en pom.xml:

```xml
<dependency>
	<groupId>mysql</groupId>
	<artifactId>mysql-connector-java</artifactId>
	<version>8.0.33</version>
</dependency>
```

- **`spring.datasource.url`**: Aquí debes colocar el endpoint de tu base de datos RDS. (donde dice "mydb"(despues de "3306/") cambiarlo por el valor que le hayas asigando a la propiedad "identifier" a la base de datos RDS en el archivo db.tf)
- **`spring.datasource.username`** y **`spring.datasource.password`**: configurar con los valores de username y password de la base de datos RDS.

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
