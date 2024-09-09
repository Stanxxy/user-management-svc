FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN user_management_svc create-db
RUN user_management_svc populate-db
RUN user_management_svc add-user -u admin -p admin
EXPOSE 5000
CMD ["user_management_svc", "run"]
