FROM alpine:3.7
MAINTAINER Mattie Bot "tech@contextmatters.com"
RUN apk update
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache
RUN apk add bash
RUN apk add git
RUN pip install flask
RUN mkdir app
WORKDIR /app
RUN git clone https://mattiebot:tac0tuesday@github.com/aponty/flask_hello
RUN cp -R flask_hello/* .
RUN rm -r flask_hello/
EXPOSE 5000
RUN export FLASK_APP=app.py
ENTRYPOINT ["python"]
CMD ["application.py"]

# docker build -t test .
# docker run -it --entrypoint "/bin/bash" test
# docker run -p 5000:5000 test
