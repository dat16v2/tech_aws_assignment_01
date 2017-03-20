mkdir static
VER="$(git rev-parse HEAD)"
echo "$VER" > static/var/version.txt
mvn package
