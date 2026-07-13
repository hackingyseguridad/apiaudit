[![Banner hackingyseguridad](https://github.com/hackingyseguridad/ia/raw/main/banner.png)](http://www.hackingyseguridad.com/)

### apiaudit

**Conjunto de scripts en Bash para auditar la seguridad de APIs (REST/JSON), su servidor y su superficie de ataque, siguiendo el enfoque del OWASP API Security Top 10.**

![Shell](https://img.shields.io/badge/lenguaje-Shell-89e051)
![Licencia](https://img.shields.io/badge/licencia-GPL--3.0-blue)
![Plataforma](https://img.shields.io/badge/plataforma-Kali%20Linux-557C94)
![Estado](https://img.shields.io/badge/estado-activo-brightgreen)

---

### Índice

- [¿Qué es apiaudit?](#-qué-es-apiaudit)
- [Arquitectura típica de una API](#-arquitectura-típica-de-una-api)
- [Requisitos](#-requisitos)
- [Instalación](#-instalación)
- [Tabla resumen de scripts](#-tabla-resumen-de-scripts)
- [Uso](#-uso)
- [Reconocimiento de la documentación de la API](#-reconocimiento-de-la-documentación-de-la-api)
- [Auditoría de seguridad del servidor (fqdnaudit.sh)](#-auditoría-de-seguridad-del-servidor-fqdnauditsh)
- [Auditoría de seguridad de la API (apitest.sh)](#-auditoría-de-seguridad-de-la-api-apitestsh)
- [Checklist de controles de seguridad](#-checklist-de-controles-de-seguridad)
- [Recursos y diccionarios incluidos](#-recursos-y-diccionarios-incluidos)
- [Referencias](#-referencias)
  
---

### apiaudit

Las **API** (interfaces de programación de aplicaciones) permiten que sistemas y aplicaciones se comuniquen entre sí y compartan datos. Las vulnerabilidades en una API pueden comprometer la **confidencialidad, integridad y disponibilidad** de todo un servicio, por lo que su auditoría es una parte crítica de cualquier pentest.

`apiaudit` automatiza y guía dos grandes bloques de trabajo:

| Bloque | Objetivo | Script principal |
|---|---|---|
| Seguridad del servidor | Analizar el servidor HTTP/HTTPS que expone la API: puertos, TLS, cabeceras, certificados, métodos HTTP, DoS, cookies... | `fqdnaudit.sh` / `fqdnaudit2.sh` |
| Seguridad de la API | Analizar la lógica y el contexto de la propia API: autenticación, autorización, control de acceso, gestión de errores, rate limiting... | `apitest.sh` |

```
Clientes ── Servidor HTTPS ── API Gateway ── Backend API
```

---

### Arquitectura típica de una API

![Estructura API](https://github.com/hackingyseguridad/apiaudit/raw/main/api0.png)

Una API RESTful/JSON suele exponer rutas fácilmente identificables mediante un *fuzzer* web, por ejemplo:

```
/api
/swagger/index.html
/openapi.json
/api/swagger/v1
/api/swagger
```

![Sintaxis API](https://github.com/hackingyseguridad/apiaudit/raw/main/api.png)

![Parámetros API](https://github.com/hackingyseguridad/apiaudit/raw/main/api3.png)

---

### Requisitos

El toolkit está pensado para ejecutarse sobre **Kali Linux**, con las siguientes herramientas instaladas:

| Categoría | Herramientas |
|---|---|
| Reconocimiento / OSINT | `dmitry`, `theharvester`, `whois`, `host` |
| DNS | `dnsenum`, `dnsmap`, `dnsrecon`, `dnswalk`, `fierce` |
| Escaneo de puertos y servicios | `nmap` |
| TLS/SSL | `sslyze` |
| Fuzzing / descubrimiento web | `dirb`, `golismero`, `uniscan`, `wapiti` |
| Vulnerabilidades web | `nikto`, `xsser` |
| WAF | `wafw00f` |
| Balanceo de carga | `lbd` |
| Fingerprinting | `whatweb` |
| Descarga / utilidades | `wget` |

> Instala todas las dependencias de un solo paso con `instalar.sh` (ver [Instalación](#-instalación)).

---

### Instalación

```bash
# 1. Clona el repositorio
git clone https://github.com/hackingyseguridad/apiaudit.git
cd apiaudit

# 2. Da permisos de ejecución a los scripts
chmod +x *.sh

# 3. Instala las dependencias necesarias (Kali Linux)
sudo ./instalar.sh
```

Para mantener el repositorio y sus dependencias actualizados:

```bash
./actualizar.sh
```

---

### Tabla resumen de scripts

> Descripciones inferidas a partir del nombre de cada fichero y del contexto del README original. Si alguna difiere del comportamiento real del script, agradezco la corrección para dejarlo 100% preciso.

| Script / fichero | Tipo | Descripción | Entrada | Salida |
|---|---|---|---|---|
| `instalar.sh` | Instalación | Instala en Kali Linux las herramientas y dependencias necesarias para el resto de scripts. | — | Paquetes instalados |
| `actualizar.sh` | Mantenimiento | Actualiza el repositorio / dependencias a la última versión. | — | Repo actualizado |
| `fqdnaudit.sh` | Auditoría de servidor | Análisis **automático** de la seguridad del servidor a partir de un FQDN o IP: puertos, servicios, TLS, cabeceras, métodos HTTP, cookies, protección DoS/DDoS. | FQDN / IP | Informe en consola / fichero |
| `fqdnaudit2.sh` | Auditoría de servidor | Variante o versión ampliada de `fqdnaudit.sh`. | FQDN / IP | Informe en consola / fichero |
| `apitest.sh` | Auditoría de API | Análisis **manual** de la seguridad de la API con contexto completo (sintaxis/documentación) y acceso: auth, ACL, API Gateway, control de acceso, validación de entradas, etc. | URL/endpoint de API + credenciales | Informe de hallazgos |
| `xsstest.sh` | Pruebas de vulnerabilidad | Pruebas de **Cross-Site Scripting (XSS)** sobre los endpoints indicados, apoyándose en `xss-payloads.txt`. | URL/endpoint | Resultados de inyección |
| `qtls.sh` | Auditoría TLS | Consulta y evalúa la configuración TLS/SSL y cifrados del servidor (soporte visual en `qtls.png`, referencia en `cifrados.xls`). | FQDN / IP | Informe de cifrados |
| `qtls2.sh` | Auditoría TLS | Variante o versión ampliada de `qtls.sh`. | FQDN / IP | Informe de cifrados |
| `github.sh` | Reconocimiento | Búsqueda/reconocimiento de información expuesta en GitHub (dorks, repos, secretos) relacionada con el objetivo. | Términos / organización | Listado de hallazgos |
| `github0.sh` | Reconocimiento | Variante de `github.sh`. | Términos / organización | Listado de hallazgos |
| `txt2pdf.sh` | Utilidad | Convierte los informes en texto plano (`.txt`) generados por los scripts anteriores a formato PDF. | Fichero `.txt` | Fichero `.pdf` |
| `diccionario.txt` | Recurso | Diccionario/wordlist genérico usado como apoyo en pruebas de fuerza bruta o fuzzing. | — | — |
| `x-cabeceras.txt` | Recurso | Listado de referencia de cabeceras de seguridad HTTP (`X-Frame-Options`, `X-XSS-Protection`, CSP, etc.) a verificar. | — | — |
| `xss-payloads.txt` | Recurso | Colección de payloads utilizados por `xsstest.sh` para detectar XSS. | — | — |
| `cifrados.xls` | Recurso | Hoja de cálculo de referencia con cifrados/algoritmos TLS y su nivel de seguridad, usada como apoyo por `qtls.sh`/`qtls2.sh`. | — | — |
| `api.txt` | Recurso | Listado de rutas/paths típicos de APIs (`/api`, `/swagger`, `/openapi.json`...) usado para reconocimiento y fuzzing. | — | — |
| `api.png`, `api0.png`, `api3.png` | Recurso gráfico | Diagramas de arquitectura, sintaxis y parámetros de una API (usados en este README). | — | — |
| `qtls.png` | Recurso gráfico | Captura/diagrama de apoyo para la auditoría TLS. | — | — |
| `cifrados.png` | Recurso gráfico | Captura/diagrama de referencia de cifrados. | — | — |
| `LICENSE` | Legal | Licencia del proyecto (GPL-3.0). | — | — |

---

### Uso

Ejemplos orientativos de invocación (ajusta los parámetros al funcionamiento real de cada script):

```bash
# Auditoría automática de servidor a partir de un dominio o IP
./fqdnaudit.sh midominio.com

# Auditoría manual de una API concreta
./apitest.sh https://midominio.com/api

# Pruebas de XSS sobre un endpoint
./xsstest.sh https://midominio.com/api/endpoint

# Evaluación de TLS y cifrados
./qtls.sh midominio.com

# Convertir un informe de texto a PDF
./txt2pdf.sh informe.txt
```

---

### Reconocimiento de la documentación de la API

Las APIs suelen documentarse para que los desarrolladores sepan cómo integrarlas. Existen dos tipos de documentación:

- **Legible por humanos**: explicaciones, ejemplos y escenarios de uso.
- **Legible por máquina**: formatos estructurados (JSON, XML) pensados para automatizar integración y validación.

Esta documentación suele ser pública, especialmente si la API está destinada a terceros — por lo que **el primer paso de todo reconocimiento debería ser revisarla**.

---

### Auditoría de seguridad del servidor (`fqdnaudit.sh`)

Proceso **automático**: solo necesita el FQDN o la IP del objetivo. Analiza:

| # | Área analizada |
|---|---|
| 1 | Puertos y servicios abiertos en el servidor HTTP/HTTPS, y CVEs asociadas |
| 2 | Servidor web/HTTPS utilizado y vulnerabilidades públicas conocidas; autenticación/autorización |
| 3 | Protocolo TLS y cifrados débiles ofrecidos; renegociación a versiones de protocolo anteriores |
| 4 | Certificado digital emitido por una CA de confianza |
| 5 | Cabeceras (X-Headers) de seguridad HTTP configuradas |
| 6 | Métodos HTTP permitidos (`GET`, `HEAD`, `OPTIONS`, `POST`, `PUT`, `TRACE`, `CONNECT`, `DELETE`...) |
| 7 | *Bitrate* y mecanismos anti-DoS/DDoS por colapso de peticiones y recursos en el backend |
| 8 | Seguridad de las cookies y otras vulnerabilidades |

---

### Auditoría de seguridad de la API (`apitest.sh`)

Proceso **manual**, con todo el contexto (sintaxis de la API) y acceso real al servicio:

| # | Área analizada |
|---|---|
| 1 | *Whitelisting* / ACL para restringir el acceso por países, rangos o IPs |
| 2 | API Gateway: monitorización, seguridad y punto único de acceso entre clientes y backend |
| 3 | Autenticación/autorización OAuth2 / JWT: cómo viajan credenciales y tokens |
| 4 | Web Authentication (WebAuthn) |
| 5 | *Leveled API Keys*: credenciales con permisos específicos y granulares |
| 6 | Manejo de errores (*Error Handling*) y detección de comportamientos anómalos |
| 7 | Validación de entradas (*Input Validation*) según el perfil autorizado |

---

### Checklist de controles de seguridad

| Control | Descripción |
|---|---|
| Control de acceso | Permisos granulares por endpoint |
| Cifrado HTTPS | Transmisión segura de datos |
| Sanitización de entradas | Limpieza y validación de datos entrantes |
| Rate limiting | Limitación de solicitudes para prevenir abuso |
| Mensajes de error seguros | Evitar revelar información sensible |
| Cifrado de datos | En tránsito y en reposo |
| Logging y auditoría | Registro exhaustivo de actividad |
| Restricción de intentos de login | Prevención de fuerza bruta |
| Versionado de API | Gestión de compatibilidad (v1, v2, v3...) |
| Cabeceras de seguridad | CSP, X-XSS-Protection, etc. |
| Configuración CORS | Restricción de solicitudes cross-origin |
| Expiración de tokens | Tokens de acceso de corta duración |
| Validación segura de datos | Entrada y salida |
| Documentación segura | Sin información interna sensible |
| Pruebas de seguridad | Evaluación periódica / hacking ético |
| Errores por defecto desactivados | Sin detalles internos del sistema |
| Gestión segura de sesiones | Invalidación segura |
| Tokens CSRF | Prevención de solicitudes no autorizadas |
| Actualizaciones regulares | Últimos parches de seguridad |

---

### Recursos y diccionarios incluidos

| Recurso | Uso |
|---|---|
| `diccionario.txt` | Wordlist genérica para fuzzing/fuerza bruta |
| `xss-payloads.txt` | Payloads para pruebas de XSS |
| `x-cabeceras.txt` | Referencia de cabeceras de seguridad a comprobar |
| `cifrados.xls` | Referencia de cifrados TLS y su nivel de seguridad |
| `api.txt` | Rutas típicas para descubrir APIs |

---

### Referencias

- OWASP API Security Top 10: https://portswigger.net/web-security/api-testing/top-10-api-vulnerabilities

---

#
http://www.hackingyseguridad.com/
#
