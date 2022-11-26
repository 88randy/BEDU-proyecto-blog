# Utilizar la imagen oficial de Python 3
FROM python:3.9.15-alpine3.16

# Seleccionar el directorio donde trabajaremos
WORKDIR /usr/src/app

# Establecemos algunas variables de entorno
# PYTHONDONTWRITEBYTECODE Evita que Python escriba archivos pyc en el disco
# PYTHONUNBUFFERED evita que Python almacene en búfer stdout y stderr
ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1

# Instalar dependencias.
RUN pip install --upgrade pip
COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt --no-color

# Copiar el codigo fuente al directorio de trabajo
COPY . /usr/src/app

# Iniciar el servicio
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
#CMD [ "python", "manage.py", "migrate" ]
#CMD [ "python", "manage.py", "runserver" "0.0.0.0:8000"]

# Ejecuta entrypoint.sh
#ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Abrir el puerto 80 del contendor
#EXPOSE 8000

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]