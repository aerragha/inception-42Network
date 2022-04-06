#!/bin/sh
tail -f /dev/null
# create new user
# adduser -D ${FTP_SERVER_USER}

# # Edit password for the created user 
# echo ${FTP_SERVER_USER}:${FTP_SERVER_PASS} | chpasswd

# # Run & stay in the foreground
# /usr/bin/vsftpd /etc/vsftpd/vsftpd.conf