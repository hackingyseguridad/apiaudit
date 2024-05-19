#!/bin/bash
echo "API Github test"
echo "DOC https://docs.github.com/es/authentication"
echo "DOC https://docs.github.com/es/rest?"
echo "API Key Github https://github.com/settings/tokens"
echo "API Key https://github.com/settings/personal-access-tokens/3307043"
echo
echo "(C) hackingyseguridad.com 2024"
echo
echo "Uso.: ./github.sh <parametros api>"
echo

curl -k -s --http1.1 -v -X GET  "https://api.github.com" $1 $2 $3 $4 \
-H "accept: json" \
-H "accept-language: es-ES,es;q=0.9,en;q=0.8" \
-H "Authorization: token  ghp_ELylM8fMpaTPtw8zYqCCehpANtt5EN4Gy5BP" \
-H "Content-type: application/json"\
-H "User-Agent: hackingyseguridad.com" \
-H 'origin: https://hackingyseguridad.com' \
-H "Referer: https://api.github.com" \
-H "User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0" \
-H "Accept: text/html, applicattion/xhtml+xml, application/xml;q=0.9,*/*;q=0.8" \
-H "Connection: keep-alive" \
-H 'X-Method-Override: POST' \
