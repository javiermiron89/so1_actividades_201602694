# Actividad 3

|Carnet|Nombre|
|---|---|
|201602694|Javier Oswaldo Mirón Cifuentes|


## ¿Problema Detectado?

El problema detectado es el archivo dockerfile, ya que al momento de inicializar el proceso para levantar el contenedor, ya que intenta realizar la redirección y al no tener el archivo de configuración no sabe a dónde redirigir.

## Solución

Se debe agregar el archivo de configuración al contenedor con la siguiente instrucción:

```dockerfile
COPY nginx.conf /etc/nginx/conf.d/default.conf
```

### Archivo Corregido

```dockerfile
## BUILD
# docker build -t mifrontend:0.1.0-nginx-alpine -f nginx.Dockerfile .
## RUN
# docker run -d -p 3000:80 mifrontend:0.1.0-nginx-alpine
FROM node:18.14.0-buster-slim as compilacion

LABEL developer="jesus guzman" \
      email="susguzman@gmail.com"

ENV REACT_APP_BACKEND_BASE_URL=http://localhost:3800

# Copy app
COPY . /opt/app

WORKDIR /opt/app

# Npm install
RUN npm install

RUN npm run build

# Fase 2
FROM nginx:1.22.1-alpine as runner

COPY --from=compilacion /opt/app/build /usr/share/nginx/html

#Se agrega la configuracion de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

```
### Archivo de configuración NGINX

```nginx
server {
    listen          8080;
    server_name     localhost;
    access_log      /usr/share/nginx/reverse-access.log;
    error_log       /usr/share/nginx/reverse-error.log;
    location / {
        root        /usr/share/nginx/html;
        index       index.html index.htm;
    }
}
```