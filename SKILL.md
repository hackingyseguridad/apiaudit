---
name: apiaudit
description: Guía para realizar auditorías de seguridad de APIs (REST/JSON) y de su servidor usando el toolkit de scripts Bash "apiaudit" (hackingyseguridad, https://github.com/hackingyseguridad/apiaudit), alineado con el OWASP API Security Top 10. Usa esta skill siempre que el usuario pida auditar, testear, hacer pentest o revisar la seguridad de una API, de un servidor HTTP/HTTPS que expone una API, de su configuración TLS/cifrados, de sus cabeceras de seguridad, o cuando mencione explícitamente "apiaudit", "fqdnaudit", "apitest.sh" o el repositorio de hackingyseguridad. También aplica cuando se pida un checklist de seguridad de API, un informe de auditoría de API, o ayuda para interpretar/generar la salida de estos scripts. Requiere Kali Linux (o un entorno con las herramientas listadas) y autorización explícita del propietario del sistema objetivo antes de ejecutar cualquier prueba.
---

# apiaudit — Auditoría de seguridad de APIs

Skill para guiar auditorías de seguridad de APIs y de sus servidores usando el toolkit
**apiaudit** de hackingyseguridad (https://github.com/hackingyseguridad/apiaudit),
estructurado según el enfoque de OWASP API Security Top 10
(https://portswigger.net/web-security/api-testing/top-10-api-vulnerabilities).

## ⚠️ Antes de empezar: autorización

Estos scripts realizan escaneos activos (nmap, fuzzing, pruebas XSS, sslyze, etc.)
contra un objetivo real. **Nunca** ayudes a ejecutarlos contra un dominio/IP sin
confirmar que el usuario tiene autorización explícita para auditarlo (propietario
del sistema, cliente de un pentest con alcance firmado, entorno propio de pruebas,
etc.). Si hay dudas razonables sobre la legitimidad, pregunta antes de continuar.

## Cuándo usar esta skill

- El usuario quiere auditar la seguridad de una API propia o de un cliente.
- Quiere revisar la seguridad del servidor que expone una API (TLS, cabeceras,
  puertos, métodos HTTP, cookies, protección DoS...).
- Pide un checklist de seguridad de API (OWASP API Top 10 y controles asociados).
- Menciona el repositorio `apiaudit`, o cualquiera de sus scripts
  (`fqdnaudit.sh`, `apitest.sh`, `qtls.sh`, `xsstest.sh`, `github.sh`...).
- Necesita ayuda para instalar el toolkit, interpretar su salida, o convertir un
  informe `.txt` a PDF.

## Requisitos del entorno

El toolkit está pensado para **Kali Linux** con estas herramientas instaladas:

`davtest`, `dirb`, `dmitry`, `dnsenum`, `dnsmap`, `dnsrecon`, `dnswalk`, `fierce`,
`golismero`, `host`, `lbd`, `nikto`, `nmap`, `sslyze`, `theharvester`, `uniscan`,
`wafw00f`, `wapiti`, `wget`, `whatweb`, `whois`, `xsser`

Si el usuario no está en Kali o no tiene estas herramientas, indícaselo y sugiere
instalar el toolkit con `instalar.sh` o instalar manualmente las dependencias
necesarias para el análisis concreto que quiere hacer.

## Flujo de trabajo recomendado

1. **Confirmar alcance y autorización.** Objetivo (FQDN/IP/endpoint), y si el
   usuario está autorizado a probarlo.
2. **Clonar e instalar** (si no lo ha hecho ya):
   ```bash
   git clone https://github.com/hackingyseguridad/apiaudit.git
   cd apiaudit
   chmod +x *.sh
   sudo ./instalar.sh
   ```
3. **Reconocimiento de documentación**: buscar rutas típicas de descubrimiento de
   API antes de escanear a ciegas: `/api`, `/swagger/index.html`, `/openapi.json`,
   `/api/swagger/v1`, `/api/swagger` (ver `api.txt`).
4. **Auditoría automática del servidor** con `fqdnaudit.sh` (o `fqdnaudit2.sh`)
   pasando solo el FQDN/IP — ver tabla de cobertura más abajo.
5. **Auditoría manual de la API** con `apitest.sh`, aportando contexto real
   (sintaxis de la API, credenciales/acceso autorizado) — ver tabla más abajo.
6. **Pruebas específicas** según lo que aparezca en el reconocimiento: XSS con
   `xsstest.sh` + `xss-payloads.txt`, cifrados TLS con `qtls.sh`/`qtls2.sh` +
   `cifrados.xls`, exposición en GitHub con `github.sh`/`github0.sh`.
7. **Informe**: convertir el resultado en texto a PDF con `txt2pdf.sh` si el
   usuario necesita entregable.
8. **Checklist final**: contrastar los hallazgos con la tabla de controles de
   seguridad de la sección correspondiente, y priorizar remediaciones.

## Tabla resumen de scripts

| Script / fichero | Tipo | Qué cubre | Entrada | Salida |
|---|---|---|---|---|
| `instalar.sh` | Instalación | Instala en Kali Linux las dependencias del toolkit | — | Paquetes instalados |
| `actualizar.sh` | Mantenimiento | Actualiza el repositorio/dependencias | — | Repo actualizado |
| `fqdnaudit.sh` | Servidor (auto) | Puertos/servicios y CVEs, servidor web y vulns públicas, TLS/cifrados débiles, certificado CA, cabeceras de seguridad, métodos HTTP, anti-DoS/DDoS, cookies | FQDN / IP | Informe en consola/fichero |
| `fqdnaudit2.sh` | Servidor (auto) | Variante/ampliación de `fqdnaudit.sh` | FQDN / IP | Informe |
| `apitest.sh` | API (manual) | ACL/whitelisting, API Gateway, OAuth2/JWT, WebAuthn, Leveled API Keys, manejo de errores, validación de entradas | Endpoint API + contexto/credenciales | Informe de hallazgos |
| `xsstest.sh` | Vulnerabilidad | Pruebas de XSS sobre endpoints, apoyado en `xss-payloads.txt` | URL/endpoint | Resultados de inyección |
| `qtls.sh` / `qtls2.sh` | TLS | Evaluación de configuración TLS/SSL y cifrados (apoyo: `cifrados.xls`, `qtls.png`) | FQDN / IP | Informe de cifrados |
| `github.sh` / `github0.sh` | Reconocimiento | Búsqueda de información/exposición relacionada en GitHub | Términos / organización | Listado de hallazgos |
| `txt2pdf.sh` | Utilidad | Convierte informes `.txt` a `.pdf` | Fichero `.txt` | Fichero `.pdf` |
| `diccionario.txt` | Recurso | Wordlist genérica para fuzzing/fuerza bruta | — | — |
| `x-cabeceras.txt` | Recurso | Referencia de cabeceras de seguridad HTTP a verificar | — | — |
| `xss-payloads.txt` | Recurso | Payloads usados por `xsstest.sh` | — | — |
| `cifrados.xls` | Recurso | Referencia de cifrados TLS y su nivel de seguridad | — | — |
| `api.txt` | Recurso | Rutas típicas para descubrir APIs | — | — |

> Nota: las descripciones anteriores se basan en el nombre de cada script y en el
> README del repositorio, no en una lectura línea a línea del código fuente. Si al
> ejecutarlos el comportamiento real difiere, ajusta esta tabla en consecuencia.

## Checklist de controles de seguridad (para el informe final)

Usa esta lista para estructurar hallazgos y recomendaciones, agrupando por
control en vez de por script:

- Control de acceso granular por endpoint
- Cifrado HTTPS en todas las comunicaciones
- Sanitización y validación de entradas (y salidas)
- Rate limiting / limitación de tasa
- Mensajes de error que no revelan información sensible
- Cifrado de datos en tránsito y en reposo
- Logging y auditoría exhaustivos
- Restricción de intentos de login (anti fuerza bruta)
- Versionado de API bien gestionado (v1, v2, v3...)
- Cabeceras de seguridad (CSP, X-XSS-Protection, etc.)
- Configuración CORS restrictiva
- Expiración corta de tokens de acceso
- Documentación de la API sin datos internos sensibles
- Pruebas de seguridad periódicas (hacking ético)
- Desactivación de mensajes de error por defecto del framework
- Gestión segura de sesiones (invalidación correcta)
- Tokens CSRF donde aplique
- Actualizaciones y parches de seguridad al día

## Al redactar el informe para el usuario

- Indica claramente qué script/prueba generó cada hallazgo.
- Clasifica la severidad (crítica/alta/media/baja) y referencia el ítem del
  OWASP API Security Top 10 correspondiente cuando aplique.
- Prioriza remediaciones accionables antes que un volcado literal de la salida
  de las herramientas.
- Si el usuario pide el informe en PDF, recuerda `txt2pdf.sh` como opción del
  propio toolkit.

## Referencias

- Repositorio: https://github.com/hackingyseguridad/apiaudit
- OWASP API Security Top 10: https://portswigger.net/web-security/api-testing/top-10-api-vulnerabilities
- Autor: http://www.hackingyseguridad.com/
