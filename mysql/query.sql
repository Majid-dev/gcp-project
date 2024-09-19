CREATE DATABASE exam;

USE exam;

CREATE TABLE vminfo (
    vmname VARCHAR(100),
    privateip VARCHAR(15),
    publicip VARCHAR(15),
    operatingsystem VARCHAR(50),
    zone VARCHAR(50),
    sshport INT,
    httpsport INT
);

INSERT INTO vminfo (vmname, privateip, publicip, operatingsystem, zone, sshport, httpsport)
VALUES ('centos-7-instance', '10.166.0.5', '34.88.120.243', 'centos', 'europe-north1-c', 22, 443);

SELECT * FROM vminfo;

