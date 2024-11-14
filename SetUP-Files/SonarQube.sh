cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
unzip sonarqube-8.9.6.50800.zip
amazon-linux-extras install java-openjdk11 -y
useradd sonar
chown -R sonar:sonar sonarqube-8.9.6.50800.zip
su - sonar
cd /opt/sonarqube-8.9.6.50800/bin/linux/
sh sonar.sh start
sh sonar.sh status