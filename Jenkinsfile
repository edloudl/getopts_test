pipeline{
    agent any
    stages{
	stage('Pre-Run Clean Up'){
		steps{
			sh '''
			sudo 	rm -rf /home/vagrant/rpmbuild
			sudo    rm -rf /opt/*
			'''
		}
	}
        stage('Pre-Req install on the server'){
            steps{
                sh '''
                    sudo yum install -y epel-release
                    tools=(git bats rpmdevtools rpmlint)
                    for tool in ${tools[@]}
                        do
                            if [[ ! $(which ${tool}) ]];then
                             sudo  yum install -y ${tool}
                            fi
                        done
                '''
            }
        }
        stage('testing the executables'){
            steps{
               sh '''
                    bats test.bats
                '''
            }
        }

        stage('Setting up packaging Environment'){
            steps{
                sh '''
                    
                    rpmdev-setuptree
                    if [[ -e /home/vagrant/rpmbuild/SPECS ]];then
                        rpmdev-newspec /home/vagrant/rpmbuild/SPECS/hello.spec
                        
                        echo "
Name:           hello
Version:        0.0.1 
Release:        1%{?dist}
Summary:        Small epic script but not really usable
Group:          Utilities
License:        GPL
Source0:        hello-%{version}.tgz
BuildArch:      noarch
%description
Small epic script that prints some stuff
%prep
%setup -q
%install
rm -rf $RPM_BUILD_ROOT
sudo install -d /home/vagrant/rpmbuild/BUILDROOT/hello-0.0.1-1.el7.x86_64/opt/hello
sudo install hello.sh /home/vagrant/rpmbuild/BUILDROOT/hello-0.0.1-1.el7.x86_64/opt/hello/hello
%clean
rm -rf $RPM_BUILD_ROOT
%files
%defattr(-,root,root,-)
/opt/hello/hello
%doc
%changelog
                        " > /home/vagrant/rpmbuild/SPECS/hello.spec
                    fi
                '''
            }
        }
        stage('Packaging the  executable into RPM package'){
            steps{
                sh '''
		    if [[ ! -e hello ]];then
                    	mkdir hello
		    fi
                        chmod +x hello.sh
	  		mv hello.sh hello/hello
		   '''
		}
	}
	stage('Tar GZ the app folder'){
		steps{
		sh '''
                    tar cvzf /home/vagrant/rpmbuild/SOURCES/hello.tgz hello-0.0.1
		   '''
		}
	}
	stage('Building the RPM package'){
		steps{
		sh '''
                    rpmbuild -bb /home/vagrant/rpmbuild/SPECS/hello.spec
               	   '''
            }
        }

        stage('trying to test installation of package'){
            steps{
                sh '''
                    sudo rpm -ivh /home/vagrant/rpmbuild/RPMS/noarch/hello*.rpm
                '''
            }
        post {
            always {
	    cleanWs deleteDirs: true, patterns: [[pattern: '/home/vagrant', type: 'INCLUDE']]
            }
          }    

        }
    }
}
