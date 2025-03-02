

# Ejecuta apiaudit y genera un informe en resultado.pdf

echo "fqdn audit genera report pdf "
echo
chmod 777 fqdnaudit.sh
./fqdnaudit.sh $1 $2 | tee resultado.txt
sudo apt-get install asciidoc


a2x -f pdf resultado.txt
echo
echo "- hecho!!, generado resultado.pdf"
echo

