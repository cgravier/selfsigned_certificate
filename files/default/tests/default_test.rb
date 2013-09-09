require 'minitest/spec'
describe_recipe 'selfsigned_certificate::default' do
        file('/etc/hosts').must_exist
end
