# apiaudit

# analisis automatico de seguridad API

Se requiere Kali Linux con las aplicaciones: davtest dirb dmitry dnsenum dnsmap dnsrecon dnswalk fierce golismero host lbd nikto nmap sslyze theharvester uniscan wafw00f wapiti wget whatweb whois xsser


<img style="float:left" alt="API sintaxis" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api.png">

Seguridad Servidor: 

- Puertos y servicios abiertos, y las vulnerabilidades de estos

- Servidor Web utilizado, y vulnerabilidades publicas conocidas. Autenticación/Autorización

- Protocolo TLS y cifrados, ofrecidos y Certificado digital con CA publicas, de confianza

- X-Cabeceras HTTP de seguridad configuradas

- Metodos HTTP permitidos, GET, POST. PUT, HEAD, TRACE, ..

- Bitrate, mecanismos para evitar ataques DOS, DDoS

- Seguridad de las Cookies, otras vuln

Seguridad API:

- Metodoso de autenticacion/autorizacion OAuth2

- WebAuthn

- Use Leveled API Keys

- Autorizacion

- Rate Limit

- API Versiones

- Whitelisting

- OWASP API Security Risks

- API Gateway

- Error Handling

- Input Validation

