FROM python:3
LABEL maintainer="Taylor Vories"

VOLUME [ "/src" ]
RUN pip install flask flask_restful flask-jsonpify
COPY ups-api.py init.sh /src/
WORKDIR /src
RUN wget https://dl4jz3rbrsfum.cloudfront.net/software/powerpanel_132_amd64.deb && dpkg -i powerpanel_*_amd64.deb
RUN ["chmod", "+x", "ups-api.py"]
RUN ["chmod", "+x", "init.sh"]

ENTRYPOINT ["/src/init.sh"]
