# apiaudit

# Analisis de seguridad API

Se requiere Kali Linux con las aplicaciones: davtest dirb dmitry dnsenum dnsmap dnsrecon dnswalk fierce golismero host lbd nikto nmap sslyze theharvester uniscan wafw00f wapiti wget whatweb whois xsser


<img style="float:left" alt="API sintaxis" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api.png">

# Seguridad del servidor: Proceso automatico, solo con el FQDN/IP y script: fqdnaudit.sh

- Puertos y servicios abiertos, en el servidor y las vulnerabilidades CVE de estos

- Servidor web/HTTPS utilizado, y vulnerabilidades publicas conocidas. Autenticación/Autorización;

- Protocolo TLS y cifrados débiles, ofrecidos; Renegociación a versioens procolos anteriores;

- Certificado digital  emitido por una  Entidad Certificadora CA  de confianza

- X-Cabeceras HTTP de seguridad configuradas

- Métodos HTTP permitidos, GET, POST. PUT, HEAD, TRACE, ..

- Bitrate, mecanismos para evitar ataques DOS de colapso de peticiones y de recursos en Backedn, o DDoS,

- Seguridad de las Cookies u otras vulnerabilidades

# Seguridad API, Proceso manual, con todo el contexsto (sintaxis de la API), y acceso! con script: apitest.sh 

- Whitelisting; ACL, Listas de Accceso, para evitar que la API esté disponible desde ciertos origeness. Paises, rangos, IPs,

- API Gateway; Puerta de enlace de Gestión de API, entre sus aplicaciones cliente y los servicios back-end, para gestionar la: Monitorización, seguridad, punto unico de acceso, ...

- Métodos de autenticacion / autorizacion OAuth2, como viajan las credenciales, tockens, codificaciones...

- Web Authentication (WebAuthn)

- Leveled API Keys; credenciales/claves con perfiles con permisos concretos y granulares. Permisos específicos a claves específicas, Autorizacion: Mecanismos para envio de las crecdenciales, Tockens de autenticacion.

- API Versiones; Versionado de la API, v1, v2, v3,

- Error Handling; manejo de errores, detectar errores o comportamientos anomalos distintos a los revisto

- Input Validation, comprobar que solo permite para nuestro perfil, los parámetros y obtener la información prevista y no otras

