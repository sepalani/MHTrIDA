# Certificates

OpenSSL can manage SSL certificate creation and management.



Options
-------
OpenSSL comes with various options, here are the most useful ones:
 * ```-in <input_file>```, input file - default stdin
 * ```-inform <format>```, input format - default PEM (one of DER, NET or PEM)
 * ```-out <output_file>```, output file - default stdout
 * ```-outform <format>```, output format - default PEM (one of DER, NET or PEM)
 * ```-text```, print the certificate in text form
 * ```-noout```,  no certificate output



Print details
-------------
 * DER encoded certificate:
   * ```openssl x509 -in input_file.der -inform DER -text -noout```
 * PEM encoded certificate:
   * ```openssl x509 -in input_file.pem -text -noout```



Generate keys
-------------
Keys are needed to generate a certificate. Monster Hunter Tri use **1024-bit RSA keys**. OpenSSL can generate different kinds of key, `-des3` option (_can be removed for more convenience_) protects it with a password that will be required to be entered each time the certificate will be used.
 * 1024-bit RSA key:
   * ```openssl genrsa -des3 -out output_file.key 1024```
 * 2048-bit RSA key:
   * ```openssl genrsa -des3 -out output_file.key 2048```



X.509 v3 Certificate Extension
------------------------------
This extension appends further information to the certificate. Here is an example of what a configuration file looks like:

```
extensions = x509v3

[ x509v3 ]
subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid,issuer:always
basicConstraints       = CA:true
```



Certificate Signing Request
---------------------------
The following command creates a certificate signing request with the **private key** given in parameter which will be used to sign it:

```openssl req -new -key foobar.key -out foobar.csr```



Certificate
-----------
Here is an example of command to create a certificate with a x509v3 extension:

```openssl x509 -days 10000 -extfile ca.ext -signkey ca.key -in ca.csr -req -out ca.crt -set_serial 01```
