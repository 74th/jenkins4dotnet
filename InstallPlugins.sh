# init jenkins 
service jenkins start

echo waiting for jenkins start
sleep 1m

# TODO behind proxy

# get jenkins cli command
echo wget http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar -P /root/
wget http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar -P /root/

echo install git plugin
java -jar /root/jenkins-cli.jar -s http://127.0.0.1:8080 install-plugin git

echo install msbuild plugin
java -jar /root/jenkins-cli.jar -s http://127.0.0.1:8080 install-plugin msbuild

echo restart jenkins
java -jar /root/jenkins-cli.jar -s http://127.0.0.1:8080 restart

echo waiting for jenkins restart
sleep 1m
