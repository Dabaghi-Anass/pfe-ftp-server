FROM stilliard/pure-ftpd:hardened

EXPOSE ${FTP_PORT}
EXPOSE 30000-30009

RUN mkdir -p ${FTP_HOME} && \
    adduser --disabled-password --home ${FTP_HOME} --gecos "" $FTP_USER && \
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd && \
    pure-pw useradd $FTP_USER -u ftpuser -d $FTP_HOME && \
    pure-pw mkdb

VOLUME ["${FTP_HOME}"]

CMD ["pure-ftpd", "-c", "50", "-C", "10", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R", "-P", "localhost", "-p", "30000:30009"]
