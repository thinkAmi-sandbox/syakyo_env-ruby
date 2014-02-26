#
# Cookbook Name:: base
# Recipe:: default
#
# author: thinkAmi
#

return unless node['platform'] == "ubuntu"

apt_repository 'git' do
    uri 'http://ppa.launchpad.net/git-core/ppa/ubuntu'
    distribution node[:lsb][:codename]
    components [:main]
    keyserver 'keyserver.ubuntu.com'
    key 'E1DF1F24'
    notifies :run, 'execute[apt-get update]', :immediately
end
package 'git'

package "nodejs"

package "sqlitebrowser"


script "show_git_branch" do
  interpreter "bash"
  user        "root"
  code <<-'EOL'
    wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -P /home/vagrant
    chmod -R 777 /home/vagrant/git-completion.bash
    echo source /home/vagrant/git-completion.bash >> /home/vagrant/.bashrc
    echo GIT_PS1_SHOWDIRTYSTATE=true >> /home/vagrant/.bashrc

    echo -n export PS1=\' >> /home/vagrant/.bashrc
    echo -n '\[\033[01;32m\]\u@\[\033[01;33m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] ' >> /home/vagrant/.bashrc
    echo \' >> /home/vagrant/.bashrc

    source /home/vagrant/.bashrc
  EOL
end


script "create_gemrc" do
  interpreter "bash"
  user        "root"
  code <<-'EOL'
    echo 'install: --no-rdoc --no-ri' >> /home/vagrant/.gemrc
    echo -n 'update:  --no-rdoc --no-ri' >> /home/vagrant/.gemrc
    chmod -R 777 /home/vagrant/.gemrc
  EOL
end