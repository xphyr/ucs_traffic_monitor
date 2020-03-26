FROM telegraf
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install netmiko && pip3 install ucsmsdk
COPY telegraf/telegraf.example.conf /etc/telegraf/telegraf.conf
COPY telegraf/ucs_traffic_monitor.py /usr/local/telegraf/ucs_traffic_monitor.py