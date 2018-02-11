echo "---------------------------------"
echo "-----installation de mongodb-----"
echo "---------------------------------"


sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

sudo apt-get update

sudo apt-get install -y mongodb-org

echo "-----------------------------------"
echo "-----installation de robomongo-----"
echo "-----------------------------------"

wget "https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz" -O robomongo.tar.gz

tar xzvf robomongo.tar.gz
rm -R robomongo.tar.gz

mv robo3t-1.1.1-linux-x86_64-c93c6b0 robomongo
service mongod start

./robomongo*/bin/robomongo 

