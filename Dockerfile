FROM frolvlad/alpine-python3
MAINTAINER Mattie Bot "tech@contextmatters.com"
RUN apk update
RUN apk add bash
RUN apk add curl
RUN apk add python3-dev && \
    pip install flask
RUN mkdir app
WORKDIR /app
RUN curl -LOk https://github.com/aponty/flask_hello/archive/master.zip; unzip master.zip; rm master.zip
RUN cp flask_hello-master/* . ; rm -r flask_hello-master/
EXPOSE 5000
RUN export FLASK_APP=app.py
ENTRYPOINT ["python"]
CMD ["application.py"]

# docker run -ditp 5000:5000 flask_git
