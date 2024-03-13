# apiaudit

# analisis automatico de seguridad API

Se requiere Kali Linux con las aplicaciones: davtest dirb dmitry dnsenum dnsmap dnsrecon dnswalk fierce golismero host lbd nikto nmap sslyze theharvester uniscan wafw00f wapiti wget whatweb whois xsser


<img style="float:left" alt="API sintaxis" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api.png">

Seguridad Servidor: 

- Puertos y servicios abiertos, y las vulnerabilidades de estos

- Servidor Web utilizado, y vulnerabilidades publicas conocidas. Autenticación/Autorización;

- Protocolo TLS y cifrados debiles, ofrecidos; Renegociación a versioens procolos anteriores;

- Certificado digital con CA publicas, de confianza

- X-Cabeceras HTTP de seguridad configuradas

- Metodos HTTP permitidos, GET, POST. PUT, HEAD, TRACE, ..

- Bitrate, mecanismos para evitar ataques DOS, DDoS

- Seguridad de las Cookies, otras vuln

Seguridad API:

- Whitelisting; ACL, Listas de Accceso, para evitar que la API esté disponible desde ciertos origeness. Paises, rangos, IPs, 

- Metodoso de autenticacion/autorizacion OAuth2

- Web Authentication (WebAuthn)

- Leveled API Keys;  credenciales/claves con perfiles con permisos concretos y granulares. Permisos específicos a claves específicas, 

- Autorizacion: Mecanismos para envio de las crecdenciales, Tockens de autenticacion.

- Rate Limit: Mecanismos de bloqueo, ante un numero de peticiones por segundo, para  evitar colapso de recursos en Backend

- API Versiones; Versionado de la API, v1, v2, v3, 

- OWASP API Security Risks, ver las recomendaciones OWASP

- API Gateway;  Puerta de enlace de Gestión de API, entre sus aplicaciones cliente y los servicios back-end, para gestionar la: Monitorización, seguridad, punto unico de acceso, ... 

- Error Handling; manejo de errores, detectar errores o comportamientos anomalos distintos a los revisto

- Input Validation, comprobar que solo permite para nuestro perfil, los parametros y obtener la información prevista y no otras

