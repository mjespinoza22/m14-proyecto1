#!/bin/bash

#service ssh start 
#service apache2 start 
service supervisor stop

# Iniciar MariaDB sin privilegios (sin contraseña)
mysqld_safe --skip-grant-tables &

# Esperar a que MariaDB esté listo
while ! mysqladmin ping --silent; do
    sleep 1
done

# Configurar la contraseña del root y crear la base de datos y el usuario
mysql -e "FLUSH PRIVILEGES;"
mysql -e "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';"
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Detener la instancia de MariaDB que se inició sin privilegios
mysqladmin shutdown

service supervisor start
supervisorctl

# agregar usuario para ssh 
sudo useradd -m -p $(echo 12345 | openssl passwd -1 -stdin) -s /bin/bash m14

# Iniciar MariaDB normalmente
#mysqld_safe
