# Usar una imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Establecer variables de entorno para la instalación de MariaDB
ENV MYSQL_ROOT_PASSWORD=mysql
ENV MYSQL_DATABASE=m14
ENV MYSQL_USER=m14
ENV MYSQL_PASSWORD=mysql

# Instalar los servicios necesarios (MariaDB, SSH, Apache2)
RUN apt-get update && apt-get install -y \
    mariadb-server \
    openssh-server \
    apache2 \
    python3 \
    supervisor

# Crear el directorio del socket y establecer los permisos correctos
RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld



# Copiar archivo de configuración de MariaDB si es necesario
COPY mariadb.cnf /etc/mysql/my.cnf

# Crear el directorio del servidor apache2
RUN mkdir -p /var/run/apache2

# Copiar el script de inicio personalizado
COPY startup.sh /usr/local/bin/

# Copiar el archivo supervisord.conf desde la ruta local al contenedor
COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY apache2.conf /etc/supervisor/conf.d/apache2.conf
COPY ssh.conf /etc/supervisor/conf.d/ssh.conf
COPY mariadb.conf /etc/supervisor/conf.d/mariadb.conf

# Copiar el archivo de configuracion para que permita las conecciones remotas
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Dar permisos de ejecución al script de inicio
RUN chmod +x /usr/local/bin/startup.sh

# Exponer los puertos para SSH y Apache2
EXPOSE 22 80 443 5432 9001 3306

# Comando a ejecutar al iniciar el contenedor (iniciar los servicios)
CMD ["startup.sh"]

LABEL maintainer="maykel"
