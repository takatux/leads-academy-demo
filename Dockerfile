FROM python:3.9.13-slim-buster

WORKDIR /flask-demo

COPY . .

RUN pip install -e .
#RUN pip install wheel && python setup.py bdist_wheel
#RUN pip install dist/flaskr-1.0.0-py3-none-any.whl --force-reinstall

ENV FLASK_APP=flaskr
ENV FLASK_DEBUG=false
#RUN flask init-db

#RUN pip install waitress
EXPOSE 5000
#CMD [ "waitress-serve", "--call", "flaskr:create_app" ]
CMD [ "flask", "run", "-h", "0.0.0.0", "-p", "5000" ]
