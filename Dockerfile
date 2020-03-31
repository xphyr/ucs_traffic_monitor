FROM telegraf:alpine
RUN echo "**** install Python ****" && \
    apk add --no-cache --virtual .build-deps g++ python3 python3-dev libffi-dev openssl openssl-dev make && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
RUN pip3 install netmiko ucsmsdk
COPY telegraf/telegraf.example.conf /etc/telegraf/telegraf.conf
COPY telegraf/ucs_traffic_monitor.py /usr/local/telegraf/ucs_traffic_monitor.py