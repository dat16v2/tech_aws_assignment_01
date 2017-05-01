sudo yum install -y epel-release
sudo yum install -y wget vim redis git
sudo systemctl start redis
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export GOBIN=$HOME/go/bin' >> $HOME/.bashrc
source $HOME/.bashrc
go get github.com/GeertJohan/go.rice
go get github.com/codegangsta/negroni
go get github.com/go-sql-driver/mysql
go get github.com/gorilla/context
go get github.com/gorilla/mux
go get github.com/gorilla/sessions
go get github.com/gorilla/websocket
go get github.com/garyburd/redigo/redis
go get github.com/yohcop/openid-go
mkdir $HOME/go/src/faker.clausen
mkdir $HOME/go/src/faker.clausen/root
mv $HOME/csgojackpot $HOME/go/src/faker.clausen/root/csgojackpot
cd $HOME/go/src/faker.clausen/root/csgojackpot
go build main.go
./main
