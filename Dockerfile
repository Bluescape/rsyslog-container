FROM bluescape/base-centos7

ENV PID_DIR /tmp/pidDir

USER root

RUN  yum -y install rsyslog && \
	 yum clean all && \
	 echo "" > /etc/rsyslog.d/listen.conf && \
	 mkdir -p ${PID_DIR} && \
	 chmod 777 ${PID_DIR}

COPY rsyslog.conf /etc/rsyslog.conf

EXPOSE 1514

CMD ["sh", "-c", "/usr/sbin/rsyslogd -i ${PID_DIR}/pid -n"]

LABEL \
  org.label-schema.name="rsyslog" \
  org.label-schema.description="Bluescape rsyslog"

