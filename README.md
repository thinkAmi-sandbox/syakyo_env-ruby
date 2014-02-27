syakyo_env-ruby
===============

## Getting Started

1. Install tools
 * VirtualBox
 * Vagrant
 * vagrant-omnibus plugin
 * Ruby  
　
2. Install Bundler gem  
 `gem install bundler`  
　
3. Clone  
 `git clone https://github.com/thinkAmi/syakyo_env-ruby.git`  
　
4. Install gems  
 `cd syakyo_env-ruby`  
 `bundle install --path vendor/bundle`  
　
5. Install Cookbooks  
 `cd syakyo\chef-repo`  
 `bundle exec berks install --path cookbooks`  
　
6. Start  
 `cd ..`  
 `vagrant up`  
　

## Tested environment
 * Windows7 x64
 * Ruby 2.0.0 (RubyInstaller)
 * Vagrant 1.4.3
  * vagrant-omnibus 1.3.0
 * VirtualBox 4.3.6
 * knife-solo 0.4.1
 * Berkshelf 2.0.14
 * Bundler 1.5.3