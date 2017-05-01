sudo yum install -y epel-release
sudo yum install -y wget vim git
wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export GOBIN=$HOME/go/bin' >> $HOME/.bashrc
source $HOME/.bashrc
go get github.com/GeertJohan/go.rice
go get github.com/codegangsta/negroni
go get github.com/urfave/negroni
go get github.com/gorilla/context
go get github.com/gorilla/mux
go get github.com/gorilla/sessions
mkdir $HOME/go/src/faker.clausen
mkdir $HOME/go/src/faker.clausen/root
mv $HOME/stil-status $HOME/go/src/faker.clausen/root/stil-status
cd $HOME/go/src/faker.clausen/root/stil-status
go build server.go
sudo cp $HOME/keatech.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable keatech.service
sudo systemctl start keatech.service
