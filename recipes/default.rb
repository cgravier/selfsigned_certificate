#
# Cookbook Name:: selfsigned_certificate
# Recipe:: default
#
# Copyright (C) 2013 Christophe Gravier, Universite Jean Monnet
#
# Licence : Apache 2.0 
#

# install openssl if not present
package "openssl" do
  action :install
end

# create output dir
log "Creating #{node['selfsigned_certificate']['destination']} (here is stored the self-signed certificate)"
directory node['selfsigned_certificate']['destination'] do
    owner "root"
    group "root"
    mode 0755
    action :create
    recursive true
end


# create the certificate: make a request for signature for a certiciate, and have your own CA sign it.
log "Running : openssl genrsa -passout pass:#{node[:selfsigned_certificate][:sslpassphrase]} -des3 -out server.key 1024"
bash "generate certificate" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  code <<-EOH
        openssl genrsa -passout pass:#{node[:selfsigned_certificate][:sslpassphrase]} -des3 -out server.key 1024
        EOH
end

log "Running : openssl req -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -subj \"/C=#{node[:selfsigned_certificate][:country]}/ST=#{node[:selfsigned_certificate][:state]}/L=#{node[:selfsigned_certificate][:city]}/O=#{node[:selfsigned_certificate][:orga]}/OU=#{node[:selfsigned_certificate][:depart]}/CN=#{node[:selfsigned_certificate][:cn]}/emailAddress=#{node[:selfsigned_certificate][:email]}\" -new -key server.key -out server.csr"
bash "generate signature request" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  code <<-EOH
        openssl req -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -subj "/C=#{node[:selfsigned_certificate][:country]}/ST=#{node[:selfsigned_certificate][:state]}/L=#{node[:selfsigned_certificate][:city]}/O=#{node[:selfsigned_certificate][:orga]}/OU=#{node[:selfsigned_certificate][:depart]}/CN=#{node[:selfsigned_certificate][:cn]}/emailAddress=#{node[:selfsigned_certificate][:email]}" -new -key server.key -out server.csr
        EOH
end

log "Running: openssl rsa -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -in server.key.org -out server.key"
bash "sign key" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  code <<-EOH
        cp server.key server.key.org
        openssl rsa -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -in server.key.org -out server.key
        EOH
end

log "Running: openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt"
bash "signing the certificate" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  code <<-EOH
        openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
        EOH
end


