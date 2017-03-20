mkdir static
VER="$(git rev-parse HEAD)"
echo "$VER" > static/version.txt
mvn package
