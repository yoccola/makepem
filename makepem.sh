#!/bin/sh

KEY=$1

openssl pkcs12 -clcerts -nokeys -out "${KEY}_cert.pem" -in "${KEY}.p12"
openssl pkcs12 -nocerts -out "${KEY}_key.pem" -in "${KEY}.p12"
openssl rsa -in "${KEY}_key.pem" -out "${KEY}_nopass_key.pem"
cat "${KEY}_cert.pem" "${KEY}_nopass_key.pem" > "${KEY}.pem"
