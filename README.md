# PHP 5.6 APACHE ALPINE 3.6

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


# Nuevas funcionalidades:

  - Permite definir la zona horaria al iniciar el servicio

### Iniciar


Ejecutar para iniciar el servicio

```sh

$ docker run -d -e TIMEZONE=America/Montevideo -v mi_app_php:/var/www/localhost/htdocs sofislab/php:5.6-apache-alpine3.6

```

### Variables


| Variable | Detalle |
| ------ | ------ |
| TIMEZONE | Define la zona horaria a utilizar (America/Montevideo, America/El_salvador) |

License
----

Martin vilche
Sofis Solutions

