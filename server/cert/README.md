# Certificates

OpenSSL can handle SSL certificate creation and many more.



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
Keys are needed to generate a certificate. Monster Hunter Tri uses **1024-bit RSA keys**. OpenSSL can generate different kinds of key, `-des3` option (_can be removed for more convenience_) protects it with a password that will be required to be entered each time the certificate will be used.
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



CA Certificate
--------------
Here is an example of command to create a **Certificate Authority certificate** with a x509v3 extension file named **ca.ext**. Extensions can be ommited, but **Monster Hunter 3 used them** so let's do it that way. 

```openssl x509 -days 10000 -extfile ca.ext -signkey ca.key -in ca.csr -req -out ca.crt -set_serial 01```

 * ```-days 10000```, the certificate will be valid 10,000 days.
 * ```-extfile ca.ext```, extension file will be used.
 * ```-signkey ca.key```, the certificate will self-sign itself using this key.
 * ```-in ca.csr -req -out ca.crt```, input is a certificate request, sign and output.
 * ```-set_serial 01```, serial number to use. 01 was chosen because it will be the **Root CA certificate** (_the serial number really doesn't matter but it should be unique_).

In other word, **this public certificate** will allow its users to trust any certificate using it as **Certificate Authority**. By the way, extensions might add further data to prevent others to impersonate this certificate like a hash and others properties. So, if the **Root CA certificate** has been modified, all others certificate **must be redone** as well because the appended data won't be valid anymore. Of course, this Root CA certificate **will replace the MHTri in-game certificate**.



Certificate
-----------
The previous section stated how to generate a CA certificate, the following command generate a valid certificate trusted by the given CA.

```openssl x509 -days 10000 -extfile server.ext -CA ca.crt -CAkey ca.key -in server.csr -req -out server.crt -set_serial 33```

These parameters don't differ so much:
 * ```-CA ca.crt```, set the CA certificate, **must be PEM format**
 * ```-CAkey ca.key```, set the CA key, **must be PEM format**

As expected, certificates generated in this fashion **will be used by custom servers**.
