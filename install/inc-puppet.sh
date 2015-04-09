
function install_puppet {
  OS=`head -n1 /etc/issue | cut -f1 -d\ `
	echo Installing puppet
	if [ "$OS" == "CentOS" -o "$OS" == "RedHat" ]
	then
		EL_MAJ_VER=`head -n1 /etc/issue | cut -f3 -d\ | cut -f1 -d.`
		rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-${EL_MAJ_VER}.noarch.rpm
		yum install -y puppet
	fi

	if [ "$OS" == "Debian" -o "$OS" == "Ubuntu" ]
	then
		apt-get update
		apt-get install apt-utils -y

    export DEBIAN_FRONTEND=noninteractive
		wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
		apt-get install puppet -y

	fi
}
