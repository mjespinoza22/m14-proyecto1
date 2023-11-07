## Nombre del Proyecto

Este repositorio contiene los archivos necesarios para crear un contenedor de Docker con una configuración predefinida para un entorno de desarrollo basado en Ubuntu 22.04. El contenedor incluye MariaDB con un usuario, base de datos y contraseña preconfigurados, así como Apache, SSH y Python para ofrecer un entorno completo y versátil.

### Configuración Inicial

El contenedor se construye con las siguientes características por defecto:

- **Sistema Operativo:** Ubuntu 22.04
- **Base de Datos:** MariaDB
  - **Usuario:** m14
  - **Base de Datos:** m14
  - **Contraseña:** m14
- **Servidor Web:** Apache
- **Acceso Remoto:** SSH
- **Lenguaje de Programación:** Python

### Requisitos

- Docker instalado en tu máquina local.

### Instrucciones de Uso

1. **Clonar el Repositorio:**

   git clone https://github.com/mjespinoza22/m14-proyecto1
   

2. **Construir el Contenedor:**

  
   cd nombre-repositorio
   docker build -t ubuntu-mariadb-apache-ssh-python .
  

3. **Iniciar el Contenedor:**

  
   docker run -d -p 80:80 -p 22:22 -p 9001:9001 -p 3306:3306 --name ubuntu-container ubuntu-mariadb-apache-ssh-python
   

   Esto iniciará el contenedor con los puertos 80 (HTTP), 22 (SSH) , 9001 (Supervisor) y 3306 (mariadb) mapeados a tu máquina local.

### Acceso a los Servicios

- **Aplicación Web (Apache):** Accede a través de tu navegador web utilizando `http://localhost`.
- **Acceso SSH:** Utiliza tu cliente SSH favorito con la dirección `localhost` y el puerto `22`. Las credenciales por defecto son:
  - **Usuario:** m14
  - **Contraseña:** 12345

### Personalización

Si deseas personalizar la configuración predeterminada, puedes editar los archivos de configuración proporcionados en este repositorio antes de construir el contenedor.

### Notas Importantes

- **Seguridad:** Recuerda cambiar las contraseñas y configuraciones por defecto antes de utilizar este contenedor en un entorno de producción.



### Contacto

Para más información o preguntas, puedes contactar al mantenimiento de este repositorio a través de [mjespinoza22@ilg.cat].

¡Gracias por utilizar este entorno de desarrollo! Esperamos que sea útil para tus proyectos.