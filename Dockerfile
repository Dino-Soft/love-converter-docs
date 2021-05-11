#obtenemos la imagen de un kernel de Linux con python
FROM python:3.8-alpine3.12
#seleccionar la carpeta de usuario
WORKDIR /app
#copia la carpeta del proyecto a la imagen
COPY ./app .
#instala dependencias del sistema
RUN apk add build-base
#instala dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt
#puerto por el que escucha la imagen
EXPOSE 5000
#ejecuta la aplicación
CMD [ "python", "app.py" ]
