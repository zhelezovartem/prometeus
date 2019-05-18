FROM ubuntu

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y software-properties-common python3-pip  python3-venv

RUN add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum solc

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
RUN python3 -m venv .venv
EXPOSE 8080

CMD [ "./run.sh"]
