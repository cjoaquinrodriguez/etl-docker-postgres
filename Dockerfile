# Utiliza una imagen de Python 3.11
FROM python:3.11

# Copia el archivo requirements.txt al directorio /app en el contenedor
COPY requirements.txt /app/requirements.txt
COPY etl.py /app/etl.py
COPY data/raw/sales_data.csv /app/data/raw/sales_data.csv

# Establece el directorio de trabajo
WORKDIR /app

# Crea y activa un entorno virtual de Python
RUN python -m venv env

# Instala las dependencias desde el archivo requirements.txt
RUN . env/bin/activate 
RUN pip install -r requirements.txt


# Copia el archivo Python de ETL a /app
COPY etl.py /app/etl.py

# Comando para ejecutar el script ETL
CMD ["python", "etl.py"]
