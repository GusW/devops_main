FROM Ubuntu

RUN apt-get update
RUN apt-get install python

RUN pip install flask
RUN pip install flask-mysql

COPY . /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run

##### OR #####

$ docker run ubuntu-sleeper
------------------------------
FROM Ubuntu

ENTRYPOINT ["sleep"]
CMD ["5"]
==============================
$ sleep 5
------------------------------

$ docker run ubuntu-sleeper 10
------------------------------
FROM Ubuntu

ENTRYPOINT ["sleep"]
CMD ["5"]
==============================
$ sleep 10
------------------------------

$ docker run --entrypoint sleep2.0 ubuntu-sleeper 10
------------------------------
FROM Ubuntu

ENTRYPOINT ["sleep"]
CMD ["5"]
==============================
$ sleep2.0 10
------------------------------

