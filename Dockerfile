FROM registry.access.redhat.com/ubi8/ubi
USER root

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

RUN yum install -y  nmap which curl 
RUN yum update -y && yum clean all

# Copy files from pentest
RUN mkdir /root/pentest
COPY pentest/* /root/pentest


RUN setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip $(which nmap)
RUN setcap cap_net_raw+eip $(which nmap)

USER root

CMD ["nmap", "--privileged", "-sU", "localhost"]

