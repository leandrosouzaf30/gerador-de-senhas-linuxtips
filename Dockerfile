FROM python:3.9-slim as build
ENV PYTHONUNBUFFERED=1
WORKDIR /app
EXPOSE 5000
RUN apt-get update && apt-get install redis -y
COPY ./giropops-senhas .
RUN pip install --user -r requirements.txt

FROM python:3.9-slim
COPY --from=build /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
COPY --from=build ./app .
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]


