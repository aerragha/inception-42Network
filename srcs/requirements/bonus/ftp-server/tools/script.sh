#!/bin/sh

#create new user
adduser -D ${FTP_SERVER_USER}

# Edit password for the created user 
echo ${FTP_SERVER_USER}:${FTP_SERVER_PASS} | chpasswd

chown -R ${FTP_SERVER_USER}:${FTP_SERVER_USER} /home/"${FTP_SERVER_USER}"

echo "${FTP_SERVER_USER}" | tee -a /etc/vsftpd.userlist

# Run & stay in the foreground
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf