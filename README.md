# apiaudit

Clientes -------- Servidor HTTPS ---------- API Gateway ---------- Backend API

<img style="float:left" alt="api estructura" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api0.png">

# Analisis de seguridad API

Se requiere Kali Linux con las aplicaciones: davtest dirb dmitry dnsenum dnsmap dnsrecon dnswalk fierce golismero host lbd nikto nmap sslyze theharvester uniscan wafw00f wapiti wget whatweb whois xsser

Las API (interfaces de programación de aplicaciones) permiten que los sistemas y aplicaciones de software se comuniquen y compartan datos. Las pruebas de API son importantes ya que las vulnerabilidades en las API pueden socavar aspectos fundamentales de la confidencialidad, integridad y disponibilidad de un sitio web.

<img style="float:left" alt="API sintaxis" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api.png">

OWASP: 
https://portswigger.net/web-security/api-testing/top-10-api-vulnerabilities

Documentación API
Las API suelen estar documentadas para que los desarrolladores sepan cómo utilizarlas e integrarlas.

La documentación puede estar en formatos legibles por humanos y por máquinas. La documentación legible por humanos está diseñada para que los desarrolladores comprendan cómo utilizar la API. Puede incluir explicaciones detalladas, ejemplos y escenarios de uso. La documentación legible por máquina está diseñada para ser procesada por software para automatizar tareas como la integración y validación de API. Está escrito en formatos estructurados como JSON o XML.

La documentación de la API suele estar disponible públicamente, especialmente si la API está destinada a desarrolladores externos. Si este es el caso, comience siempre su reconocimiento revisando la documentación.

Las API API RESTful y JSON suelen tener y  por ello es facil idenficicarlas con un fuzzer web, porque en su estructura tienen: 

/api

/swagger/index.html

/openapi.json

/api/swagger/v1

/api/swagger

/api

<img style="float:left" alt="API parametros" src="https://github.com/hackingyseguridad/apiaudit/blob/main/api3.png">

# Seguridad del servidor: Proceso automatico, solo con el FQDN/IP y script: fqdnaudit.sh

- Puertos y servicios abiertos, en el servidor HTTP/HTTPS y las vulnerabilidades CVE de estos

- Servidor web/HTTPS utilizado, y vulnerabilidades publicas conocidas. Autenticación/Autorización;

- Protocolo TLS y cifrados débiles, ofrecidos; Renegociación a versioens procolos anteriores;

- Certificado digital  emitido por una  Entidad Certificadora CA  de confianza

- X-Cabeceras HTTP de seguridad configuradas

- Métodos HTTP permitidos, GET, HEAD, OPTIONS, POST, PUT, TRACE, CONNECT, DELETE, ..

- Bitrate, mecanismos para evitar ataques DOS de colapso de peticiones y de recursos en Backedn, o DDoS,

- Seguridad de las Cookies u otras vulnerabilidades

# Seguridad API, Proceso manual, con todo el contexsto (sintaxis de la API), y acceso! con script: apitest.sh 

- Whitelisting; ACL, Listas de Accceso, para evitar que la API esté disponible desde ciertos origeness. Paises, rangos, IPs,

- API Gateway; Puerta de enlace de Gestión de API, entre sus aplicaciones cliente y los servicios back-end, para gestionar la: Monitorización, seguridad, punto unico de acceso, ...

- Métodos de autenticacion / autorizacion OAuth2, como viajan las credenciales, tockens, codificaciones...

- Web Authentication (WebAuthn)

- Leveled API Keys; credenciales/claves con perfiles con permisos concretos y granulares. Permisos específicos a claves específicas, Autorizacion: Mecanismos para envio de las crecdenciales, Tockens de autenticacion.

- Error Handling; manejo de errores, detectar errores o comportamientos anomalos distintos a los revisto

- Input Validation, comprobar que solo permite para nuestro perfil, los parámetros y obtener la información prevista y no otras

- Autenticación Fuerte: Utilice OAuth 2.0 o JWT para el acceso autorizado.

- Control de Acceso: Defina permisos granulares para los puntos de enlace (endpoints).

- Cifrado HTTPS: Transmita datos de forma segura con HTTPS.

- Sanitización de Entradas: Limpie y valide los datos entrantes.

- Limitación de Tasa (Rate Limiting): Prevenga el abuso de la API mediante la limitación de solicitudes.

- Mensajes de Error Seguros: Evite revelar información sensible en los errores.

- Cifrado de Datos: Encripte los datos sensibles tanto en tránsito como en reposo.

- Registro y Auditoría (Logging): Mantenga registros (logs) exhaustivos de actividad.

- Restricción de Intentos de Inicio de Sesión: Prevenga ataques de fuerza bruta.

- Versionado de API: Gestione los cambios y la compatibilidad con versiones anteriores de forma adecuada. API Versiones; Versionado de la API, v1, v2, v3,

- Encabezados de Seguridad: Utilice CSP (Política de Seguridad de Contenido) y X-XSS-Protection.

- Configuración CORS: Restrinja las solicitudes de origen cruzado.

- Expiración de Tokens: Establezca tokens de acceso de corta duración.

- Validación Segura de Datos: Valide tanto los datos de entrada como los de salida.

- Documentación Segura de la API: Evite revelar información interna sensible en los manuales.

- Pruebas de Seguridad: Evalúe regularmente la existencia de vulnerabilidades. Pruebas hacking etico

- Desactivar Errores por Defecto: Evite que se muestren detalles internos del sistema.

- Gestión Segura de Sesiones: Invalide las sesiones de forma segura.

- Uso de Tokens CSRF: Prevenga solicitudes no autorizadas.

- Actualizaciones Regulares: Mantenga la API al día con los últimos parches de seguridad.


http://www.hackingyseguridad.com/ 


