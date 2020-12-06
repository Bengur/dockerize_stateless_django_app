FROM python:3
ENV PYTHONUNBUFFERED=1
RUN cd /usr/local/bin \
    && python -m pip install --upgrade pip
    
WORKDIR /code
RUN ls .

COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY . /code/
RUN ls .

VOLUME /code




