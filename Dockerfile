FROM python:3.8.10
EXPOSE 5000
RUN apt-get update && apt-get install redis -y
WORKDIR /app
COPY ./giropops-senhas .
RUN pip install -r requirements.txt
CMD ["flask", "run", "--host=0.0.0.0"]


