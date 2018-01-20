cd /installers
sudo -i

##TOOLING
#install git
echo "INSTALLING GIT"
dnf -q install git-all -y
echo "GIT DONE"

##RUNTIMES
#install java
echo "INSTALLING JDK"
rpm -Uvh jdk-8u162-linux-x64.rpm
echo "JDK DONE"


echo "CONFIGURING ORACLE JDK AS DEFAULT"
## java ##
alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 200000
## javaws ##
alternatives --install /usr/bin/javaws javaws /usr/java/latest/jre/bin/javaws 200000
## Java Browser (Mozilla) Plugin 64-bit ##
alternatives --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/latest/jre/lib/amd64/libnpjp2.so 200000
## Install javac only if you installed JDK (Java Development Kit) package ##
alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000
alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 200000
echo "CONFIG DONE"

#python / anaconda
echo "INSTALLING ANACONDA"
wget -q https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
bash Anaconda3-5.0.1-Linux-x86_64.sh -b -p /opt/anaconda
echo "ANACONDA DONE"

#BUILDTOOLS
#SBT/Scala with ensime plugin
echo "INSTALLING SBT / ENSIME PLUGIN"
curl -s https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
dnf -q install sbt
mkdir -p ~/.sbt/1.0/plugins
echo 'addSbtPlugin("org.ensime" % "sbt-ensime" % "2.1.0")' >> ~/.sbt/1.0/plugins/plugins.sbt
echo "SBT DONE"

#Maven
echo "INSTALLING MAVEN"
wget -q http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
tar xzf apache-maven-3.5.2-bin.tar.gz
mkdir /opt/maven
cp -r apache-maven-3.5.2/* /opt/maven
echo "MAVEN DONE"

#Gradle
echo "INSTALLING GRADLE"
wget -q https://services.gradle.org/distributions/gradle-4.4.1-bin.zip
mkdir /opt/gradle
unzip -q -d /opt/gradle gradle-4.4.1-bin.zip
echo "GRADLE DONE"

#Various Cool shit
#ammonite
echo "INSTALLING AMMONITE"
sudo curl -s -L -o /usr/local/bin/amm https://git.io/vdNv2 && sudo chmod +x /usr/local/bin/amm
echo "AMMONITE DONE"

#oh-my-zsh
echo "INSTALLING OH MY ZSH"
dnf -q install util-linux-user -y
dnf -q install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/.oh-my-zsh/plugins
chsh -s /bin/zsh
#clone repo
git clone https://github.com/powerline/fonts.git
cd fonts
#start install script
sudo ./install.sh
#move to zsh plugin folder
cd ~/.oh-my-zsh/plugins
#clone repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd /installers
cp /dist_zsh/.zshrc ~/.zshrc
echo "ZSH DONE"

#install terminator
echo "INSTALLING TERMINATOR"
dnf -q install terminator -y 
echo "TERMINATOR DONE"

#install ansible
echo "INSTALLING ANSIBLE"
dnf -q install ansible -y
echo "ANSIBLE DONE"

#install spark
echo "INSTALLING SPARK"
wget -q http://mirror.switch.ch/mirror/apache/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz 
tar -xzf spark-2.2.1-bin-hadoop2.7.tgz 
mkdir /opt/spark-2_2_1
cp -r spark-2.2.1-bin-hadoop2.7/* /opt/spark-2_2_1
echo "SPARK DONE"

#vivaldi
echo "INSTALLING VIVALDI"
dnf -q install https://downloads.vivaldi.com/stable/vivaldi-stable-1.13.1008.40-1.x86_64.rpm -y
echo "VIVALDI DONE"

#emacs
echo "INSTALLING EMACS"
dnf -q install emacs -y
mkdir -p ~/.emacs.d
cp -r /dist_emacs/* ~/.emacs.d
echo "EMACS DONE"

#intellij
echo "DOWNLOADING INTELLIJ"
wget -q https://download.jetbrains.com/idea/ideaIU-2017.3.3-no-jdk.tar.gz
echo "INTELLIJ DOES NOT SUPPORT SILENT INSTALLATION, INSTALL TO OPT"

#deploy .ssh keys
mkdir -p ~/.ssh
cp -r /dist_ssh/* ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*


