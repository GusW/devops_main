FROM python:3.6.1-alpine

LABEL maintainer="gustavo.watanabe@gmail.com"

RUN apk update && apk add gcc libc-dev make git libffi-dev openssl-dev python3-dev libxml2-dev libxslt-dev

WORKDIR /project

ADD . /project

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/project/application"

CMD ["python","application/web.py"]
